require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'model'


class SatApplication < Sinatra::Application

#set :root=>(File.dirname(__FILE__)).join('..')

connect_string="sqlite://#{settings.root}"
DataMapper::Logger.new($stdout,:debug )
DataMapper.setup(:default,"sqlite://#{Dir.pwd}/db/sat.db")
DataMapper.finalize.auto_migrate!



  configure do
	end

	helpers do
	end

	get '/' do
		"<H1>hello world sqlite://#{Dir.pwd}/db/sat.db</H1>"
	end
end
