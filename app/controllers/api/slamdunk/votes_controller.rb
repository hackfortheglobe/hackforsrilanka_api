class Api::Slamdunk::VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def upvote
    entry = UserSubmission.find(params["id"])
    entry.increment!(:upvotes)
    render json: {}
  end

  def downvote
    entry = UserSubmission.find(params["id"])
    entry.increment!(:downvotes)
    render json: {}
  end
end
