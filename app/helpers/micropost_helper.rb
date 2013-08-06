require 'erb'

module MicropostHelper

	def wrap(content)
		sanitize( 
			raw(content.split.map{ |s| wrap_long_string(s) }.join(' ') ) )
	end

	private
		def wrap_long_string(text, max_width = 30)
			zero_with_space = "&#8203;"
			regex = /.{#{max_width}}/
			(text.length < max_width) ? text : text.scan(regex).join(zero_with_space)
		end
end