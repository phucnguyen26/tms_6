class Suppervisor::CoursesController < ApplicationController
  before_action :suppervisor_user
  def new
    @course = Course.new
    @subjects = Subject.all
  end

  def create
    @course = Course.new course_params
    @course.status_course = "0"
    if @course.save
      redirect_to [:suppervisor,@course]
      flash[:success] = "Create Course Successful"
    else
      render "new"
    end
  end

  def index
    @courses = Course.paginate page: params[:page]
    @enroll = Enroll.new
  end

  def show
    @course = Course.find params[:id]
    @sujects = @course.subjects
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.new course_params
    status = params[:status]
    if status
      @course.status_course = status
      @course.save
      flash[:success] = "Course ended!"
      redirect_to [:suppervisor, @course]

    elsif @course.update_attributes course_params
      flash[:success] = "Course updated"
      redirect_to [:suppervisor, @course]
    else
      render "edit"
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to suppervisor_courses_url
  end
  private
  def course_params
    params.require(:course).permit(:name, :instruction, :subject_ids => [])
  end
end