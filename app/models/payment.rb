class Payment < ActiveRecord::Base

  belongs_to :student

  validates :student_id, :amount, :date, presence: true
  
end
