if ENV['MONGOHQ_URL']
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'], :logger => logger)
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)
  case Padrino.env
    when :development then MongoMapper.database = 'augmented_development'
    when :production  then MongoMapper.database = 'augmented_production'
    when :test        then MongoMapper.database = 'augmented_test'
  end
end