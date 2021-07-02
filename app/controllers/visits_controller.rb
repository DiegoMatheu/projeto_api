class VisitsController < ApplicationController

    def index
        visits = Visit.all
    end

    def create
        visit = Visit.create(visit_params)
        render json: {visit: visit}

    end

    def update
    end

    def show
    end

    def destroy
    end

    private
    def visit_params
        params.permit(:checkin_at,:checkout_at,:status,:date)
    end
end
