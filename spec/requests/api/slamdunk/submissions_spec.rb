require 'rails_helper'

RSpec.describe "Api::Slamdunk::Submissions", type: :request do
  path '/api/slamdunk/submit' do
    post('increment upvotes') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :submission, in: :body, schema: {
        type: :object,
        properties: {
          station_id: {
            type: :integer,
            required: true
          },
          gas_type: {
            type: :string,
            enum: ["petrol_93", "diesel", "petrol_95", "gas_cylinder", "super_diesel"],
            required: true
          },
          availability: {
            type: :string,
            enum: ["available", "unavailable", "unsure"],
            required: true
          },
          wait_time: { type: :integer },
          submitted_at: { type: "string", required: true }
        }
      }

      response(200, 'successful') do
        let(:submission) {
          {
            "submission": {
              "station_id": 2,
              "gas_type": "petrol_93",
              "availability": "unavailable",
              "wait_time": 10,
              "submitted_at": "2022-04-09T21:47:36.923Z"
            }
          }
        }

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
