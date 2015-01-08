class Suppervisor::EnrollmentsController < ApplicationController
  before_action :suppervisor_user
  def new
    @enrollment = Enrollment.new
    @users = User.trainees
  end

  def create
    @enrollment = Enrollment.new enrollment_params
    @course = Course.find_by_id params[:enrollment][:course_id]
    @enrollment.status_course = "1"

    if @enrollment.save
      redirect_to [:suppervisor, @enrollment]
      flash.now[:success] = "Course Started Successful"
    else
      flash.now[:danger] = "Please select a course and traineees!"
      render "new"
    end
  end

  def show
    @enrollment = Enrollment.find params[:id]
    @course = @enrollment.course
    @users = @course.users
  end

  def destroy
    @enrollment = Enrollment.find params[:id]
    @enrollment.destroy
    flash[:success] = "End Course"
    redirect_to new_suppervisor_enrollment_url
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :status_course, :user_id =>[])
  end
end