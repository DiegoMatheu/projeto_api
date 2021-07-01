class AuthenticationController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if (!user)
            render status: :unauthorized
        else 
            if user.authenticate(params[:password])
                render json: { message: "Correct Password"}
            else
                render json: { error: "Incorrect Password"}, status: :unauthorized
            end
        end
    end
end
