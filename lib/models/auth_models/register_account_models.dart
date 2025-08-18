///After hittin this, it will send an otp
class RegisterAccountBodyModel {
  String? name;
  String? email;

  RegisterAccountBodyModel({this.name, this.email});

  factory RegisterAccountBodyModel.fromJson(Map<String, dynamic> json) =>
      RegisterAccountBodyModel(name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {"name": name, "email": email};
}
