require_relative 'response/post'

module Memebot
  module Match
    class MemeMatch < SlackRubyBot::Bot
      class Response

        attr_reader :data
        private :data

        def initialize(data)
          @data = data
        end

        def get_meme
          "*Title*: #{post.text}\n" +
          "*Image*: #{post.image}"
        end

        private

        def post
          @post ||= Post.new(filtered_posts.sample)
        end

        def filtered_posts
          posts.select do |post|
            post.dig(:data, :ups) > 100 &&
            post.dig(:data, :over_18) == false &&
            post.dig(:data, :url).empty? == false
          end
        end

        def posts
          data.body.data.children
        end

      end
    end
  end
end
