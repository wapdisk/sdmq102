ActiveAdmin.register Notice do
  menu priority: 6, label: proc{ I18n.t("active_admin.notice") }
  permit_params :username,:title, :body

    controller do
      before_filter { @page_title = I18n.t("active_admin.notice") }
    end

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
    f.semantic_errors
    f.inputs "Notice Details" do
      f.input :username, :input_html => { :value => current_admin_user.username ,:readonly => true}
      f.input :title
      f.input :body
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

