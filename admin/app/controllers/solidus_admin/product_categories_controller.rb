# frozen_string_literal: true

module SolidusAdmin
  class ProductCategoriesController < SolidusAdmin::BaseController
    before_action :load_product, only: [:new]

    def new
      render component("products/show/categories/new").new(product: @product)
    end

    private

    def load_product
      @product = Spree::Product.friendly.find(params[:product_id])
    end

    def authorization_subject
      Spree::Classification
    end
  end
end
