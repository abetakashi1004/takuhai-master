class Drivers::TodayCoursesController < Drivers::ApplicationController

  def new
  	@today_course = TodayCourse.new
  	@poctcodes = Postcode.where(sales_office_id:current_delivery_person.sales_office.id)
  end

  def create
    @today_course = TodayCourse.new
    @poctcodes = Postcode.where(sales_office_id:current_delivery_person.sales_office.id)
    if params[:today_course].nil?
      flash.now[:not_course] = "コースを選択してください"
      render'new'
    else
      select_posecodes = params[:today_course][:postcode_id]
      select_posecodes.each do |f|
        today_course = TodayCourse.new(today_course_params)
        today_course.postcode_id = f
        today_course.delivery_person_id = current_delivery_person.id
        today_course.save
       end
      redirect_to new_drivers_takeout_path
    end
  end

  private
  def today_course_params
  	params.require(:today_course).permit(:delivery_person_id, :postcode_id)
  end
end
