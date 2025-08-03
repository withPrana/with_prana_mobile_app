////
class VerifyOtpBodyModel {
  String? otp;
  String? email;

  VerifyOtpBodyModel({this.otp, this.email});

  factory VerifyOtpBodyModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpBodyModel(otp: json["otp"], email: json["email"]);

  Map<String, dynamic> toJson() => {"otp": otp, "email": email};
}

/////
class ResendOtpBodyModel {
  String? email;

  ResendOtpBodyModel({this.email});

  factory ResendOtpBodyModel.fromJson(Map<String, dynamic> json) =>
      ResendOtpBodyModel(email: json["email"]);

  Map<String, dynamic> toJson() => {"email": email};
}
