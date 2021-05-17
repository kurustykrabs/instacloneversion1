class UsersController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.create(user_params)

    if user.save
      redirect_to user_path(user)
    else
      render :new
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  user = User.find(params[:id])
  user.update(user_params)
  if user.save
    redirect_to user_path(user), notice:'Updated'
  else
    render :edit
  end

  # current_user.update(user_params)
  # redirect_to current_user

end

def show
  @user = User.find(params[:id])
  @comment = Comment.new
  @find_relationship = current_user.active_relationships.find_by(following_id: @user.id)
  # @find_relationship = Relationship.find(3)
end

def destroy
end

def followings
  @user = User.find(params[:id])
end

def followers
  @user = User.find(params[:id])
end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end



end
