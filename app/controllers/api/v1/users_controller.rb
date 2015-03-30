class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_filter :check_user_photo!, only: [:login, :register, :upload_video, :current]
  skip_before_filter :authenticate!, only: [:login, :register]

  def index
    check_params_keys_presence :page, :per_page

    @users = User.where("photo <> '' AND photo_model <> ''").order(points: :desc).page(params[:page]).per(params[:per_page])
    render json: @users
  end

  def login
    check_params_keys_presence :email, :password

    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      @user.generate_authentication_token!
      @user.online!
      @user.reload
      render json: { token: @user.authentication_token}
    else
      raise Api::V1::AuthenticationException.new("Invalid email/password")
    end
  end

  def logout
    current_user.offline!
    render_json_message "Logout successful"
  end

  def switch_online
    if current_user.offline?
      current_user.online!
    else
      current_user.offline!
    end
    render_json_message "Status changed"
  end

  def authentication_error(exception)
    render json: { message: exception.message }, status: 401
  end

  def register
    check_params_keys_presence :username, :email, :password

    if User.validates_uniqueness_of(:username)
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save
        render_json_message "Registration is successful, you can now log in"
      else
        render_json_error 400, @user.errors.full_messages.first
      end
    end
  end

  def show
    check_params_keys_presence :id

    @user = User.find(params[:id])
    render json: @user
  end

  def register_gcm
    check_params_keys_presence :registration_id

    @gcm_registration = GcmRegistration.find_by_user_id(current_user)
    @gcm_registration = GcmRegistration.new(user: current_user) if @gcm_registration.nil?
    @gcm_registration.registration_id = params[:registration_id]
    if @gcm_registration.save
      ar = AppleRegistration.find_by_user_id(current_user)
      ar.delete unless ar.nil?
      render json: @gcm_registration
    else
      render_json_error 400, "Can't register GCM : #{@gcm_registration.errors.full_messages.first}"
    end
  end

  def register_apple
    check_params_keys_presence :device_token

    @apple_registration = AppleRegistration.find_by_user_id(current_user)
    @apple_registration = AppleRegistration.new(user: current_user) if @apple_registration.nil?
    @apple_registration.device_token = params[:device_token]
    if @apple_registration.save
      gc = GcmRegistration.find_by_user_id(current_user)
      gc.delete unless gc.nil?
      render json: @apple_registration
    else
      render_json_error 400, "Can't register Apple Device Token : #{@apple_registration.errors.full_messages.first}"
    end
  end

  def upload_video
    check_params_keys_presence :file

    # /home/deployer/pfarecofaciale/videoToImgs/videoToImgs
    # Prends en paramètre : Path vers fichier vidéo | path vers directory d'output (déjà crée) qui va enregistrer chaque frame
    # Retourne en cas de succès le nom du fichier (fram_XXX.png) qui est l'image de profile

    # Ensuite pour créer le modèle (à faire en asynchrone une fois l'image de profile extraite/validé)
    # /home/deployer/pfarecofaciale/LBPModelCreation/create_eigen_model
    # Prends en paramètre le dossier de frames crée par l'extraction d'image de profile, et le path vers le fichier d'output
    # Retourne 0 en cas de succès et -1 en cas d'échec

    name = "video-#{current_user.id}"
    directory = "/var/www/spotnsnap/current/public/videos"
    path = File.join(directory, name)
    dirpath = "/var/www/spotnsnap/current/public/videos/frames-#{current_user.id}"
    FileUtils.rm_rf(dirpath)
    FileUtils.rm_rf(path)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    Dir.mkdir dirpath
    isandroid = 1
    if current_user.gcm_registration.nil?
      isandroid = 0
    end
    command = "/home/deployer/pfarecofaciale/videoToImgs/videoToImgs #{path} #{dirpath} #{isandroid}"
    output = `#{command}`
    if output == "0"
      oldpath = File.join(dirpath, "profile.jpg")
      newpath = "/var/www/spotnsnap/current/public/images/profile-#{current_user.id}.jpg"
      FileUtils.cp oldpath, newpath
      #FileUtils.rm oldpath
      #FileUtils.rm_rf path
      current_user.photo = "profile-#{current_user.id}.jpg"
      if current_user.save
        current_user.generate_model_from_photo
        render json: { photo: current_user.photo_url }
        return
      else
        render_json_error 400, "An error has occurred during video upload and validation : could not save information."
      end
    else
      #FileUtils.rm_rf path
      #FileUtils.rm_rf dirpath
      render_json_error 400, "An error has occurred during video upload and validation : #{output}."
    end
  end

  def current
    render json: current_user
  end
end
