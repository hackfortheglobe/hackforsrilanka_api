class Api::Slamdunk::VotesController < ApplicationController
    def upvote
        entry = UserSubmission.find(station_id: params["id"])
        entry.increment!(:upvotes)
        render json: {}
    end

    def downvote
        entry = UserSubmission.find(station_id: params["id"])
        entry.increment!(:downvotes)
        render json: {}
    end

end
