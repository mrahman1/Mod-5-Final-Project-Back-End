# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Companies = Company.create([{name: Faker::Company.name},{name: Faker::Company.name}])
Jobs = Job.create([{title: Faker::Job.title, company_id: 1},{title: Faker::Job.title, company_id: 2}])
Candidates = Candidate.create([{name:'Faker::Name.name'}, {name:'Faker::Name.name'}, {name:'Faker::Name.name'}])
Applications = Application.create([{job_id: 1, candidate_id: 1},{job_id: 2, candidate_id:2},{job_id: 3, candidate_id: 3}])
Stages = Stage.create([{name: "interview"}, {name: "pre-screen"}, {name: "consider"}])
JobStages = JobStage.create([{job_id: 1, stage_id: 1}, {job_id: 2, stage_id: 1}, {job_id: 3, stage_id: 3}, {job_id: 3, stage_id: 2}, {job_id: 3, stage_id: 1}])

Application.create(
  job_id:
    Job.create(
      company_id: Company.create({name: Faker::Company.name}).id,
      title: Faker::Job.title
    ).id,
   candidate_id: Candidate.create({name:'Faker::Name.name'}).id
)
