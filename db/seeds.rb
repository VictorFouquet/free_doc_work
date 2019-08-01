# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
100.times do
  doctor = Doctor.create!(
  	first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name,
  	speciality: Faker::Job.field,
  	zip_code: Faker::Number.number(digits: 5).to_s
    )
end

100.times do
	patient = Patient.create!(
  	first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name
  	)
end

100.times do
	appointment = Appointment.create!(
  	date: Faker::Time.forward(days: 5,  period: :day, format: :long),
  	doctor: Doctor.find(rand(Doctor.first.id..Doctor.last.id)),
  	patient: Patient.find(rand(Patient.first.id..Patient.last.id))
  	)
end
