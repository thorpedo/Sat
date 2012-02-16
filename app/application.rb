require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'model'


class SatApplication < Sinatra::Application

#set :root=>(File.dirname(__FILE__)).join('..')

connect_string="sqlite://#{settings.root}"
DataMapper::Logger.new($stdout,:debug )
DataMapper.setup(:default,"sqlite://#{Dir.pwd}/../db/sat.db")


  configure do
	end

	helpers do
	end

	get '/' do
		"<H1>hello world</H1>"
	end
end
