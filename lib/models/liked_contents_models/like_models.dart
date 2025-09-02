class AddLikeBodyModel {
    String? meditationId;
    String? userId;

    AddLikeBodyModel({
        this.meditationId,
        this.userId,
    });

    factory AddLikeBodyModel.fromJson(Map<String, dynamic> json) => AddLikeBodyModel(
        meditationId: json["meditationId"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "meditationId": meditationId,
        "userId": userId,
    };
}
