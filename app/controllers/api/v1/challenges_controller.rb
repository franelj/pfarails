class Api::V1::ChallengesController < Api::V1::ApplicationController
  def submit_photo
    check_params_keys_presence :challenge, :photo

    # /home/deployer/pfarecofaciale/LBPModelPrediction/test
    # Prends en paramètre le model (voir users_controller#submit_video) et un path vers l'image à comparer
    # Il renvoit 0 pour succès ou -1 en cas d'échec
    c = Challenge.active.where(id: params[:challenge]).take
    if c
      name = "challenge-#{c.id}-user#{current_user.id}"
      directory = "/var/www/spotnsnap/current/public/challenges-images"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:photo].read) }
      opponent = c.user1 == current_user ? c.user2 : c.user1
      isandroid = 1
      if current_user.gcm_registration.nil?
        isandroid = 0
      end
      command = "/home/deployer/pfarecofaciale/LBPModelPrediction/test /var/www/spotnsnap/current/public/models/#{opponent.photo_model} #{path} #{isandroid}"
      output = `#{command}`
      if output == "0"
        c.active = nil
        if c.save
          users = [c.user1, c.user2]
          users.each do |u|
            u.points += 10
            u.save
            c.notify_end(false)
          end
          find_chat_room (users)
        else
          render_json_error 400, "Une erreur est survenue lors de l'enregistrement"
        end
      else
        render_json_error 400, "Cette photo ne semble pas être celle de votre adversaire !"
      end
      #File.delete path
    else
      render_json_error 400, "Ce défi n'existe pas ou n'est plus en actif"
    end
  end

  def show
    check_params_keys_presence :challenge_id
    @challenge = Challenge.find(params[:challenge_id])

    raise AuthenticationException.new("Vous devez faire partie du challenge pour le voir") unless @challenge.users.include? current_user
    render json: @challenge
  end

  def get_current
    torender = current_user.challenges.active.take
    if torender.nil?
      render_json_error 400, "No current challenge"
    else
      render json: torender
    end
  end

  private

  def find_chat_room(users)
    final_room = nil
    # Search for an existing room
    current_user.chat_rooms.each do |room|
      next if room.users.length != users.length
      notfound = false
      users.each do |recipient| notfound = true unless room.users.include? recipient end
      unless notfound
        final_room = room
        break
      end
    end

    # No room has been found : create a new one
    if final_room.nil?
      final_room = ChatRoom.new
      users.each do |recipient| final_room.users << recipient end
      final_room.save
    end
    render json: final_room
  end
end
