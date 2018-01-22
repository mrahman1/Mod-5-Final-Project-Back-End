# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Companies = Company.create([{name: Faker::Company.name},{name: Faker::Company.name}])
Jobs = Job.create([
  {title: Faker::Job.title, user_id: 1, description: Faker::Lorem.paragraph, status: 'incomplete'},
  {title: Faker::Job.title, user_id: 2, description: Faker::Lorem.paragraph, status: 'filled'},
  {title: Faker::Job.title, user_id: 1, description: Faker::Lorem.paragraph, status: 'incomplete'},
  {title: Faker::Job.title, user_id: 1, description: Faker::Lorem.paragraph, status: 'filled'}
  ])

Candidates = Candidate.create([
  {name:Faker::Name.name, user_id: 2, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, education: Faker::University.name},
  {name:Faker::Name.name, user_id: 1, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, education: Faker::University.name},
  {email: Faker::Internet.email, name:Faker::Name.name, user_id: 3, phone: Faker::PhoneNumber.phone_number, education: Faker::University.name}
  ])
Applications = Application.create([{job_id: 1, candidate_id: 1, stage_id: 1},{job_id: 2, candidate_id:2, stage_id: 1},{job_id: 3, candidate_id: 3, stage_id: 1}])
Stages = Stage.create([{name: "interview"}, {name: "pre-screen"}, {name: "consider"}])
JobStages = JobStage.create([{job_id: 1, stage_id: 1}, {job_id: 2, stage_id: 1}, {job_id: 3, stage_id: 3}, {job_id: 3, stage_id: 2}, {job_id: 3, stage_id: 1}])
Users = User.create([{email:Faker::Internet.email, company_id: 1, password: "cheese"},{email:Faker::Internet.email, company_id: 2, password: "cheese"},{email:Faker::Internet.email, company_id: 3,password: "cheese"}])

Application.create(
  job_id:
    Job.create(
      user_id: 1,
      title: Faker::Job.title
    ).id,
   candidate_id: Candidate.create({name:Faker::Name.name, user_id: 1}).id,
   stage_id: 1
)

User.create({email: 'test', password: 'test', company_id: 1})
Candidate.create({name: 'test candidate', user_id: 3})
