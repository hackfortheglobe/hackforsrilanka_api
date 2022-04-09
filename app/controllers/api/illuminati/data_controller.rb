class Api::Illuminati::DataController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: PowercutSchedule.all
  end

  def create
    schedules = params["schedules"]

    saved_schedules = PowercutSchedule.transaction do
      schedules.map do |s|
        schedule = PowercutSchedule.new
        schedule.starting_period = s["starting_period"]
        schedule.ending_period = s["ending_period"]
        schedule.group_name = s["group_name"]
        schedule.save!

        schedule
      end
    end

    render json: { saved_count: saved_schedules.length }
  end
end
