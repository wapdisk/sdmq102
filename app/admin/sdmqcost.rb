ActiveAdmin.register Sdmqcost do
  menu priority: 2, label:  proc{t("active_admin.sdmqcost") }
  permit_params :yearmonth,:costtype, :cost

  controller do
    before_filter { @page_title = t("active_admin.sdmqcost") }
  end

  index do
    selectable_column
    id_column
    column :yearmonth do |u|  
      DateTime.parse(u.yearmonth.to_s).strftime("%Y-%m").to_s
    end
    column :costtype
    column :cost do |u|  
      number_to_currency(u.cost,  :unit=>"￥") 
    end
    actions
  end

  filter :yearmonth
  filter :costtype
  filter :cost

  form do |f|
    f.semantic_errors
    f.inputs t("active_admin.sdmqcost")+t("active_admin.details") do
      f.input :yearmonth, :discard_day => true
      f.input :costtype,  :as => :select, :collection => [t("w_cost"), t("e_cost"), t("m_cost")], include_blank: false
      f.input :cost
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

