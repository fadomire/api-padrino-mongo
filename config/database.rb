MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'augmented_development'
  when :production  then MongoMapper.database = 'augmented_production'
  when :test        then MongoMapper.database = 'augmented_test'
end
