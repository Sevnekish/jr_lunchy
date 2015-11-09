ActiveAdmin.register User do
  config.per_page = 20

  permit_params :name, :email, :password, :password_confirmation, :organization_id

  scope :joined, :default => true do |users|
    users.includes [:organization]
  end

  index do
    column :id
    column :email
    column :name
    column :organization, :sortable => 'organizations.name'
    column :admin
    column :provider
    column :uid
    column :auth_token
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :organization
    end
    f.actions
  end

end
