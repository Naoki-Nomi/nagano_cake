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