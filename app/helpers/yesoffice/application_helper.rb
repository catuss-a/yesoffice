module Yesoffice
  module ApplicationHelper
    def current_section
      params[:section] || params[:controller]
    end

    def render_breadcrumbs
      render partial: 'application/breadcrumbs'
    end
  end
end
