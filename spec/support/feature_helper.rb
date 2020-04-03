# frozen_string_literal: true

module FeatureHelper
  def login(name, pwd); end
end

RSpec.configure do |config|
  config.include FeatureHelper
end
