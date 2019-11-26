d = Doctor.create!(user_name: "yennguyen",
  full_name: "Nguyễn Thị Yên",
  email: "yennguyen26101998@gmail.com",
  department: "Phẫu thuật thần kinh",
  position: "Bác sỹ",
  password: "111111",
  password_confirmation: "111111")
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
    password_confirmation: "111111")
  d.image.attach io: File.open(Rails.root
    .join("app", "assets", "images", "default_doctor.jpg")),
    filename: "default_doctor.jpg"
  d.save
end
