ActiveAdmin.register Accountquery do
  permit_params :account,:accounttype, :query_url

  index do
    selectable_column
    id_column
    column :account
    column :accounttype
    column :query_url
    actions
  end

  filter :account
  filter :accounttype
  filter :query_url
  filter :created_at

  form do |f|
    f.inputs "Account Details" do
      f.input :account
      f.input :accounttype
      f.input :query_url
    end
    f.actions
  end

end

