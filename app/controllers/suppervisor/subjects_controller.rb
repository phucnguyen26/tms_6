class Suppervisor::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def new
    @subject = Subject.new
    4.times {@subject.lessons.build}
  end

  def index
    @subjects = Subject.all.paginate page: params[:page], per_page: 15
  end
  
  def show
    @subject = Subject.find params[:id]
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Successfully add new subject!"
      redirect_to suppervisor_subjects_path
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    redirect_to suppervisor_subjects_path
  end

  private

    def set_subject
      @subject = Subject.find params[:id]
    end

    def subject_params
      params.require(:subject).permit(:name, lessons_attributes: [:id, :name, :content])
    end
  
end