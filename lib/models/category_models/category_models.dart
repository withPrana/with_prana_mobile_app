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

  factory CategoryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CategoryResponseModel(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    isDeleted: json["isDeleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

  Count({this.meditations, this.subcategories});

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    meditations: json["meditations"],
    subcategories: json["subcategories"],
  );

  Map<String, dynamic> toJson() => {
    "meditations": meditations,
    "subcategories": subcategories,
  };
}

/////////////////Category by id
class CategoryByIdResponseModel {
  int? id;
  String? name;
  bool? active;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? backgroundImage;
  String? icon;
  String? color;
  List<Meditation>? meditations;
  List<Subcategory>? subcategories;

  CategoryByIdResponseModel({
    this.id,
    this.name,
    this.active,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.backgroundImage,
    this.icon,
    this.color,
    this.meditations,
    this.subcategories,
  });

  factory CategoryByIdResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CategoryByIdResponseModel(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    isDeleted: json["isDeleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    backgroundImage: json["backgroundImage"],
    icon: json["icon"],
    color: json["color"],
    meditations:
        json["meditations"] == null
            ? []
            : List<Meditation>.from(
              json["meditations"]!.map((x) => Meditation.fromJson(x)),
            ),
    subcategories:
        json["subcategories"] == null
            ? []
            : List<Subcategory>.from(
              json["subcategories"]!.map((x) => Subcategory.fromJson(x)),
            ),
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
    "meditations":
        meditations == null
            ? []
            : List<dynamic>.from(meditations!.map((x) => x.toJson())),
    "subcategories":
        subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
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
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

class Subcategory {
  String? id;
  String? name;
  dynamic description;
  bool? active;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryId;
  dynamic color;

  Subcategory({
    this.id,
    this.name,
    this.description,
    this.active,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.color,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    active: json["active"],
    isDeleted: json["isDeleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    categoryId: json["categoryId"],
    color: json["color"],
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
  };
}
