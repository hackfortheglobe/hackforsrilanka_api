class Api::Illuminati::PowerscheduleController < ApplicationController
  def index
    start_date = params["start_date"].in_time_zone("Asia/Colombo").utc
    if not params["end_date"].present?
      end_date = DateTime.now.utc
    else
      end_date = params["end_date"].in_time_zone("Asia/Colombo").utc
    end

    schedules = PowercutSchedule.where(
      "group_name = ? AND starting_period >= ? AND ending_period <= ?",
      params["name"],
      start_date,
      end_date
    )

    render json: schedules
  end

  def groups
    # Return all unique group names
    unique_groups = PowercutSchedule.pluck(:group_name).uniq.sort
    render json: unique_groups
  end
end
