# frozen_string_literal: true

class SolidusAdmin::FormBuilder < ActionView::Helpers::FormBuilder
  include SolidusAdmin::ComponentsHelper

  delegate :render, to: :@template

  def text_field(*args, **kwargs)
    render component("ui/forms/field").text_field(self, *args, **kwargs)
  end

  def text_area(*args, **kwargs)
    render component("ui/forms/field").text_area(self, *args, **kwargs)
  end

  def select(*args, **kwargs)
    render component("ui/forms/field").select(self, *args, **kwargs)
  end

  def checkbox(method, checked: nil, **kwargs, &block)
    kwargs[:checked] = checked.nil? ? @object.public_send(method) : checked
    kwargs[:method] = method
    component_instance = component("ui/forms/checkbox").new(**kwargs, object_name: @object_name)
    render component_instance, &block
  end

  def checkbox_row(method, **kwargs)
    render component("ui/checkbox_row").new(form: self, method:, **kwargs)
  end

  def input(*args, **kwargs)
    render component("ui/forms/input").new(*args, **kwargs)
  end

  def submit(text, **kwargs)
    render component("ui/button").new(type: :submit, text:, form: id, **kwargs)
  end
end
