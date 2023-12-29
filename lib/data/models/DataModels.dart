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
}

class Condition {
  final String text;
  final String image;

  Condition({required this.text, required this.image});
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
}
