module HomeHelper

  def financial_class(financial_status)
    case financial_status
    when 'pending' then 'label-warning'
    when 'paid' then 'label-success'
    end
  end

  def fulfillment_class(fulfillment_status)
    case fulfillment_status
    when 'partial' then 'label-warning'
    when 'fulfilled' then 'label-success'
    end
  end

end
