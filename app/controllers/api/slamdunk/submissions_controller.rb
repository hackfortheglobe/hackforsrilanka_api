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


private
  def submission_params
    params.require(:submission).permit(:station_id, :wait_time, :gas_type, :availability, :submitted_at)
  end
end
