module DigitalCable

  class DigitalCableError < StandardError; end
  module Broadcaster

    OPERATIONS = [
      :add_css_class,
      :console_log,
      :dispatch_event,
      :inner_html,
      :insert_adjacent_html,
      :insert_adjacent_text,
      :morph,
      :notification,
      :outer_html,
      :push_state,
      :remove,
      :remove_attribute,
      :remove_css_class,
      :set_attribute,
      :set_cookie,
      :set_dataset_property,
      :set_focus,
      :set_property,
      :set_style,
      :set_styles,
      :set_value,
      :text_content
    ]

    def broadcast(identifier, method:, options:)
      verify_method!(method)

      ActionCable.server.broadcast identifier, {
        "digitalCable" => true,
        "operation" => { method: method.to_s.camelize(:lower), options: options }
      }
    end

    def broadcast_to(identifier, model, method:, options:)
      verify_method!(method)

      identifier.broadcast_to model, {
        "digitalCable" => true,
        "operation" => { method: method.to_s.camelize(:lower), options: options }
      }
    end

    private

    def verify_method!(method)
      raise DigitalCableError, "Undefined method" unless OPERATIONS.include?(method.to_sym)
    end

  end
end
