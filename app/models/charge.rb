class Charge < Pay::Charge

    before_save do
        if amount_changed?
            owner.update!(payment_status: PAID)
        elsif amount_refunded_changed?
            owner.update!(payment_status: REFUNDED)
        end
    end

end