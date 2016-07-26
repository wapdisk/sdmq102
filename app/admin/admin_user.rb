ActiveAdmin.register AdminUser do
  menu priority: 7, label:  I18n.t("active_admin.admin_user") 
  permit_params :email,:username, :mobilephone, :password, :password_confirmation

          controller do
      before_filter { @page_title = I18n.t("active_admin.admin_user") }
    end

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :mobilephone
    # column :current_sign_in_at
    column :sign_in_count
    # column :created_at
    actions
  end

  filter :email
  filter :username
  filter :mobilephone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :username
      f.input :mobilephone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
