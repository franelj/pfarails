ActiveAdmin.register ChatMessage do
  index do
    column :id
    column :chat_room
    column :message
    column :created_at
    actions
  end

  form do |f|
    inputs 'Informations' do
      input :chat_room
      input :message
    end
    actions
  end

  filter :id
  filter :chat_room
  filter :message
  filter :created_at
end
