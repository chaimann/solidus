# frozen_string_literal: true

module SolidusPromotions
  # Clears promotions from an emptied order
  class OrderPromotionSubscriber
    include Omnes::Subscriber

    handle :order_emptied,
      with: :clear_order_promotions,
      id: :solidus_promotions_order_promotion_clear_order_promotions

    # Clears all promotions from the order
    #
    # @param event [Omnes::UnstructuredEvent]
    def clear_order_promotions(event)
      order = event[:order]
      order.solidus_order_promotions.destroy_all
    end
  end
end
