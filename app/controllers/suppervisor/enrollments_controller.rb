class Suppervisor::EnrollmentsController < ApplicationController
  before_action :suppervisor_user
  def show
    @enrollment = Enrollment.new
    @users = User.trainees
  end

  def update
    @enrollment = Enrollment.new enrollment_params
    @course = Course.find_by_id params[:enrollment][:course_id]
    
    params[:enrollment][:user_id].each do |f|
      enrollment = Enrollment.new(user_id: f.to_i, course_id: params[:enrollment][:course_id])
      enrollment.save
    end
    if @enrollment.save
      redirect_to [:suppervisor, @course]
      flash.now[:success] = "Successful"
    else
      flash.now[:danger] = "Please select a course and trainees!"
      render "new"
    end
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end