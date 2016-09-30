$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'action_view_template_safe_locals'

require 'minitest/autorun'

require 'rails'
require 'action_controller'

class FakeApplication < Rails::Application; end

Rails.application = FakeApplication
Rails.configuration.action_controller = ActiveSupport::OrderedOptions.new
Rails.configuration.secret_key_base = 'secret_key_base'

FIXTURE_LOAD_PATH = File.join(File.dirname(__FILE__), 'fixtures')
