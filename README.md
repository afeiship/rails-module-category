# rails-module-category
> Rails module for simple multiple category.

## step by step:
+ migrate model:
```conf
rails g model Category name:string description:string parent_id:integer
rails g controller Categories index show new create edit update destroy

## routes.rb [ resources :categories ]

bin/rake db:migrate
```
+ associations:
```rb
class Category < ApplicationRecord
  before_save :fill_model

  # self join:
  has_many :children, class_name: "Category", foreign_key: :parent_id, inverse_of: :children
  belongs_to :parent, class_name: "Category", foreign_key: :parent_id, inverse_of: :parent, optional: true
  
  private
    def fill_model
      self.parent_id = 0 unless self.parent_id
    end
end
```

## seed code:
```rb
parent = Category.new name: 'animal'
c1 = Category.new name:'cat'
c2 = Category.new name:'dog'
c1.parent = parent;
c2.parent = parent;

parent.save
c1.save
c2.save


# a1 = Category.find_by_id 1
# a2 = Category.find_by_id 2
# a3 = Category.find_by_id 3

```

## reset data:
```bash
rake db:drop && rake db:migrate && rake db:seed
```


## resources:
+ https://stackoverflow.com/questions/30091996/using-a-parent-child-self-join-in-activerecord
+ https://stackoverflow.com/questions/18169204/getting-parent-in-self-referential-model
+ http://guides.rubyonrails.org/association_basics.html#self-joins