
Companies = Company.create([
  {name: Faker::Company.name},
  {name: Faker::Company.name},
  {name: Faker::Company.name}
  ])

  Users = User.create([
    {email: 'mimi@test.com', password: 'test', company_id: 1},
    {email:Faker::Internet.email, company_id: 1, password: "cheese"},
    {email:Faker::Internet.email, company_id: 2, password: "cheese"},
    {email:Faker::Internet.email, company_id: 3,password: "cheese"}
  ])

Stages = Stage.create([
  {name: "reject"},
  {name: "pre-screen"},
  {name: "interview"},
  {name: "consider"}])

15.times do
  Job.create(
    title: Faker::Job.title,
    user_id: 1,
    description: Faker::Lorem.paragraph,
    position: Faker::Job.field,
    skills: "#{Faker::Job.key_skill}, #{Faker::Job.key_skill}, #{Faker::Job.key_skill}", employment_type: "Full Time",
    education_level: "Bachelor",
    field: Faker::Job.field,
    status: 'incomplete',
    job_stages: [JobStage.create(stage_id: 1), JobStage.create(stage_id: 2)]
  )
end

20.times do
  Candidate.create(
      name:Faker::Name.name,
      user_id: 1,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      education: Faker::University.name,
      work_experience: "#{Faker::Job.title}, #{Faker::Date.between(1.year.ago, Date.today)}, #{Faker::Job.title}, #{Faker::Date.between(1.year.ago, Date.today)}, #{Faker::Job.title}, #{Faker::Date.between(1.year.ago, Date.today)}"
  )
end

Applications = Application.create([
  {job_id: 1, candidate_id: 1, stage_id: 1},
  {job_id: 2, candidate_id: 2, stage_id: 1},
  {job_id: 3, candidate_id: 3, stage_id: 1},
  {job_id: 4, candidate_id: 4, stage_id: 1},
  {job_id: 5, candidate_id: 5, stage_id: 1},
  {job_id: 6, candidate_id: 6, stage_id: 1},
  {job_id: 7, candidate_id: 1, stage_id: 1},
  {job_id: 8, candidate_id: 3, stage_id: 1},
  {job_id: 9, candidate_id: 2, stage_id: 1},
  ])

15.times do
  Application.create(job_id: 1, candidate_id: 1, stage_id: 1)
end



JobStages = JobStage.create([
  {job_id: 1, stage_id: 1},
  {job_id: 2, stage_id: 2},
  {job_id: 3, stage_id: 3},
  {job_id: 3, stage_id: 4},
  {job_id: 3, stage_id: 1}
])
