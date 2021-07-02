class AuthenticationController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if (!user)
            render json:{error: 'Email not found'},status: :unauthorized
        else 
            if user.authenticate(params[:password])
                secret_key = Rails.application.secrets.secret_key_base[0]
                token = JWT.encode({
                    user_id: user.id,
                    
                }, secret_key )
                render json: {token: token}
            else
                render json: { error: "Incorrect Password"}, status: :unauthorized
            end
        end
    end
end
