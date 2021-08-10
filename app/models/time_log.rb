class TimeLog < ApplicationRecord

  validates :start_time, :end_time, presence: true
  validate :start_time_cannot_be_greater_than_end_time

  def start_time_cannot_be_greater_than_end_time
    if start_time > end_time
      errors.add(:start_time, "Can't be greater than End Time.")
    end
  end

  belongs_to :project

end
