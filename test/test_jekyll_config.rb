# frozen_string_literal: true

require_relative 'test_helper'
require 'yaml'

class TestJekyllConfig < Minitest::Test
  def test_future_meetings_are_published
    config_path = File.expand_path('../_config.yml', __dir__)
    config = YAML.safe_load(File.read(config_path), permitted_classes: [Symbol])

    assert_equal true, config['future']
  end
end
