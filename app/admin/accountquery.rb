ActiveAdmin.register Accountquery do
  menu priority: 4, label:  proc{ I18n.t("active_admin.accountquery") }
  permit_params :account,:accounttype, :query_url

      controller do
        before_filter { @page_title =  I18n.t("active_admin.accountquery") }
      end

  index do
    selectable_column
    id_column
    column :account
    column :accounttype
    column :query_url  do |post|
      link_to post.query_url, post.query_url
    end
    actions
  end

  filter :account
  filter :accounttype
  filter :query_url
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs "Account Details" do
      f.input :account
      f.input :accounttype,  :as => :select,      :collection => ["水费", "电费", "煤气费"], include_blank: false
      f.input :query_url
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

