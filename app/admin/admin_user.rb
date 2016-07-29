ActiveAdmin.register AdminUser do
  menu priority: 6, label:  proc{t("active_admin.admin_user") }
  permit_params :username,:email,:mobilephone, :password, :password_confirmation

  controller do
    before_filter { @page_title = t("active_admin.admin_user")  }
  end

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :mobilephone
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :username
  filter :email
  filter :mobilephone
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs t("active_admin.sdmqcost")+t("active_admin.details") do
      f.input :username
      f.input :email
      f.input :mobilephone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  sidebar :help do
    ul do
      li t("help_mobilephone")
      li t("help_email")
    end
  end

end
