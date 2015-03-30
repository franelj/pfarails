ActiveAdmin.register ChatRoom do
  actions :index, :destroy

  index do
    column :id
    column :users do |c|
      c.users.first.username.capitalize + " et " + c.users.last.username.capitalize
    end
    column :created_at
    actions
  end
end
