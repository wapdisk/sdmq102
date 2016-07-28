ActiveAdmin.register AdminUser do
  menu priority: 7, label:  proc{I18n.t("active_admin.admin_user") }
  permit_params :email,:username, :mobilephone, :password, :password_confirmation

          controller do
      before_filter { @page_title = I18n.t("active_admin.admin_user")  }
    end

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :mobilephone
    column :current_sign_in_at
    column :created_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :username
  filter :mobilephone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs "Admin Details" do
      f.input :email
      f.input :username
      f.input :mobilephone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  sidebar :help do
  ul do
    li "联系电话：15721552663"
    li "邮箱：924211739@qq.com"
  end
end

end
