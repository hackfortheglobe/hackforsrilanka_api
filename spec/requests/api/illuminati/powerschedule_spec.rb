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

  path 'api/illuminati/powerschedules' do

    get('get power schedules between start and end times') do
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter start_date: :id, in: :query, type: :string
      parameter end_date: :id, in: :query, type: :string

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
        let(:name) { "" }
        let(:start_date) { "" }
        let(:end_date) { "" }
        run_test!
      end

    end
  end

end
