class Api::Slamdunk::VotesController < ApplicationController
    def upvote
        puts params
        render json: {}
    end

    def downvote
        puts params

        render json: {}
    end

end
