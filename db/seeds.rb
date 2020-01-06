d = Doctor.create!(user_name: "yennguyen",
  full_name: "Nguyễn Thị Yên",
  email: "yennguyen26101998@gmail.com",
  department: "Phẫu thuật thần kinh",
  position: "Bác sỹ",
  password: "111111",
  password_confirmation: "111111",
  room: 301,
  confirmed_at: Time.zone.now)
d.image.attach io: File.open(Rails.root
  .join("app", "assets", "images", "default_doctor.jpg")),
  filename: "default_doctor.jpg"
d.save

20.times do |n|
  d = Doctor.create!(user_name: Faker::Name.name,
    full_name: Faker::Name.name,
    email: "example-#{n+1}@railstutorial.org",
    department: "Phẫu thuật thần kinh",
    position: "Bác sỹ",
    password: "111111",
    password_confirmation: "111111",
    room: 302,
    confirmed_at: Time.zone.now)
  d.image.attach io: File.open(Rails.root
    .join("app", "assets", "images", "default_doctor.jpg")),
    filename: "default_doctor.jpg"
  d.save
end

8.times do |n|
  p = Patient.create!(user_name: Faker::Name.name,
    full_name: Faker::Name.name,
    email: "email#{n}@gmail.com",
    password: "111111",
    password_confirmation: "111111",
    confirmed_at: Time.zone.now)
  p.image.attach io: File.open(Rails.root
    .join("app", "assets", "images", "default_avatar.png")),
    filename: "default_avatar.png"
  p.save
end

10.times do |n|
  p = Staff.create!(user_name: Faker::Name.name,
    full_name: Faker::Name.name,
    email: "staff#{n}@gmail.com",
    password: "111111",
    password_confirmation: "111111",
    confirmed_at: Time.zone.now)
  p.image.attach io: File.open(Rails.root
    .join("app", "assets", "images", "default_avatar.png")),
    filename: "default_avatar.png"
  p.save
end

8.times do |n|
    ShiftWork.create!(doctor_id: 1,
    start_time: Faker::Time.forward(days: 3, period: :day),
    end_time: Faker::Time.forward(days: 3, period: :day))
end

8.times do |n|
  Appointment.create!(doctor_id: 1, patient_id:22+n, status: 1,
  phone_patient: "0343934499",
  address_patient: "Ngach 67 Goc De",
  day: Date.today + n,
  start_time: "15:15:15",
  end_time: "17:15:15")
end

8.times do |n|
  Comment.create!(commentable_id: 1,
  patient_id: 25,
  commentable_type: "User",
  content: "GOOD")
end

p = User.create!(user_name: Faker::Name.name,
  full_name: Faker::Name.name,
  email: "admin@gmail.com",
  role: "Admin",
  password: "111111",
  password_confirmation: "111111",
  confirmed_at: Time.zone.now)
p.image.attach io: File.open(Rails.root
  .join("app", "assets", "images", "default_avatar.png")),
  filename: "default_avatar.png"
p.save
