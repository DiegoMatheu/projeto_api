class UsersController < ApplicationController
before_action :token_authenticate
    def index
        users = User.all()
        render json: {users: users}
    end
    def create
        user = User.create(user_params)
        if (user.valid?)
            render json: {message: 'Created User'}
        else
            render json: {error: 'Not created'}, status: :unprocessable_entity
        end
    end

    def show 
        user = User.find_by(params[:id])
        render json: {user: user}
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { message: 'Deleted User'}, status: :no_content

    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: { message: 'Update user',  user:user}
        else
            render json: { error: 'User not update', user:user.errors}, status: :unprocessable_entity
        end
    end

    private 

    def user_params
        params.permit(:name,:email,:cpf,:password)
    end

end
