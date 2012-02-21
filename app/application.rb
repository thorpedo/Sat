require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'model'
require 'sinatra/flash'


class SatApplication < Sinatra::Application

#set :root=>(File.dirname(__FILE__)).join('..')
enable :sessions

connect_string="sqlite://#{settings.root}"
DataMapper::Logger.new($stdout,:debug )
DataMapper.setup(:default,"sqlite://#{Dir.pwd}/db/sat.db")



  configure do
	end

	get '/' do
		"<H1>hello world sqlite://#{Dir.pwd}/db/sat.db</H1>"
	end

	get '/create_db' do
			DataMapper.auto_migrate!
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
             if t.save
										 flash[:notice ] = "registro grabado"
						 else
										 flash[:error ] = "NO SE PUDO GRABAR EL REGISTRO"
						 end
						 redirect "/tipos"

	end

	get '/trabajo/recepcion' do
		  erb :recepcion			
	end

	post '/trabajo/recepcion' do
	end

	get '/trabajo/pendientes' do
	end

	get '/trabajo/end' do
	end
end
