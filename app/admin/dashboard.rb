ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
        columns do
        column do
        panel "通知信息" do
          table_for Notice.order('username desc').limit(10).each do |customer|
            column(:created_at)
            column(:username) 
            column(:title)
            column(:body)

          end
        end
      end

    end # columns

    columns do
      column do
        panel "缴费清单" do
          table_for Sdmqcost.order('yearmonth desc').limit(4) do
            column(:yearmonth)  {|order|  DateTime.parse(order.yearmonth.to_s).strftime("%Y-%m").to_s }
            column(:costtype)
            column(:cost)   {|order|  number_to_currency(order.cost,  :unit=>"￥") }
          end
        end
      end
      column do
        panel "缴费状态" do
          table_for Paycondition.order('username desc').limit(10).each do |customer|
            column(:username)  {|u| usr = AdminUser.find(u.username).username }
            column(:yearmonth)  {|order|  DateTime.parse(order.yearmonth.to_s).strftime("%Y-%m").to_s }
            column(:ispay)
            column(:islive)
          end
        end
      end
    end # columns

    columns do
       column do
        panel "缴费账号" do
          table_for Accountquery.order('account desc').limit(10).each do |customer|
            column(:account) 
            column(:accounttype)
            column(:query_url) {|customer| link_to(customer.query_url, customer.query_url)}
          end
        end
      end
     column do
        panel "室友名单" do
          table_for AdminUser.order('username desc').limit(10).each do |customer|
            column(:username)  {|customer| link_to(customer.username, admin_admin_user_path(customer)) }
            column(:mobilephone)
          end
        end
      end
    end # columns

  end # content
end
