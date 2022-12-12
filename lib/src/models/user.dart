class User {
  final String username;
  late final String fullName;
  final String uid;
  late final String location;
  late final String profileURL;

  User(this.username, this.uid, this.profileURL, this.location);

  static User fromJson(Map<String, dynamic> json) => User(
        json["username"],
        json["uid"],
        json["profileURL"],
        json["location"],
      );

  Map<String, dynamic> toJson() => {
        "usernname": username,
        "uid": uid,
        "profileURL": profileURL,
        "location": location
      };

  void updateUser(Map<String, String> user) {
    fullName = user["fullName"]!;
    profileURL = user["profileURL"]!;
  }
}
