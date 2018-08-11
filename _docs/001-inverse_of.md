# inverse_of

```rb
class Author < ApplicationRecord
  has_many :books, inverse_of: :author
end

class Book < ApplicationRecord
  belongs_to :author, inverse_of: :books
end


a = Author.first
b = a.books.first
a.first_name == b.author.first_name # => true [有了inverse_of之后，这里的对应的数据会更新]
a.first_name = 'Manny'
a.first_name == b.author.first_name # => true
```


## resources:
+ https://hashrocket.com/blog/posts/recursive-sql-in-activerecord
