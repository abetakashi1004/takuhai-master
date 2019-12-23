class Publics::ChangeDatesController < ApplicationController

  def new
  	@change_date = ChangeDate.new
  end

  def search
    @packages = Package.search3(params[:search])
    @change_date = ChangeDate.new
    @time_zones = TimeZone.all
  end

  def create
    change_date = ChangeDate.new(cange_date_params)
    now_package = Package.find_by(id: params[:change_date][:package_id])
    now_delivery_date = params[:change_date][:delivery_date]
    now_delivery_time_zone = params[:change_date][:time_zone_id]

    if now_package.complete == true
      flash.now[:change_date_error] = "その荷物は配達完了しています"
      render 'new'
    else
      if now_delivery_date == now_package.created_at.strftime('%Y-%m-%d')#荷物ができた当日には配達できない為
            flash.now[:change_date_error] = "荷物作成の翌日より日付指定していただけます"
            render 'new'
      else
        if now_delivery_date >= Time.now.strftime('%Y-%m-%d')#過去の日付を指定させないようにする
          if now_delivery_date < Time.now.since(14.days)#今日より二週間後までを配達指定できる
              if now_delivery_date == Time.now.strftime('%Y-%m-%d')#当日の日付であれば、依頼できる時間制限がある為

                  if now_delivery_time_zone == "1"
                    if Time.now.strftime('%H:%M') > "07:00"
                      flash.now[:change_date_error] = "午前中の配達は7時00分で締め切りました"
                      render'new'
                    else
                     change_date.save
                     redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                    end

                  elsif now_delivery_time_zone == "2"
                    if Time.now.strftime('%H:%M') > "12:40"
                      flash.now[:change_date_error] = "14時〜16時の配達は12時40分で締め切りました"
                      render'new'
                    else
                     change_date.save
                     redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                    end

                  elsif now_delivery_time_zone == "3"
                    if Time.now.strftime('%H:%M') > "12:40"
                      flash.now[:change_date_error] = "16時〜18時の配達は12時40分で締め切りました"
                      render'new'
                    else
                     change_date.save
                     redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                    end

                  elsif now_delivery_time_zone == "4"
                    if Time.now.strftime('%H:%M') > "17:40"
                      flash.now[:change_date_error] = "18時〜20時の配達は17時40分で締め切りました"
                      render'new'
                    else
                     change_date.save
                     redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                    end

                  elsif now_delivery_time_zone == "5"
                    if Time.now.strftime('%H:%M') > "17:40"
                      flash.now[:change_date_error] = "19時〜21時の配達は17時40分で締め切りました"
                      render'new'
                    else
                       if change_date.save
                        redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                       else
                        flash.now[:change_date_error] = "時間帯を指定してください"
                        render'new'
                       end
                    end
                  end
              else
                 if change_date.save
                  redirect_to new_change_date_path, flash:{change_date_success: "配達日時を変更しました"}
                 else
                  flash.now[:change_date_error] = "時間帯を指定してください"
                  render'new'
                 end
              end
          else
            flash.now[:change_date_error] = "本日より２週間以内を指定してください"
            render 'new'
          end
        else
          flash.now[:change_date_error] = "過去の日付は指定できません"
          render 'new'
        end
      end
    end
  end

private
   def cange_date_params
   	params.require(:change_date).permit(:package_id, :time_zone_id, :delivery_date)
   end
end
