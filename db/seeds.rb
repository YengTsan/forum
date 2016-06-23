# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create( :name => "商業" )
Category.create( :name => "心理" )
Category.create( :name => "男女" )
Category.create( :name => "工作" )
Category.create( :name => "其他" )
