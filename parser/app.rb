require 'sinatra'
require "sinatra/activerecord"
require "./models/purchaser"
require "./models/item"
# set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
set :database_file, "config/database.yml"

class ParserApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    purchaser = Purchaser.first
    purchaser.name
    # erb :index

  end
end
