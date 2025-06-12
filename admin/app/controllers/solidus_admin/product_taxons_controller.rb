# frozen_string_literal: true

module SolidusAdmin
  class ProductTaxonsController < SolidusAdmin::BaseController
    before_action :load_product, only: [:new, :create, :update_parents]

    def new
      taxon = Spree::Taxon.new(params[:taxon].permit(:name, :taxonomy_id)) if params[:taxon].present?
      render component("products/show/categories/new").new(product: @product, taxon:)
    end

    def create
      taxon = Spree::Taxon.find_or_initialize_by(category_params)

      @product.taxons << taxon
      # if taxon.persisted?
      # else
      #
      # end
      # respond_with
      respond_to do |format|
        format.html { redirect_to @product }
      end
    end

    private

    def load_product
      @product = Spree::Product.friendly.find(params[:product_id])
    end

    def authorization_subject
      Spree::Classification
    end

    def category_params
      params.require(:taxon).permit(:name, :parent_id, :taxonomy_id)
    end
  end
end
