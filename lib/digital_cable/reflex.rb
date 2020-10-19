require 'digital_cable'

module DigitalCable
  class Reflex < ApplicationCable::Channel
    include DigitalCable::Broadcaster

    delegate :render, to: :ApplicationController

    attr_accessor :stream_name

    def subscribed
      stream_from generate_stream_name(params)
    end

    def process_reflex(data)
      reflex(data)
    end

    def reflex(data); end

    def response; end

    private

    def generate_stream_name(params)
      self.stream_name = "reflex:#{params['identifier']}"
    end
  end
end
