class User
  include MongoMapper::Document

  # key <name>, <type>
  key :name, String
  key :age, Integer
  key :email, String
  timestamps!

  def self.token_check(token)
    if token == 's3cr3t'
      @@token_check_result = true
    else
      @@token_check_result = false
    end
  end

  def as_json(options={})
    if @@token_check_result == true
      { :id => id,
        :name => name,
        :age => age,
        :email => email,
        :created_at => created_at,
        :updated_at => updated_at
      }
    else
      { :id => id,
        :name => name,
        :email => email,
        :created_at => created_at,
        :updated_at => updated_at
      }
    end
  end
end
