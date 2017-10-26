require 'sinatra'
require "sinatra/activerecord"
require "./models/wrapper"
require "./models/parser"
require "./models/purchaser"
require "./models/item"
require "./models/merchant"
require "./models/purchase"
require "./models/job"
# set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
set :database_file, "config/database.yml"

class ParserApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do

    erb :index
  end

  post '/upload' do
    path = params[:upload][:tempfile].path

    job = Parser.new(path).setup

    redirect "/revenue/#{job.id}"
  end

  get '/revenue/:id' do
    job = Job.find params[:id]

    "Receita Bruta do arquivo #{job.revenue}"
  end
end
