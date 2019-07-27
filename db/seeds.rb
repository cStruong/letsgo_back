User.destroy_all
Trip.destroy_all
UserTrip.destroy_all
ExpenseItem.destroy_all


admin = User.create(username: 'admin', password: 'test', email: 'test@test.com', first_name: 'Chris', last_name: 'Truong', profile_picture: 'https://upload.wikimedia.org/wikipedia/en/d/dc/MichaelScott.png');
admin2 = User.create(username: 'admin2', password: 'test', email: 'test2@test2.com', first_name: 'chris2', last_name: 'truong2');
user1 = User.create(username: 'user1', password: 'test', email: 'test3@test.com', first_name: 'Ryan', last_name: 'Ho', profile_picture: 'https://upload.wikimedia.org/wikipedia/en/thumb/9/91/Ryan_Howard_%28The_Office%29.jpg/235px-Ryan_Howard_%28The_Office%29.jpg');
user2 = User.create(username: 'user2', password: 'test', email: 'test4@test.com', first_name: 'Brian', last_name: 'Ryu', profile_picture: 'https://vignette.wikia.nocookie.net/familyguy/images/8/8b/FGuy_Brian_Gen2012_R3Flat.jpg/revision/latest?cb=20120905115633');
user3 = User.create(username: 'user3', password: 'test', email: 'test5@test.com', first_name: 'Simon', last_name: 'Mei', profile_picture: 'https://cdn.images.dailystar.co.uk/dynamic/46/photos/878000/Simon-Cowell-1680878.jpg?r=5d2902c6341f7');
user4 = User.create(username: 'user4', password: 'test', email: 'test6@test.com', first_name: 'James', last_name: 'Dorr', profile_picture: 'https://wwwimage-secure.cbsstatic.com/thumbnails/photos/w425/cast/c09d9cc84b3b9d19_theworldsbest_jamescorden_800x1000.jpg');



testtrip = Trip.create(admin_id: admin.id, destination: 'Tokyo', date: '2019-05-31', picture_url: 'https://cdn.cnn.com/cnnnext/dam/assets/170606110126-tokyo-skyline.jpg');
testtrip2 = Trip.create(admin_id: admin2.id, destination: 'Paris', date: '2019-06-22', picture_url: 'https://d39gusjpdm7p1o.cloudfront.net/data/layout_grouping/static_page_step/20784_a330628091ede7eb1548d6cda58e0357.jpg?ver=1477297804');


UserTrip.create(user_id: admin.id, trip_id: testtrip.id);
UserTrip.create(user_id: admin2.id, trip_id: testtrip2.id);
UserTrip.create(user_id: user1.id, trip_id: testtrip.id);
UserTrip.create(user_id: user2.id, trip_id: testtrip.id);
UserTrip.create(user_id: user3.id, trip_id: testtrip2.id);
UserTrip.create(user_id: user4.id, trip_id: testtrip2.id);

ExpenseItem.create(trip_id: testtrip.id, name: 'Disney Sea', estimated_cost: 50, paid: false)
ExpenseItem.create(trip_id: testtrip.id, name: 'Tokyo Tower', estimated_cost: 30, paid: false)
ExpenseItem.create(trip_id: testtrip.id, name: 'Ichiran Ramen', estimated_cost: 10, paid: true)
ExpenseItem.create(trip_id: testtrip.id, name: 'Mario Karting', estimated_cost: 50, paid: false)
ExpenseItem.create(trip_id: testtrip2.id, name: 'Gangnam Style', estimated_cost: 30, paid: false)

ItineraryItem.create(trip_id: testtrip.id, name: 'Fish Market')
ItineraryItem.create(trip_id: testtrip.id, name: 'Tokyo Station')
