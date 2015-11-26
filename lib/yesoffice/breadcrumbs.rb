module Yesoffice
  module Breadcrumbs
    def self.included(base)
      base.helper_method(:add_crumb)
    end

    def add_crumb(name, path = nil)
      @_breadcrumbs ||= []
      @_breadcrumbs << { name: name, path: path }
    end
  end
end

ActionController::Base.class_eval do
  include Yesoffice::Breadcrumbs
end
