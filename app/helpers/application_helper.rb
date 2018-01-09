module ApplicationHelper
	def form_group_tag(errors, &block)
		css_class = 'form-group'
		css_class << 'has-error' if errors.any?
		content_tag :div, capture(&block), class: css_class
	end

	def markdown(text)
		require 'redcarpet'
		options = {
						:fenced_code_blocks => 	 true,
						:filter_html => 			 	 true,
						:hard_wrap => 				 	 true,
						:link_attributes => 	 	 { rel: 'nofollow', target: "_blank" },
						:space_after_headers =>  true
		}

		extensions = {
							 :autolink => 	 true,
							 :superscript => true,
							 :quote => 			 true,
		}

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)
		markdown.render(text).html_safe
	end
end
