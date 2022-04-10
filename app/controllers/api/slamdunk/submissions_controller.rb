class Api::Slamdunk::SubmissionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    submission = UserSubmission.new(submission_params)
    success = submission.save

    if success
      head :created
    else
      render json: submission.errors, status: :bad_request
    end
  end

  def search
    latitude = params[:latitude]
    longitude = params[:longitude]
    distance_km = params[:distance_km] || 50

    nearby_stations = Station.near([latitude, longitude], distance_km, units: :km)
    sorted_stations = nearby_stations.sort_by do |station|
      station.distance_from([latitude, longitude])
    end

    render json: sorted_stations
  end

private
  def submission_params
    params.require(:submission).permit(:station_id, :wait_time, :gas_type, :availability, :submitted_at)
  end
end
