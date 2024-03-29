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
	property	:password,		String

	has n,			:tareas		
	belongs_to	:propietario
	belongs_to	:tipo
end

class Tipo
		include DataMapper::Resource
		
		property 	:id,				Serial
		property	:texto,				String
		
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

		def nombre_completo
						"#{nombre} #{apellido1} #{apellido2}"
		end
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

class Texto
	include DataMapper::Resource
		
		property 	:id,				Serial
		property	:texto,				String
		property	:tipo,				String

end


#DataMapper.auto_migrate!

