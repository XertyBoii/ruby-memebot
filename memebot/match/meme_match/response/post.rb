module Memebot
  module Match
    class MemeMatch < SlackRubyBot::Bot
      class Response
        class Post

          attr_reader :data
          private :data

          def initialize(data)
            @data = data
          end

          def text
            @text ||= data.dig(:data, :title)
          end

          def image
            @image ||= data.dig(:data, :url)
          end

        end
      end
    end
  end
end
