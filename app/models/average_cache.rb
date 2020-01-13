class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Patient"
  belongs_to :rateable, :polymorphic => true
end
