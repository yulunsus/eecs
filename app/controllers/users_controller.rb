class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.where([ "is_admin <= ?", 1])
	end
	def show
	 if params[:id]
	   @user= User.find(params[:id])
         end
	end

 	def hero
          if params[:keyword]
            @users = User.where([ "is_admin <= ?", 1]).where( [ "first_name like ? OR nick_name like ? OR last_name like ? OR class_year like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ] ).page(params[:page]).per(10)
          else
            @users = User.where([ "is_admin <= ?", 1]).order('maxrank DESC').page(params[:page]).per(10)
          end
	end

        def assign
           @user = User.find(params[:id])
           @user.is_admin = 1
           @user.save
           redirect_to :action => :show, :id => @user.id
        end
        
        def unassign
   	   @user = User.find(params[:id])
           @user.is_admin = 0
           @user.save
           redirect_to :action => :show, :id => @user.id
        end
  

end
