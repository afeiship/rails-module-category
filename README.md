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

## load categories from YAML file(db/category/seeds.yml):
```bash
rake db:categories
```


## resources:
+ https://github.com/rails/acts_as_tree/blob/master/lib/active_record/acts/tree.rb
+ https://github.com/amerine/acts_as_tree
+ https://stackoverflow.com/questions/30091996/using-a-parent-child-self-join-in-activerecord
+ https://stackoverflow.com/questions/18169204/getting-parent-in-self-referential-model
+ http://guides.rubyonrails.org/association_basics.html#self-joins
+ http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/
+ https://stackoverflow.com/questions/27210244/recursively-render-tree-in-rails
+ https://stackoverflow.com/questions/4205613/rails-nested-content-tag
+ http://www.cnblogs.com/goody9807/p/5712140.html
+ https://www.leighhalliday.com/tree-structures-in-your-rails-models