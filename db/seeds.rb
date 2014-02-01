# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# coding: utf-8
username = ["suzuki", "itou", "yamada", "inoue", "hosimo", "kadowaki"]
group = [1, 2, 3, 4, 5, 1]
mail = ["2@gmail.com", "3@gmail.com", "4@ga.com", "44@dfaf.com", "f@csod.com", "dfs@f.com"]
ary = [username, mail].transpose
h = Hash[*ary.flatten]
h.each do |username, mail|
	User.create(username: username, email: mail)
end
p h
Group.create(user_id: 3, tasktop_id: 3, )
User.create(username: "yaginuuu", group: 1, email: "yaginuuu56@gmail.com")
