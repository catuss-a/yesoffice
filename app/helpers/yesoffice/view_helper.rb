module Yesoffice
  module ViewHelper
    def pop_dialog(options={})
      options = {close_icon: false}.merge(options)

      content_tag(:li, class: 'notification-dropdown', id: options[:id]) do
        concat(content_tag(:a, href: '#', class: 'trigger') do
          if options[:icon]
            concat(content_tag(:i, nil, class: options[:icon]))
          elsif options[:title]
            concat(options[:title])
          else
            concat(content_tag(:i, nil, class: 'icon-bell'))
          end
          if options[:counter]
            concat(content_tag(:span, options[:counter], class: (options[:counter] > 0 ? 'count' : 'count empty')))
          end
        end)
        concat(content_tag(:div, class: 'pop-dialog') do
          concat(content_tag(:div, class: 'pointer right') do
            concat(content_tag(:div, nil, class: 'arrow'))
            concat(content_tag(:div, nil, class: 'arrow_border'))
          end)
          concat(content_tag(:div, class: 'body') do
            if options[:close_icon]
              concat(content_tag(:a, href: '#', class: 'close-icon') do
                concat(content_tag(:i, nil, class: 'icon-remove-sign'))
              end)
            end
            concat(content_tag(:div, class: 'notifications') do
              yield if block_given?
            end)
          end)
        end)
      end
    end
  end
end
