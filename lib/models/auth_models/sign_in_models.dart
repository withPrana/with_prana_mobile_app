/////
class SignInBodyModel {
  String? email;

  SignInBodyModel({this.email});

  factory SignInBodyModel.fromJson(Map<String, dynamic> json) =>
      SignInBodyModel(email: json["email"]);

  Map<String, dynamic> toJson() => {"email": email};
}

//////
class SignInResponseModel {
    bool? success;
    String? message;
    String? token;

    SignInResponseModel({
        this.success,
        this.message,
        this.token,
    });

    factory SignInResponseModel.fromJson(Map<String, dynamic> json) => SignInResponseModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
    };
}
