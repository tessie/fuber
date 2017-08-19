class CabsController < ApplicationController

  def index
    cabs = Cab.available_cabs
    render json: { status: 'success', cabs: cabs }
  end

  def nearest
    if params[:long].blank? || params[:lat].blank?
      response = { status: 'failure', message: 'Please provide your current coordinates' }
    else
      color = params[:color].blank? ? nil : params[:color].to_s
      cab = Cab.nearest(params[:loc].to_f, params[:lat].to_f, color)
      message = cab.nil? ? 'Sorry! No cabs are available' :  ' '
      response = { status: 'success', details: cab, message: message }
    end
    render json: response
  end

  def book
    @cab = Cab.find_by_id params[:id]
    if @cab.present? && @cab.book
      response = { status: 'success', message: 'Booked Successfully', details: @cab }
    else
      response = { status: 'failure', message: 'Cab Not Available' }
    end
    render json: response
  end
end
