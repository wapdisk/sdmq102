ActiveAdmin.register Accountquery do
  menu priority: 4, label:  proc{ t("active_admin.accountquery") }
  permit_params :account,:accounttype, :query_url

  controller do
    before_filter { @page_title =  t("active_admin.accountquery") }
  end

  index do
    selectable_column
    id_column
    column :account
    column :accounttype
    column :query_url  do |u|
      link_to u.query_url, u.query_url
    end
    actions
  end

  filter :account
  filter :accounttype
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs t("active_admin.sdmqcost")+t("active_admin.details") do
      f.input :account
      f.input :accounttype,  :as => :select, :collection => [t("w_cost"), t("e_cost"), t("m_cost")], include_blank: false
      f.input :query_url
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

