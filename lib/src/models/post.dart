import '../utils/imageCard/imageCard.dart';
import 'models.dart';

class Post {
  final String uid;
  final String imageURL;
  final int temperature;
  final String location;
  final String weather_code;
  final DateTime created;
  final int lat;
  final int lon;
  final String type;
  late bool isInsideUserProfile;
  late User user;
  Post(
    this.uid,
    this.imageURL,
    this.temperature,
    this.location,
    this.weather_code,
    this.created,
    this.lat,
    this.lon,
    this.type,
  );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "imageURL": imageURL,
        "temperature": temperature,
        "location": location,
        "weather_code": weather_code,
        "created": created,
        "lat": lat,
        "lon": lon,
        "type": type,
      };

  setUser(User user) {
    this.user = user;
  }

  getPostContainer() {
    return ImageCard(
      imageURL: imageURL,
      userName: user.username,
      userProfileURL: user.profileURL,
      timeOfPost: 13,
      temprature: temperature,
      location: location,
      weather: "Snowy",
      isInsideUserProfile: isInsideUserProfile,
    );
  }
}
