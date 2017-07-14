# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


parent = Category.create name: 'animal';

c1 = Category.new name:'cat'
c2 = Category.new name:'dog'
c1.parent = parent;
c2.parent = parent;

c1.save
c2.save

d1 = Category.new name:'ww1'
d2 = Category.new name:'ww2'

c2.children << d1
c2.children << d2

d1.save
d2.save
