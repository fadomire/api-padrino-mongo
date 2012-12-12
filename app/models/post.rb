class Post
  include MongoMapper::Document
  
  # key <name>, <type>
  key :title, String
  key :body, String
  key :file, String
  key :user_id, ObjectId
  timestamps!

  belongs_to :user
  validates_presence_of :title
  validates_presence_of :body
  has_search  :title, :body

  def as_json(options={})
      { :id => id,
        :title => title,
        :body => body,
        :file => file ? file : nil,
        :author => User.find_by_id(user_id) ? User.find_by_id(user_id).name : nil,
        :created_at => created_at,
        :updated_at => updated_at
      }
  end
end
