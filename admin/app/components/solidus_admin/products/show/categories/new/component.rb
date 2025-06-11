# frozen_string_literal: true

class SolidusAdmin::Products::Show::Categories::New::Component < SolidusAdmin::BaseComponent
  def initialize(product:)
    @product = product
    @product_category = product.taxons.build
  end
end
