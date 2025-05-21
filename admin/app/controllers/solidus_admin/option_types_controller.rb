# frozen_string_literal: true

module SolidusAdmin
  class OptionTypesController < SolidusAdmin::ResourcesController
    include Spree::Core::ControllerHelpers::StrongParameters
    include SolidusAdmin::Moveable

    def add_option_value
      render turbo_stream: turbo_stream.append(
        :"ui--table-tbody",
        component("option_types/edit/option_values_table/row").new(form_id: params.require(:form_id))
      )
    end

    private

    def after_create_path
      solidus_admin.edit_option_type_path(@resource)
    end

    def after_update_path
      if params[:apply]
        solidus_admin.edit_option_type_path(@resource)
      else
        super
      end
    end

    def resource_class = Spree::OptionType

    def permitted_resource_params
      params.require(:option_type).permit(permitted_option_type_attributes)
    end

    def resources_collection = Spree::OptionType.unscoped

    def resources_sorting_options
      { position: :asc }
    end
  end
end
