class User {

  int? id;
  String? username;
  String? email;
  String? password;
  String? name;
  String? displayName;
  String? accessToken;

  User({this.id, this.username, this.email, this.password, this.name,
    this.displayName, this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    email = json['user_email'] ?? '';
    name = json['user_nicename'] ?? '';
    displayName = json['user_display_name'] ?? '';
    accessToken = json['token'] ?? '';
  }

  toJson() => {
    'username': username ?? '',
    'email': email ?? '',
    'password': password ?? '',
  };

  toCache() => {
    'id': id,
    'user_nicename': name ?? '',
    'user_display_name': displayName ?? '',
    'user_email': email ?? '',
    'token': accessToken ?? '',
  };
}