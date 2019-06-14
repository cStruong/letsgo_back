# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trip.destroy_all
UserTrip.destroy_all
ExpenseItem.destroy_all


admin = User.create(username: 'admin', password: 'test', email: 'test@test.com', first_name: 'chris', last_name: 'truong');
admin2 = User.create(username: 'admin2', password: 'test', email: 'test2@test2.com', first_name: 'chris2', last_name: 'truong2');
user1 = User.create(username: 'user1', password: 'test', email: 'test3@test.com', first_name: 'ryan', last_name: 'ho');
user2 = User.create(username: 'user2', password: 'test', email: 'test4@test.com', first_name: 'brian', last_name: 'ryu');
user3 = User.create(username: 'user3', password: 'test', email: 'test5@test.com', first_name: 'simon', last_name: 'mei');
user4 = User.create(username: 'user4', password: 'test', email: 'test6@test.com', first_name: 'james', last_name: 'dorr');



testtrip = Trip.create(admin_id: admin.id, destination: 'Tokyo', date: '2019-05-31', picture_url: 'https://cdn.cnn.com/cnnnext/dam/assets/170606110126-tokyo-skyline.jpg');
testtrip2 = Trip.create(admin_id: admin2.id, destination: 'Seoul', date: '2019-06-22', picture_url: 'https://www.webuildvalue.com/static/upload/seo/seoul-megacity-growth-sustainable.jpg');


UserTrip.create(user_id: admin.id, trip_id: testtrip.id);
UserTrip.create(user_id: admin2.id, trip_id: testtrip2.id);
UserTrip.create(user_id: user1.id, trip_id: testtrip.id);
UserTrip.create(user_id: user2.id, trip_id: testtrip.id);
UserTrip.create(user_id: user3.id, trip_id: testtrip2.id);
UserTrip.create(user_id: user4.id, trip_id: testtrip2.id);

ExpenseItem.create(trip_id: testtrip.id, name: 'Disney Sea', estimated_cost: 50)
ExpenseItem.create(trip_id: testtrip.id, name: 'Tokyo Tower', estimated_cost: 30)
ExpenseItem.create(trip_id: testtrip.id, name: 'Ichiran Ramen', estimated_cost: 10)
ExpenseItem.create(trip_id: testtrip.id, name: 'Mario Karting', estimated_cost: 50)
ExpenseItem.create(trip_id: testtrip2.id, name: 'Gangnam Style', estimated_cost: 30)