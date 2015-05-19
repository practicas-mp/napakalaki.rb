require_relative 'BadConsequence'


class KillingBadConsequence < BadConsequence
    def initialize(text)
        super(text, 0, 0, 0, [], [], true)
    end

    def to_s
        super + "Muerte"
    end

    public_class_method :new
end