# frozen_string_literal: true

class SolidusAdmin::OptionTypes::Edit::OptionValuesTable::Component < SolidusAdmin::BaseComponent
  def initialize(option_values)
    @rows = option_values
  end

  def call
    render component("ui/table").new(
      id: stimulus_id,
      data: {
        class: Spree::OptionValue,
        rows: @rows,
        columns:,
        batch_actions:,
      },
      sortable: sortable_options,
      embedded: true,
    )
  end

  def columns
    [
      {
        col: { class: "w-0" },
        data: ->(option_value) do
          hidden_field_tag("option_type[option_values_attributes][][id]", option_value.id)
        end
      },
      {
        header: :name,
        data: ->(option_value) do
          [
            component("ui/forms/field").text_field(
              "option_type[option_values_attributes][]",
              :name,
              object: option_value,
              class: "required",
              "aria-label": true
            ),
            { class: "align-top" }
          ]
        end
      },
      {
        header: :presentation,
        data: ->(option_value) do
          [
            component("ui/forms/field").text_field(
              "option_type[option_values_attributes][]",
              :presentation,
              object: option_value,
              class: "required",
              "aria-label": true
            ),
            { class: "align-top" }
          ]
        end
      },
    ]
  end

  def batch_actions
    [
      {
        label: t('.batch_actions.delete'),
        action: "#",
        method: :delete,
        icon: 'delete-bin-7-line',
        require_confirmation: true,
      },
    ]
  end

  def sortable_options
    {
      url: ->(option_value) { "#" },
      param: "position",
      handle: ".handle",
    }
  end
end
