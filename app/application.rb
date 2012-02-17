require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'model'
require 'rack-flash'
require 'sinatra/redirect_with_flash'


class SatApplication < Sinatra::Application

#set :root=>(File.dirname(__FILE__)).join('..')
set :sessions, true

connect_string="sqlite://#{settings.root}"
DataMapper::Logger.new($stdout,:debug )
DataMapper.setup(:default,"sqlite://#{Dir.pwd}/db/sat.db")
#DataMapper.finalize.auto_migrate!



  configure do
	end

	helpers do
	end

	get '/' do
		"<H1>hello world sqlite://#{Dir.pwd}/db/sat.db</H1>"
	end

	get '/tipos' do
		@tipos=Tipo.all 
		erb :list_tipo
	end
	
	get '/tipos/' do
            erb :create_tipo
	end
	
	get '/tipos/:id' do
	end
	
	post '/tipos/' do
             t=Tipo.new
	     			 t.texto = params[:tipo]
             t.save
	end

	get '/trabajo/recepcion' do
	end

	post '/trabajo/recepcion' do
	end

	get '/trabajo/pendientes' do
	end

	get '/trabajo/end' do
	end
end
