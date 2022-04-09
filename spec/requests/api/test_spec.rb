require 'swagger_helper'

RSpec.describe 'api/test', type: :request do

  path '/api/test' do

    get('list tests') do
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
