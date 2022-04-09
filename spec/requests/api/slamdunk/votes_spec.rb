require 'rails_helper'

RSpec.describe "Api::Slamdunk::Votes", type: :request do
  path '/api/slamdunk/upvote/{id}' do

    parameter id: :id, in: :path, type: :integer

    post('increment upvotes') do
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/slamdunk/downvote/{id}' do
    parameter id: :id, in: :path, type: :integer
    
    post('increment downvotes') do
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
