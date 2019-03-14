class LoginsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  
  def new
  end
  
  def create  
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = "You are now logged in"
      redirect_to root_path
    else
      flash.now[:notice] = "Login Error"
      render "new"
    end
    
  end
  def destroy
    session[:student_id] = nil
    flash[:notice] = "You are logged out"
    redirect_to root_path
  end 
  
  
  private
  
  def login_params
    params.require(:login).permit(:email, :password)
  end
  
end