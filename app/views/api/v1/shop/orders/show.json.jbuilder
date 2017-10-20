json.extract! @order, :id, :status, :created_at, :updated_at, :note
json.details do
  json.array!@order.details.each do |shop_detail|
    json.extract! shop_detail, :id, :quantity, :created_at, :updated_at
    json.product do
      json.api api_v1_shop_product_url(shop_detail.shop_product_id, format: :json, id: shop_detail.shop_product_id, api_key: @api_key)
    end
  end
end
json.statuses do
  json.array!@order.statuses.each do |status|
    case status
      when :accepted
        json.set! status do
          json.extract! @order, :amount, :coupon, :from_phone_hide, :from_email_hide
        end
      when :pending
        json.set! status do
          json.extract! @order, :amount, :paymented_at if @order.status == status.to_s
        end
      when :shipped
        json.set! status do
          json.extract! @order, :shipped_at, :tracking_number if @order.status == status.to_s
        end
      when :waiting
        json.set! status do
          json.extract! @order, :shipped_at, :tracking_number, :delivered_at, :delivery_zipcode, :delivery_address if @order.status == status.to_s
        end
    end
  end
end