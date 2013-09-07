# RailsAdmin config file. Generated on March 09, 2013 16:52
# See github.com/sferik/rails_admin for more informations

%w[ lock_user unlock_user ].each { |p| require "rails_admin/config/actions/#{ p }" }

RailsAdmin.config do |config|
  config.attr_accessible_role { :admin }
  config.current_user_method  { current_user }

  config.authorize_with :cancan

  config.main_app_name = ['Dev Fu! Base', 'Admin']

  config.actions do
    dashboard
    index
    new
    show
    edit
    delete
    lock_user   { only User }
    unlock_user { only User }
  end

end
