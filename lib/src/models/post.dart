import 'models.dart';

class Post {
  final String postId;
  final User user;
  final String imageURL;
  final String temperature;
  final String location;
  final String weather_code;
  final DateTime created;

  Post(this.postId, this.user, this.imageURL, this.temperature, this.location,
      this.weather_code, this.created);
}
