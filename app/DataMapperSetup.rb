require 'data_mapper'
require 'dm-postgres-adapter'

ENV['RACK_ENV'] ||= :development

def data_mapper_setup
  DataMapper.setup(:default, "postgres://localhost/MakersBnB_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end