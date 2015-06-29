require 'sinatra'
require 'json'
require 'yaml'
require_relative 'lib/simple_database'
require_relative 'lib/auth_helpers'
require_relative 'lib/config_files'

helpers AuthHelpers

configure do
  set :db, SimpleDatabase.new(ENV['MONGOLAB_URI'])
  settings.db.create_if_empty(:user, name: 'admin', password: 'admin')
  settings.db.create_if_empty(:data, ConfigFiles.seed)
  set :schema, ConfigFiles.schema.to_json
  set :form, ConfigFiles.form.to_json
end

get '/admin' do
  protected!
  erb :admin
end

post '/user' do
  protected!
  settings.db.set(:user, params)
  redirect '/admin'
end

post '/data' do
  protected!
  settings.db.set(:data, params)
  halt 200
end

get '/' do
  @admin = settings.db[:user]
  @data = settings.db[:data]
  erb :index
end
