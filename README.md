# rails-module-category
> Rails module for simple multiple category.

## step by step:
```conf
rails g model Category name:string description:string parent_id:integer
rails g controller Categories index show new create edit update destroy

## routes.rb [ resources :categories ]

bin/rake db:migrate
```