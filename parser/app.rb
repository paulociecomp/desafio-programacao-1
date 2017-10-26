require 'sinatra'

class ParserApp < Sinatra::Base
  get '/' do
    erb :index
  end
end
