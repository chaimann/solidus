# frozen_string_literal: true

class SolidusAdmin::OptionTypes::Edit::OptionValuesTable::Row::Component < SolidusAdmin::BaseComponent
  def call
    render component("ui/table/row").new(Spree::OptionValue.new, SolidusAdmin::UI::Table::Component::Data.new(columns:).columns)
  end

  def columns
     [
      {
        # empty cell
      },
      {
        # empty cell
      },
      {
        # empty cell
      },
      {
        data: ->(option_value) do
          component("ui/forms/field").text_field(
            "option_type[option_values_attributes][]",
            :name,
            object: option_value,
            class: "required",
            "aria-label": true,
          )
        end
      },
      {
        data: ->(option_value) do
          component("ui/forms/field").text_field(
            "option_type[option_values_attributes][]",
            :presentation,
            object: option_value,
            class: "required",
            "aria-label": true,
          )
        end
      }
    ]
  end
end
