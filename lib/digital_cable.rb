# frozen_string_literal: true

require "rails/engine"
require "active_support/all"
require "digital_cable/version"

require "digital_cable/broadcaster"
require "digital_cable/reflex"

module DigitalCable
  class Engine < Rails::Engine; end
end
