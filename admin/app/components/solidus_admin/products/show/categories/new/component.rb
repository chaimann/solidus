# frozen_string_literal: true

class SolidusAdmin::Products::Show::Categories::New::Component < SolidusAdmin::BaseComponent
  def initialize(product:, taxon: nil)
    @product = product
    @taxon = taxon || product.taxons.build
    @taxonomy_id = @taxon.taxonomy_id || initial_taxonomy_id
  end

  private

  def taxonomies_options
    @taxonomies_options ||= Spree::Taxonomy.pluck(:name, :id)
  end

  def parent_taxon_options
    @parent_taxon_options ||= Spree::Taxon.where(taxonomy_id: @taxonomy_id).pluck(:name, :id)
  end

  def initial_taxonomy_id
    _, id = taxonomies_options.first
    id
  end
end
