class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)

    if user.save!
      render json: user
    else
      # render json: 'user.errors.full_messages', status: 418
      render json: 'WRONG PARAMS!', status: 418
    end
  end

  def show
    user = User.find_by(id: params[:id])

    if user #is found
      render json: user
    else
      render json: 'You do not exist!', status: 418
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update!(user_params) #is found
      render json: user
    else
      render json: 'Cannot update something that doesnt exist!', status: 418
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.destroy! #is found
      render json: user
    else
      render json: 'Cannot destroy something thats not found!', status: 418
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end


end
