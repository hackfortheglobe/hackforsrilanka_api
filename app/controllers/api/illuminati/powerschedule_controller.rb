class Api::Illuminati::PowerscheduleController < ApplicationController
  def index
    start_date = DateTime.parse(params["start_date"])
    if not params["end_date"].present?
      end_date = DateTime.now.utc
    else
      end_date = DateTime.parse(params["end_date"])
    end

    schedules = PowercutSchedule.where(
      "group_name = ? AND starting_period >= ? AND ending_period <= ?",
      params["group_name"],
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
