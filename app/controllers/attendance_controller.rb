class AttendanceController < ApplicationController
    @@event = 0
    
    def show
        @event = Event.find(params[:event_id])
        @admin = User.find(@event.admin_id)
    end

    def new
    @@event = params[:event_id]    
    end

    def create
        Attendance.create(user_id: current_user.id, event_id: @@event, stripe_customer_id: params[:stripe_customer_id])
    end
end