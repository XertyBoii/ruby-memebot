require 'sinatra/base'

module Memebot
  class Web < Sinatra::Base
    get '/' do
      'Memebot is ready to post'
    end
  end
end
