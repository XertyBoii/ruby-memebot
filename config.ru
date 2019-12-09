$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'slack_memebot'
require 'memebot/web'

Memebot::Bot.run

run Sinatra
