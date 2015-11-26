module Yesoffice
  class Engine < Rails::Engine
    isolate_namespace Yesoffice

    initializer 'yesoffice.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Yesoffice::ApplicationHelper
        helper Yesoffice::ViewHelper
      end
    end
  end
end
