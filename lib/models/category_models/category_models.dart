class CategoryResponseModel {
    int? id;
    String? name;
    bool? active;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? backgroundImage;
    String? icon;
    String? color;
    Count? count;

    CategoryResponseModel({
        this.id,
        this.name,
        this.active,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.backgroundImage,
        this.icon,
        this.color,
        this.count,
    });

    factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        backgroundImage: json["backgroundImage"],
        icon: json["icon"],
        color: json["color"],
        count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "backgroundImage": backgroundImage,
        "icon": icon,
        "color": color,
        "_count": count?.toJson(),
    };
}

class Count {
    int? meditations;
    int? subcategories;

    Count({
        this.meditations,
        this.subcategories,
    });

    factory Count.fromJson(Map<String, dynamic> json) => Count(
        meditations: json["meditations"],
        subcategories: json["subcategories"],
    );

    Map<String, dynamic> toJson() => {
        "meditations": meditations,
        "subcategories": subcategories,
    };
}
