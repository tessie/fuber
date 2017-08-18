class TripsController < ApplicationController

  def start
    render json: { status: 'success'}
  end

  def end
     render json: { status: 'success'}
  end
end
