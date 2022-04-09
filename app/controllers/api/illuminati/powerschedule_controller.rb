class Api::Illuminati::PowerscheduleController < ApplicationController
  def index
    # Do the filtering here
    # Access query string through params["started_at"] for example
    puts params

    schedules = PowercutSchedule.all
    render json: schedules
  end

  def groups
    # Return all unique group names
    unique_groups = PowercutSchedule.pluck(:group_name).uniq.sort
    render json: unique_groups
  end
end
