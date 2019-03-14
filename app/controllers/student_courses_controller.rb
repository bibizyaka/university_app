class StudentCoursesController < ApplicationController
  
  def create
    
      course_to_add = Course.find(params[:course_id])
      unless current_user.courses.include?(course_to_add)
        StudentCourse.create(course: course_to_add, student: current_user)
        flash[:notice] = "Enrollment was successfull for #{course_to_add.short_name}" 
        redirect_to current_user # show page of logged in user
      else
        flash[:notice] = "Something gone wrong with your enrollment"  
        redirect_to root_path 
      end
  end
  
  
end #class