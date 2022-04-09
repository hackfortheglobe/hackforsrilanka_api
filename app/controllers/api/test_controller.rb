class Api::TestController < ApplicationController
  def index
    render json: { "Hello": "World!" }
  end
end
