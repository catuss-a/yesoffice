require 'rails/generators'
require 'rails/generators/base'

module Yesoffice
  module Generators
    class InstallGenerator < Rails::Generators::Base

      argument :application_name, type: :string, default: 'Yesoffice', banner: 'APPLICATION_NAME'

      def self.source_root
        @yesoffice_source_root ||= File.expand_path('../templates', __FILE__)
      end

      def copy_application_layout
        template 'application.html.haml.erb', File.join('app/views/layouts', 'application.html.haml')
      end

      def copy_application_partials
        %w(header sidebar breadcrumbs flash_messages flash_modal disclaimer).each do |partial|
          path = File.join('app/views/application', "_#{partial}.html.haml")
          template "#{partial}.html.haml", path
        end
      end

      def copy_stylesheet
        template 'yesoffice.css.scss', File.join('app/assets/stylesheets', 'yesoffice.css.scss')
        template 'yesoffice_theme.css.scss', File.join('app/assets/stylesheets', 'yesoffice_theme.css.scss')
      end
    end
  end
end
