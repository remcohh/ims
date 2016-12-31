# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project = Project.create!(name: "AGBP")
Project.create!(name: "AGTP")
Project.create!(name: "Shillong")
Project.create!(name: "Delhi")
designation = Designation.create!(name: "IT Officer")
Designation.create!(name: "Sr. Manager(E/M)")
Category.create!(name: "Competition Risks")
Category.create!(name: "Fire Risks")
User.create!(email: "itcellagbp@gmail.com", first_name: "John", last_name: "Rambo", designation_id: designation.id, department: "IT", project_id: project.id, password: "pass123", password_confirmation: "pass123", role: 1)
User.create!(email: "rm_agbp@gmail.com", first_name: "Risk", last_name: "Manager", designation_id: designation.id, department: "HOP Office", project_id: project.id, password: "pass123", password_confirmation: "pass123", role: 3)