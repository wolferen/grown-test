class Sensor < ApplicationRecord
  belongs_to :tablet

  scope :sort_by_hour_with, lambda { |tablet_id|
    result = []
    where(tablet_id: tablet_id)
      .group_by { |s| s.time.hour }.each do |sensor|
      result << sensor.second.min_by(&:time)
    end
    result
  }
end
