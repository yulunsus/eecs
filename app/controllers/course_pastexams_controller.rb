class CoursePastexamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course
  
  def index
    @pastexams = @course.pastexams.order("year")
  end
  
  def show
    @pastexam = @course.pastexams.find(params[:id])
  end

  def new
    @pastexam = @course.pastexams.build
  end

  def create
    @pastexam = @course.pastexams.build( pastexam_params )
    @pastexam.user_id=current_user.id
    if @pastexam.save
      redirect_to course_pastexams_url( @course )
    else
      render :action => :new
    end
  end

  def edit
    @pastexam = @course.pastexams.find(params[:id])
  end

  def update
  @pastexam = @course.pastexams.find( params[:id] )

  if @pastexam.update( pastexam_params )
    redirect_to course_pastexams_url( @course )
  else
    render :action => :edit
  end

  end

  def destroy
    @pastexam = @course.pastexams.find( params[:id] )
    @pastexam.destroy

    redirect_to course_pastexams_url( @course )
  end

  protected

  def find_course
    @course = Course.find( params[:course_id] )
  end

  def pastexam_params
	params.require(:pastexam).permit(:file ,:exam_type, :has_answer, :year)
end
end
