class UsersController < ApplicationController
    def index
        users = User.all()
        render json: users
    end
    def create
        user = User.create(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            cpf: params[:cpf]
        )
        render json: user
    end
end
