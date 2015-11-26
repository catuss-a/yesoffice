require 'rails/generators'
require 'rails/generators/base'

module Yesoffice
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      def self.source_root
        @devise_source_root ||= File.expand_path('../templates/devise', __FILE__)
      end

      def copy_devise_partials
        Dir[File.join(self.class.source_root, 'passwords/*.html.haml')].each do |file|
          file = File.basename(file)
          template "passwords/#{file}", File.join('app/views/devise/passwords', file)
        end

        Dir[File.join(self.class.source_root, 'sessions/*.html.haml')].each do |file|
          file = File.basename(file)
          template "sessions/#{file}", File.join('app/views/devise/sessions', file)
        end

        Dir[File.join(self.class.source_root, 'shared/*.html.haml')].each do |file|
          file = File.basename(file)
          template "shared/#{file}", File.join('app/views/devise/shared', file)
        end
      end

      def copy_devise_locales
        template 'devise.fr.yml', File.join('config/locales', 'devise.fr.yml')
      end
    end
  end
end
