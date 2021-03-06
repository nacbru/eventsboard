class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[event_params])
    if @event.save
      flash[:notice] = "Event created!"
    else
      flash.now[:alert] = "Event not created"
      render "new"
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
    end
end
