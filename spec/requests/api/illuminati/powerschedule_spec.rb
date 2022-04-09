require 'rails_helper'

RSpec.describe "Api::Illuminati::Powerschedules", type: :request do
  path '/api/illuminati/groups' do

    get('get an array of unique groups') do
      produces 'application/json'

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
