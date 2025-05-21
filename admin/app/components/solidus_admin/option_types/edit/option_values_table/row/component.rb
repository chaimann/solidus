# frozen_string_literal: true

class SolidusAdmin::OptionTypes::Edit::OptionValuesTable::Row::Component < SolidusAdmin::BaseComponent
  def initialize(form_id:)
    @form_id = form_id
  end

  def call
    render component("ui/table/row").new(
      Spree::OptionValue.new,
      SolidusAdmin::UI::Table::Component::Data.new(columns:).columns,
      "data-controller": stimulus_id
    )
  end

  def columns
     [
      {
        # empty cell
      },
      {
        data: ->(_) do
          [
            component("ui/button").new(
              icon: "delete-bin-7-line",
              scheme: :danger,
              size: :s,
              "aria-label": t(".delete"),
              data: { "action": "#{stimulus_id}#remove" }
            ),
            { class: "!px-3" }
          ]
        end
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
            form: @form_id,
            "data-#{stimulus_id}-target": "focusable",
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
            form: @form_id,
          )
        end
      }
    ]
  end
end
