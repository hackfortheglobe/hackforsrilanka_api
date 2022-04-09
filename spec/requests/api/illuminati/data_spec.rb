require 'swagger_helper'

RSpec.describe 'api/illuminati/data', type: :request do
  path '/api/illuminati/data' do

    get('get data') do
      tags 'Illuminati'

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

    post('post data') do
      tags 'Illuminati'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :schedules, in: :body, schema: {
        type: :object,
        properties: {
          schedules: {
            type: :array,
            "items": {
              "type": "object",
              "properties": {
                starting_period: { type: :string },
                ending_period: { type: :string },
                group_name: { type: :string }
              }
            }
          },
        },
        required: [ 'title', 'content' ]
      }

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

      response(400, 'error') do
        let(:schedules) { { "schedules": [ {} ] } }

        run_test!
      end
    end
  end
end
