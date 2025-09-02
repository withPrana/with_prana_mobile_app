class SubCategoryResponseModel {
    String? id;
    String? name;
    dynamic description;
    bool? active;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? categoryId;
    dynamic color;
    Category? category;
    Count? count;

    SubCategoryResponseModel({
        this.id,
        this.name,
        this.description,
        this.active,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.color,
        this.category,
        this.count,
    });

    factory SubCategoryResponseModel.fromJson(Map<String, dynamic> json) => SubCategoryResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        categoryId: json["categoryId"],
        color: json["color"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "active": active,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "categoryId": categoryId,
        "color": color,
        "category": category?.toJson(),
        "_count": count?.toJson(),
    };
}

class Category {
    int? id;
    String? name;
    bool? active;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic backgroundImage;
    dynamic icon;
    String? color;

    Category({
        this.id,
        this.name,
        this.active,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.backgroundImage,
        this.icon,
        this.color,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        backgroundImage: json["backgroundImage"],
        icon: json["icon"],
        color: json["color"],
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
    };
}

class Count {
    int? meditations;

    Count({
        this.meditations,
    });

    factory Count.fromJson(Map<String, dynamic> json) => Count(
        meditations: json["meditations"],
    );

    Map<String, dynamic> toJson() => {
        "meditations": meditations,
    };
}
