require 'rails/generators'
require 'rails/generators/base'

module Yesoffice
  module Generators
    class KaminariGenerator < Rails::Generators::Base
      def self.source_root
        @kaminari_source_root ||= File.expand_path('../templates/kaminari', __FILE__)
      end

      def copy_kaminari_partials
        Dir[File.join(self.class.source_root, '*.html.haml')].each do |file|
          file = File.basename(file)
          template file, File.join('app/views/kaminari', file)
        end
      end

      def copy_kaminari_locales
        template 'kaminari.fr.yml', File.join('config/locales', 'kaminari.fr.yml')
      end
    end
  end
end
