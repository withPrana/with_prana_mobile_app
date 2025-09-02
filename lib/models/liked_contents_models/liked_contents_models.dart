class LikedContentsResponseModel {
    String? id;
    String? userId;
    String? meditationId;
    DateTime? createdAt;
    Meditation? meditation;

    LikedContentsResponseModel({
        this.id,
        this.userId,
        this.meditationId,
        this.createdAt,
        this.meditation,
    });

    factory LikedContentsResponseModel.fromJson(Map<String, dynamic> json) => LikedContentsResponseModel(
        id: json["id"],
        userId: json["userId"],
        meditationId: json["meditationId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        meditation: json["meditation"] == null ? null : Meditation.fromJson(json["meditation"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "meditationId": meditationId,
        "createdAt": createdAt?.toIso8601String(),
        "meditation": meditation?.toJson(),
    };
}

class Meditation {
    String? id;
    String? title;
    String? description;
    int? duration;
    String? link;
    String? thumbnail;
    bool? isPremium;
    bool? active;
    bool? isDeleted;
    int? playCount;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? categoryId;
    String? subcategoryId;
    String? type;

    Meditation({
        this.id,
        this.title,
        this.description,
        this.duration,
        this.link,
        this.thumbnail,
        this.isPremium,
        this.active,
        this.isDeleted,
        this.playCount,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.subcategoryId,
        this.type,
    });

    factory Meditation.fromJson(Map<String, dynamic> json) => Meditation(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        link: json["link"],
        thumbnail: json["thumbnail"],
        isPremium: json["isPremium"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        playCount: json["playCount"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        categoryId: json["categoryId"],
        subcategoryId: json["subcategoryId"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "link": link,
        "thumbnail": thumbnail,
        "isPremium": isPremium,
        "active": active,
        "isDeleted": isDeleted,
        "playCount": playCount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "type": type,
    };
}
