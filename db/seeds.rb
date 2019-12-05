# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


SalesOffice.create!(email: "admin@example.jp",password:  "111111", sales_office_name: "営業所１")

DeliveryPerson.create!(email: "driver@example.jp",password:  "111111",name:"ドライバー１",
                       sales_office_id: "1", career: "5", face_photo_id: ""  )

