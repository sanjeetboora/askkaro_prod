class Subtrend < ActiveRecord::Base
  belongs_to :maintrend
  acts_as_followable
end
