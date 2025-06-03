# frozen_string_literal: true

class SolidusAdmin::Products::Show::Options::Component < SolidusAdmin::BaseComponent
  def initialize(product:)
    @product = product
  end
end
