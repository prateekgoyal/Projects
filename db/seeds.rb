# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Post.delete_all
Post.create(:name => 'Prateek', :title => 'First Post', :content => %{<p>Hello everyone, I am Prateek Goyal</p>})
# ...
Post.create(:name => 'Abc', :title => 'Indian Premier League:bane or boon', :content => %{<p>There is a huge debate going on in the country whether IPL should continue or not.</p>})
# ...
Post.create(:name => 'Prateek', :title => 'Sachinism', :content => %{<p>A fan who will stop watching cricket after God retires</p>})

