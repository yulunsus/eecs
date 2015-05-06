class CourseFeedbacksController < ApplicationController
  before_action :find_course
  before_action :find_user

  def index 
    @feedbacks= @course.feedbacks.order("year")
  end

  def show
    @feedback = @course.feedbacks.find(params[:id])
    #@author = User.find(@feedback.user_id)
    @author=@feedback.user
  end
  
  def new
    @feedback = @course.feedbacks.build
  end

  def create
    @feedback = @course.feedbacks.build( feedback_params )
    @feedback.user_id=@user.id
    if @feedback.save
      redirect_to course_feedbacks_url(@course)
      @user.rank+=1
      @user.save
    else
      render :action => :new
    end 
  end

  def edit
    @feedback = @course.feedbacks.find(params[:id])
  end

  def update
    @feedback = @course.feedbacks.find(params[:id])
    if @feedback.update(feedback_params)
       redirect_to course_feedbacks_url(@course)
    else
       render :action => :edit
    end 
  end

  def destroy
    @feedback = @course.feedbacks.find(params[:id])
    @feedback.destroy
    @user.rank-=1
    @user.save
    redirect_to course_feedbacks_url(@course)
  end

  protected
  
  def find_course
    @course = Course.find(params[:course_id])
  end
   
  def find_user
    @user = current_user
  end

  def feedback_params
    params.require(:feedback).permit(:content,:year,:rating)
  end
end
