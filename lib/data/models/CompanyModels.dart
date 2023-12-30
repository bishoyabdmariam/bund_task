import 'dart:convert';

class Company {
  final String name;
  final String category;
  final String image;
  final List<Condition> conditions;
  final List<WhatYouGet> whatYouGet;

  Company({
    required this.name,
    required this.category,
    required this.image,
    required this.conditions,
    required this.whatYouGet,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "category": category,
      "image": image,
      "conditions": conditions.map((c) => c.toJson()).toList(),
      "whatYouGet": whatYouGet.map((w) => w.toJson()).toList(),
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    List<dynamic> conditionsJson = json['conditions'] ?? [];
    List<dynamic> whatYouGetJson = json['whatYouGet'] ?? [];

    List<Condition> conditions =
    conditionsJson.map((c) => Condition.fromJson(c)).toList();

    List<WhatYouGet> whatYouGet =
    whatYouGetJson.map((w) => WhatYouGet.fromJson(w)).toList();

    return Company(
      name: json['name'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      conditions: conditions,
      whatYouGet: whatYouGet,
    );
  }


}

class Condition {
  final String text;
  final String image;

  Condition({required this.text, required this.image});

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "image": image,
    };
  }

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] as String,
      image: json['image'] as String,
    );
  }
}

class WhatYouGet {
  final String text;
  final String image;
  final bool isEnabled;

  WhatYouGet({
    required this.text,
    required this.image,
    required this.isEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "image": image,
      "isEnabled": isEnabled,
    };
  }

  factory WhatYouGet.fromJson(Map<String, dynamic> json) {
    return WhatYouGet(
      text: json['text'] as String,
      image: json['image'] as String,
      isEnabled: json['isEnabled'] as bool,
    );
  }
}
