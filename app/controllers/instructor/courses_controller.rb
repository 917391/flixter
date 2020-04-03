class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @courses = Course.new
  end

  def create
    @courses = current_user.courses.create(course_params)
    if @courses.valid?
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @courses = Course.find(params[:id])
  end

  private 
  def course_params
    params.require(:course).permit(:title, :description, :cost)
  end
end
