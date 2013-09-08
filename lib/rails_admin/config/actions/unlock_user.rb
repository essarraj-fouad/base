require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class UnlockUser < Base

        RailsAdmin::Config::Actions.register self

        register_instance_option :controller do
          Proc.new do
            @object.unlock_access!
            flash[:notice] = "You have unlocked #{ @object.email }."
            redirect_to back_or_index
          end
        end

        register_instance_option(:link_icon) { 'icon-lock' }
        register_instance_option(:member?)   { true }
        register_instance_option(:visible?)  { authorized? && bindings[:object].access_locked? }

      end
    end
  end
end
