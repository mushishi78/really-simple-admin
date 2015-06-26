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
  settings.db.create_if_empty(:config, ConfigFiles.default)
  set :form, ConfigFiles.form
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

post '/config' do
  protected!
  settings.db.set(:config, params)
  halt 200
end

get '/' do
  @admin = settings.db[:user]
  @config = settings.db[:config]
  erb :index
end
