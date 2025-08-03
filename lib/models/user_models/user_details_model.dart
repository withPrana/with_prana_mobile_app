class UserDetailsResponseModel {
  String? name;
  String? email;

  UserDetailsResponseModel({this.name, this.email});

  factory UserDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponseModel(name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {"name": name, "email": email};
}
