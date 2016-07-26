ActiveAdmin.register Notice do
  permit_params :username,:title, :body

  index do
    selectable_column
    id_column
    column :username
    column :title
    column :body
    column :created_at
    actions
  end

  filter :username
  filter :title
  filter :body
  filter :created_at

  form do |f|
    f.inputs "Notice Details" do
      f.input :username, :input_html => { :value => current_admin_user.username ,:readonly => true}
      f.input :title
      f.input :body
    end
    f.actions
  end

end

