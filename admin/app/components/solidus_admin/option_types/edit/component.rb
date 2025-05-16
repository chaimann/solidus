# frozen_string_literal: true

class SolidusAdmin::OptionTypes::Edit::Component < SolidusAdmin::Resources::Edit::Component
  include SolidusAdmin::Layout::PageHelpers

  def initialize(option_type)
    super
    option_type.option_values.build if option_type.option_values.empty?
  end
end
