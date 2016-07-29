ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

        columns do
            column do
                panel t("active_admin.models.notice")  do
                  table_for Notice.order('created_at desc').limit(6).each do 
                    column t(:created_at),:created_at
                    column t(:username) ,:username
                    column t(:title),:title
                    column t(:body),:body
                  end
                end
              end
            column do
                panel t("active_admin.models.admin_user") do
                  table_for AdminUser.order('username desc').each do 
                    column t(:username),:username
                    column t(:email),:email 
                    column t(:mobilephone),:mobilephone
                  end
                end
            end
    end # columns

    columns do
      column do
        panel t("active_admin.models.sdmqcost")  do
          table_for Sdmqcost.order('yearmonth desc').limit(6).each do
            column(t(:yearmonth),:yearmonth)  {|u|  DateTime.parse(u.yearmonth.to_s).strftime("%Y-%m").to_s}
            column t(:costtype),:costtype
            column(t(:cost) ,:cost)  {|u|  number_to_currency(u.cost,  :unit=>"￥") }
          end
        end
      end

      column do
        panel t("active_admin.models.paycondition") do
          table_for Paycondition.order('yearmonth desc').limit(6).each do 
            column(t(:yearmonth),:yearmonth)  {|u|  DateTime.parse(u.yearmonth.to_s).strftime("%Y-%m").to_s }
            column(t(:username),:username)  {|u| usr = AdminUser.find(u.username).username }
            column t(:islive),:islive
            column t(:ispay),:ispay  
          end
        end
      end
      
      
    end # columns

    columns do
      column do
        panel t("active_admin.models.avgcost") do
          table_for Paycondition.select(:yearmonth,'count(1) as live_users',:sum_cost,'sum_cost/count(1) as avg_cost').where("islive like ?", "t%").group('yearmonth').joins("left join (select yearmonth,sum(cost) as sum_cost from sdmqcosts group by yearmonth)s on payconditions.yearmonth = s.yearmonth  ").order('payconditions.yearmonth desc').limit(4).each do 
            column(t(:yearmonth),:yearmonth)  {|u|  DateTime.parse(u.yearmonth.to_s).strftime("%Y-%m").to_s }
            column t(:live_users),:live_users
            column(t(:sum_cost) ,:sum_cost) {|u|  number_to_currency(u.sum_cost,  :unit=>"￥") }
            column(t(:avg_cost),:avg_cost) {|u|  number_to_currency(u.avg_cost,  :unit=>"￥") }
          end
        end
      end

       column do
        panel t("active_admin.models.accountquery") do
          table_for Accountquery.order('account desc').each do 
            column t(:account) ,:account
            column t(:accounttype),:accounttype
            column(t(:query_url),:query_url) {|u| link_to(u.query_url, u.query_url)}
          end
        end
      end
    end # columns

  end # content
end
