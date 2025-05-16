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
        header: :name,
        data: ->(option_value) do
          component("ui/forms/input").new(name: "", value: option_value.name, class: "required")
        end
      },
      {
        header: :presentation,
        data: ->(option_value) do
          component("ui/forms/input").new(name: "", value: option_value.presentation, class: "required")
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
