ActiveAdmin.register Sdmqcost do
  menu priority: 2, label:  I18n.t("active_admin.sdmqcost") 
  permit_params :yearmonth,:costtype, :cost

        controller do
      before_filter { @page_title = I18n.t("active_admin.sdmqcost") }
    end

  index do
    selectable_column
    id_column
    column :yearmonth
    column :costtype
    column :cost
    actions
  end

  filter :yearmonth
  filter :costtype
  filter :cost
  filter :created_at

  form do |f|
    f.inputs "Sdmqcost Details" do
      f.input :yearmonth, :as => :datepicker
      f.input :costtype,  :as => :select,      :collection => ["水费", "电费", "煤气费"], include_blank: false
      f.input :cost
    end
    f.actions
  end

end

