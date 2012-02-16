#!/usr/bin/ruby

#require 'data_mapper'
require 'dm-core'
require 'dm-migrations'


#DataMapper::Logger.new($stdout,:debug )
#DataMapper.setup(:default,"sqlite://db/sat.db")

class Equipo
	include DataMapper::Resource
	
	property 	:id,				Serial
	property	:nserie,			String,	:key=>true
	property	:marca,				String
	property	:modelo,			String

	belongs_to	:propietario
	belongs_to	:tipo
#	has_n,		:tareas		
end

class Tipo
		include DataMapper::Resource
		
		property 	:id,				Serial
		property	:texto,				String
		property	:created_at,		DateTime
		property	:updated_at,		DateTime
		
end
	

class Propietario
		include DataMapper::Resource
		
		property 	:id,				Serial
		property	:nombre,			String,	:required=>true
		property	:apellido1,			String,	:required=>true
		property	:apellido2,			String
		property	:dni,				String
		property	:telefono_fijo,		String
		property	:movil,				String	
		
		has n,		:equipos
end

class Tarea
	include DataMapper::Resource
		
		property 	:id,				Serial
		property 	:fecha_entrada,		Date
		property	:sintomas,			Text
		property 	:backup,			Boolean
		property	:backup_de,			Text
		property	:que_entrega,		Text
		property 	:reparacion,		Text
		property	:precio,			Float
		property	:cobrado,			Float
		property	:fecha_salida,		Date
		
		belongs_to 	:equipo
end


#DataMapper.auto_migrate!

