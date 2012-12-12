== Basic API using padrino and mongodb
demo url : http://api-padrino-mongo.herokuapp.com

There is 2 objects : User and Post

Following routes are available :
URL                   REQUEST  PATH
(:posts, :index)        GET    /posts
(:posts, :search)       GET    /search
(:posts, :create)      POST    /posts
(:posts, :show)         GET    /posts/:id
(:posts, :update)       PUT    /posts/:id
(:posts, :destroy)    DELETE   /posts/:id
(:users, :index)        GET    /users
(:users, :create)      POST    /users
(:users, :show)         GET    /users/:id
(:users, :update)       PUT    /users/:id
(:users, :destroy)    DELETE   /users/:id

You can search posts on Title and Body attributes by requesting something like :
http://api-padrino-mongo.herokuapp.com/search?q=titleISearch

There is a private attribute for User called Age which is only display if your request contains :
token=s3cr3t
for e.g : http://api-padrino-mongo.herokuapp.com/users?token=s3cr3t

Post has an attribute to store files, so you can post file with request like :
curl -F "post[title]=postTitle1" -F "post[body]=postBody1" -F "post[user_id]=50c71b7c3521730377000001" -F "post[file]=@README.md" http://api-padrino-mongo.herokuapp.com//posts