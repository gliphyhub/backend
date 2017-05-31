require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GliphyHub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :es
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag.include?("input")
        ar = html_tag.split(/ /)
        final = [ar[0..-2], "class = \"input-error\"", ar[-1]].join (" ")
        "#{final}".html_safe
	      #"<div class=\"input-error\">#{html_tag}</div>".html_safe
      else
        "#{html_tag}".html_safe
      end
	   #"#{html_tag}".html_safe
	}
  end
end
