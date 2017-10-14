class Note < ActiveRecord::Base
  belongs_to :user
    validates :title ,presence: true,length:{maximum:140,
    too_long: "%{count} characters is the maximum allowed" }

end
