class Visit < ApplicationRecord
    belongs_to :user
    validate :verify_checkin,:verify_date, on: :create
    validates :status,presence: true
    validates :date, presence: true
    validates :checkin_at,:checkout_at, presence:true 
    
    def verify_date
        
        if (self.date<DateTime.now)
          errors.add(:verify_date, 'invalid date')
        end
    end
    
    def verify_checkin
        
        if (self.checkin_at>DateTime.now || self.checkin_at>checkout_at)
          errors.add(:verify_checkin, "invalid checkin or checkout")
        end
    end


end
