# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(id: 1) do |admin|
 admin.email = "example@example.com"
 admin.password = "example"
end

Customer.find_or_create_by(id: 1) do |customer|
 customer.last_name = "田中"
 customer.first_name = "太郎"
 customer.last_name_kana = "タナカ"
 customer.first_name_kana = "タロウ"
 customer.email = "tanaka@com"
 customer.postal_code = "10000001"
 customer.address = "東京都港区３丁目"
 customer.telephone_number = "101000011111"
 customer.is_deleted = "有効"
 customer.password = "tanaka"
end

Genre.create!(
 [
  {
   name: "果物"
   },
  {
   name: "野菜"
   }
 ]
 )

Item.create!(
 [
  {
   name: "りんご",
   introduction: "りんごです",
   price: "300",
   genre_id: 1
   },
  {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 2
   },
  {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 2
   },
     {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 1
   },
     {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 2
   },
     {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 1
   },
     {
   name: "バナナ",
   introduction: "バナナです",
   price: "500",
   genre_id: 1
   }
 ]
 )