ActiveAdmin.register Paycondition do
  permit_params :username,:yearmonth, :ispay,:islive

  index do
    selectable_column
    id_column
    column "Username" do |u|
      usr = AdminUser.find(u.username).username
    end
    column :yearmonth
    column :ispay
    column :islive
    column :created_at
    actions
  end

  filter :username
  filter :yearmonth
  filter :ispay
  filter :islive
  filter :created_at

  form do |f|
    f.inputs "Paycondition Details" do
      f.input :username, :as => :select,      :collection => AdminUser.all, include_blank: false
      f.input :yearmonth, :as => :datepicker
      f.input :ispay
      f.input :islive
    end
    f.actions
  end

end

