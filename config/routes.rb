Rails.application.routes.draw do
  get '' => 'user#login'
  post 'verify' => 'user#verify'
 get 'user/show' => "user#show"
  post 'user/new' => "user#create"
  get 'user/edit/:id' => "user#showEdit"
  get 'user/show/:id' => "user#showOne"
  post 'user/edit/:id' => "user#edit"
  get 'user/destroy/event/:id' => "user#destroy"
  get 'user/edit/event/:id' => "user#showEdit_student"
  get 'user/show/event/:id' => "user#show_one_event"
  post 'user/edit/event/:id' => "user#editStudent"
  post 'user/new/event' => 'user#eventCreated'
  post 'user/new/member/:id' => 'user#addMember'
  post 'user/remove/member/:id' => 'user#removeMember'
end
