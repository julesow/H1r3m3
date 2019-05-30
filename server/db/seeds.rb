# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Applicant.destroy_all
Stage.destroy_all
ApplicantsStage.destroy_all

# applicants
Applicant.create(full_name: 'Souley Sow', first_name: "Souley", last_name:'Sow', email:'souley.sow@gmail.com', phone_number:333-333-3333)
Applicant.create(full_name: 'Mo Salah', first_name: "Mo", last_name:'Salah', email:'mo.salah@gmail.com', phone_number:333-345-3333)
# stages
Stage.create(name:'CV Screening')
Stage.create(name:'Phone Interview')
Stage.create(name:'Face to face Interview')
Stage.create(name:'HR meeting')
# applicant_stages

ApplicantsStage.create(applicant_id:1, stage_id:1, date:'2019-05-02',time:nil, duration:0, completed:false, outcome:false, email_sent:false, comment:'nothing to report yet', location:'')
ApplicantsStage.create(applicant_id:2, stage_id:1, date:'2019-05-03',time:nil, duration:0, completed:false, outcome:false, email_sent:false, comment:'ras', location:'')