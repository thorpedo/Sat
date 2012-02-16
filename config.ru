
ROOT=File.expand_path(File.dirname(__FILE__))
$:.push File.join(ROOT, 'app')
$:.push File.join(ROOT, %w{app models})

require 'application'

run SatApplication
