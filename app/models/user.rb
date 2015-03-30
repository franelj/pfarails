class User < ActiveRecord::Base
  include ActionView::Helpers::AssetUrlHelper

  scope :challengeable, -> { where("status = ? AND photo <> '' AND photo_model <> ''", User.statuses[:online]) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_one :gcm_registration, dependent: :destroy
  has_one :apple_registration, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :partner_offers, dependent: :destroy
  has_many :partner_offers_historics, dependent: :destroy
  has_many :challenges_as_u1, class_name: "Challenge", foreign_key: 'user1_id', dependent: :destroy
  has_many :challenges_as_u2, class_name: "Challenge", foreign_key: 'user2_id', dependent: :destroy
  has_and_belongs_to_many :chat_rooms
  before_create :generate_authentication_token
  before_destroy :destroy_images
  attr_accessor :rank
  validates :username, presence: true, uniqueness: {case_sensitive: true},
            exclusion: { in: %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock admin moderateur administrateur administrator),
                         message: "%{value} est un login réservé." }
  validates :username, length: { in: 4..20 }
  enum role: [:user, :partner, :admin]
  enum status: [:online, :offline]

  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  def generate_authentication_token
    token = ""
    loop do
      token = Devise.friendly_token
      break unless User.where(authentication_token: token).first
    end
    self.authentication_token = token
    token
  end

  def generate_authentication_token!
    generate_authentication_token
    self.save
    self.authentication_token
  end

  def challenges
    @challenges ||= Challenge.where("user1_id = ? OR user2_id = ?", self, self)
  end

  def is_in_challenge?
    not self.challenges.active.empty?
  end

  def rank
    all = User.all.order(points: :desc)
    all.map(&:id).index(self.id) + 1
  end

  def as_json(options={})
    {
        id: id,
        username: username,
        photo: ((photo != nil && photo.length > 0 && photo_model != nil && photo_model.length > 0) ? photo_url : nil),
        created_at: created_at,
        updated_at: updated_at,
        points: points,
        rank: rank,
        online: (online? ? true : false)
    }
  end

  def generate_model_from_photo
    dirpath = "/var/www/spotnsnap/current/public/videos/frames-#{id}"
    outputpath = "/var/www/spotnsnap/current/public/models/model-#{id}"
    command = "/home/deployer/pfarecofaciale/LBPModelCreation/create_eigen_model #{dirpath} #{outputpath}"
    output = `#{command}`
    if (output == "0")
      self.photo_model = "model-#{id}"
    else
      self.photo = nil
    end
    save
    FileUtils.rm_rf(dirpath)
  end
  handle_asynchronously :generate_model_from_photo

  def photo_url
    unless photo.nil?
      image_url photo
    else
      nil
    end
  end

  private

  def destroy_images
    FileUtils.rm_rf("/var/www/spotnsnap/current/public/models/#{photo_model}")
    FileUtils.rm_rf("/var/www/spotnsnap/current/public/images/#{photo}")
  end
end
