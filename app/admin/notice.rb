ActiveAdmin.register Notice do
  menu priority: 7, label: proc{ t("active_admin.notice") }
  permit_params :username,:title, :body

  controller do
    before_filter { @page_title = t("active_admin.notice") }
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
    f.inputs t("active_admin.sdmqcost")+t("active_admin.details") do
      f.input :username, :input_html => { :value => current_admin_user.username ,:readonly => true}
      f.input :title
      f.input :body
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

