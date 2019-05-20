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
ItineraryItem.destroy_all


admin = User.create(username: 'admin', password: 'test', email: 'test@test.com', first_name: 'chris', last_name: 'truong');
admin2 = User.create(username: 'admin2', password: 'test', email: 'test2@test2.com', first_name: 'chris2', last_name: 'truong2');
testtrip = Trip.create(admin_id: admin.id, destination: 'Tokyo');
testtrip2 = Trip.create(admin_id: admin2.id, destination: 'Seoul');

UserTrip.create(user_id: admin.id, trip_id: testtrip.id, total_balance: 1000, paid: 500);
UserTrip.create(user_id: admin2.id, trip_id: testtrip2.id, total_balance: 100, paid: 50);
ItineraryItem.create(trip_id: testtrip.id, name: 'Disney Sea')
ItineraryItem.create(trip_id: testtrip2.id, name: 'Gangnam Style')