class UserController < ApplicationController
  def addMember
    Join.create(user_id:session[:user_id], event_id:params[:id])
    redirect_to'/user/show'
  end
  def removeMember
    this = User.find(session[:user_id]).joins.where(event_id:params[:id]).ids
    Join.find(this[0]).destroy
    p this
    p "look"
    p "look"
    p "look"
    p "look"

    redirect_to'/user/show'
  end
	def verify
  	@u = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  	if @u
  		session[:user_id] = @u.id
  		p session[:user_id]
  		redirect_to '/user/show'
  	else
  		p "fail"
      flash[:notice] = "INVALID LOGIN"
  		redirect_to '/'
  	end
  end
	def login
		session[:user_id] = nil
	end
	def show
  	@user = User.find(session[:user_id])
  	@event = Event.all
    num_of_events_for_user = User.find(session[:user_id]).joins.where(event_id: 10).count
    num_of_mem_for_event = Event.find(10).joins.count

    p num_of_mem_for_event
	end
  	def create
  	@u = User.create(state:params[:state], address:params[:address], first_name:params[:first_name], last_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:confirm_password])
    if @u.errors.full_messages.length > 0
      flash[:register_notice] = @u.errors.full_messages
      p "fail"
      redirect_to '/'
    else
      session[:user_id] = User.last.id
      p session[:user_id]
      p "success"
      redirect_to '/user/show'
    end
  	end
  	def destroy
	  	Event.find(params[:id]).destroy
	  	redirect_to "/user/show"
  	end
  def showOne
  	@User = User.find(params[:id])
  	@students = User.find(params[:id]).students
  end
  def showEdit
  	@User = User.find(params[:id])
  end
  def edit
  	User.update(params[:id], state:params[:state], city:params[:city], branch:params[:branch], street:params[:street], creator:session[:user_id])
  	redirect_to "/dojos/show"
  end
  def eventCreated
  	@e = Event.create(name:params[:name], desc:params[:desc], creator:session[:user_id])
    
    if @e.errors.full_messages.length > 0
      flash[:event_notice] = @e.errors.full_messages
      p "fail"
      redirect_to '/user/show'
    else
      Join.create(user_id:session[:user_id], event_id:Event.last.id)
      p "success"
      redirect_to '/user/show'
    end
  end
  def destroyStudent
  	event.find(params[:id]).destroy
  	redirect_to "/dojos/show"
  end
  def show_one_event
  	@event = Event.find(params[:id])
  end
  def showEdit_student
  	@event = event.find(params[:id])
  	@User = User.all
  end
  def editStudent
  	event.update(params[:id], first_name:params[:first_name], last_name:params[:last_name], email:params[:email], dojo_id:User.find_by(state:params[:state]).id)
  	@id = event.find(params[:id]).dojo_id
  	redirect_to "/dojos/show/#{@id}"
  end
end
