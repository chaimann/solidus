# frozen_string_literal: true

module SolidusAdmin
  class OptionTypesController < SolidusAdmin::ResourcesController
    include Spree::Core::ControllerHelpers::StrongParameters

    before_action :load_option_type, only: [:move]

    def move
      @option_type.insert_at(params[:position].to_i)

      respond_to do |format|
        format.js { head :no_content }
      end
    end

    private

    def after_create_path
      solidus_admin.edit_option_type_path(@resource)
    end

    def resource_class = Spree::OptionType

    def permitted_resource_params
      params.require(:option_type).permit(permitted_option_type_attributes)
    end

    def resources_collection = Spree::OptionType.unscoped

    def resources_sorting_options
      { position: :asc }
    end

    def load_option_type
      @option_type = Spree::OptionType.find(params[:id])
      authorize! action_name, @option_type
    end
  end
end
