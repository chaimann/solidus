# frozen_string_literal: true

# Simple shorthands and helpers for stimulus data attributes to avoid writing clumsy interpolations with `stimulus_id`
#  Before: "data-#{stimulus_id}-target": "wrapper"
#  After: stimulus_target("wrapper")
# Optionally pass :controller keyword arg with controller name to override default "stimulus_id".

module SolidusAdmin
  module StimulusHelper
    def stimulus_controller(name = stimulus_id)
      { "data-controller": name }
    end

    def stimulus_action(action, on: nil, controller: stimulus_id)
      action_construct = []
      action_construct << "#{on}->" if on.present?
      action_construct << "#{controller}##{action}"

      { "data-action": action_construct.join }
    end

    def stimulus_target(target, controller: stimulus_id)
      { "data-#{controller}-target": target }
    end

    def stimulus_value(name:, value:, controller: stimulus_id)
      { "data-#{controller}-#{name}-value": value }
    end

    def stimulus_param(name:, value:, controller: stimulus_id)
      { "data-#{controller}-#{name}-param": value }
    end
  end
end
