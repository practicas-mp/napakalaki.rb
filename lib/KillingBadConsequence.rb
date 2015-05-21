require_relative 'BadConsequence'


class KillingBadConsequence < BadConsequence
    def initialize(text)
        super
    end

    def to_s
        super + "Muerte"
    end

    def kills
        true
    end

    public_class_method :new
end