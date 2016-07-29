ActiveAdmin.register Paycondition do
  menu priority: 5, label: proc{ t("active_admin.paycondition")}
  permit_params :username,:yearmonth,:islive,:ispay

  controller do
    before_filter { @page_title = t("active_admin.paycondition") }
  end

  index do
    selectable_column
    id_column
    column :yearmonth do |u|  
      DateTime.parse(u.yearmonth.to_s).strftime("%Y-%m").to_s
    end
    column :username do |u|
      usr = AdminUser.find(u.username).username
    end
    column :islive
    column :ispay
    column :created_at
    actions
  end


  filter :yearmonth
  filter :username
  filter :islive
  filter :ispay

  form do |f|
    f.semantic_errors
    f.inputs t("active_admin.sdmqcost")+t("active_admin.details") do
      f.input :yearmonth, :discard_day => true
      f.input :username, :as => :select, :collection => AdminUser.all, include_blank: false
      f.input :islive
      f.input :ispay
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

