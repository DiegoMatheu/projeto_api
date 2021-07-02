
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def verify_date
    if (self.date<DateTime.now)
      errors.add(:verify_date, 'invalid date')
    end
  end

  def verify_checkin
    if (self.checkin_at>DateTime.now||self.checkin_at>checkout_at)
      errors.add(:verify_checkin, "invalid checkin or checkout")
    end
  end

  
end
