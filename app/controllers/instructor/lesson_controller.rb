class Instructor::LessonController < ApplicationController
  before_action :authenticate_user!                                               #this makes sure there is a user logged in

  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end
  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lesson.create(lesson_params)
    redirect_to instructor_course_path(@section.course)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
