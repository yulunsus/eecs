class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :only => [ :show, :edit, :update, :destroy]
  before_action :set_user 
	
	def index
    @courses = Course.all.order('grade')
	
	end

  def new
    @course = Course.new
  end

  def create
    @course=Course.new(course_params)
    #@course.save
    
    if @course.save
      redirect_to courses_url
    else
      render :action => :new
    end
    
    #redirect_to courses_url
  end
  
  def show
    #@course = Course.find(params[:id])
    grade_selector=['','freshman','sophomore','junior and senior','graduate','foreign language','general knowledge']
    @grade = grade_selector[@course.grade]
  end
  
  def destroy
    #@course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end

  def edit
    #@course = Course.find(params[:id])
  end
  
  def update
    #@course = Course.find(params[:id])
    #@course.update(course_params)
    
    if @course.update(course_params)
      redirect_to courses_url(@course)
    else
      render :action => :edit
    end
   
    #redirect_to courses_url(@course)
  end
  
  private

  def course_params
    params.require(:course).permit(:name, :instructor, :grade, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end
	def set_user
		@user = current_user 
	end
end
