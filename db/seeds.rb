# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project = Project.create!(name: "AGBP")
designation = Designation.create!(name: "IT Officer")
Category.create!(name: "Competition Risks")
Category.create!(name: "Fire Risks")
User.create!(email: "itcellagbp@gmail.com", first_name: "John", last_name: "Rambo", designation_id: designation.id, department: "IT", project_id: project.id, password: "pass123", password_confirmation: "pass123", role: 1)