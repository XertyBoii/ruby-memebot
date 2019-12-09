require 'reddit/base'
require_relative 'meme_match/response'

module Memebot
  module Match
    class MemeMatch < SlackRubyBot::Bot
      match /^I need a meme$/  do |client, data, match|
        client.say(
          channel: data.channel,
          text: "Fetching a meme..."
        )

        client.say(
          channel: data.channel,
          text: "#{MemeMatch.meme}"
        )
      end

      def self.meme
        self.new.meme
      end

      def meme
        response.get_meme
      end

      private

      def response
        @response ||= Response.new(request)
      end

      def request
        user.get(subreddits.sample, nocache: true)
      rescue
        user.get(subreddits.sample, nocache: true)
      end

      def user
        @user ||= Reddit::Base::Client.new(user: ENV['REDDIT_USERNAME'], password: ENV['REDDIT_PASSWORD'])
      end

      def subreddits
        [
          '/r/memes',
          '/r/wholesomememes',
          '/r/dankchristianmemes',
          '/r/memeeconomy',
          '/r/dankmemes'
        ]
      end
    end
  end
end
