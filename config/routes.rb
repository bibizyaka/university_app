Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'courses#index'
  #courses
 # get 'courses/new' => 'courses#new'
  resources 'courses', except: [:destroy]
  post 'course_enroll' => 'student_courses#create'
  #students
  resources 'students', except: [:destroy]
  #about page
  get 'about' => 'pages#about'
  #logins
  get 'login' => 'logins#new'
  post 'login' => 'logins#create'
  delete 'logout' => 'logins#destroy'
  
end #class
