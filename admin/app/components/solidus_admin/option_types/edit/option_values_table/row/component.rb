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
        data: ->(_) do
          component("ui/forms/input").new(
            name: "option_type[option_values_attributes][][name]",
            class: "required"
          )
        end
      },
      {
        data: ->(_) do
          component("ui/forms/input").new(
            name: "option_type[option_values_attributes][][presentation]",
            class: "required"
          )
        end
      }
    ]
  end
end
