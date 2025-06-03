# frozen_string_literal: true

class SolidusAdmin::Products::Show::Options::Form::Component < SolidusAdmin::BaseComponent
  def initialize(product:)
    @product = product
  end

  def option_type_options
    @option_type_options ||= Spree::OptionType.order(:presentation).pluck(:presentation, :name, :id).map do
      ["#{_2}:#{_1}", _3]
    end
  end
end
