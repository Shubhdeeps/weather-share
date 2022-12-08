class User {
  final String username;
  late final String fullName;
  final String uid;
  late final String profileURL;

  User(this.username, this.fullName, this.uid, this.profileURL);

  Map<String, String> getUser() {
    return {
      "username": username,
      "fullName": fullName,
      "uid": uid,
      "profileURL": profileURL
    };
  }

  void updateUser(Map<String, String> user) {
    fullName = user["fullName"]!;
    profileURL = user["profileURL"]!;
  }
}
