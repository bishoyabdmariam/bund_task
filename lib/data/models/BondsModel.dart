class Bond {
  String image;
  String title;
  String subTitle;
  String data;

  Bond({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.data,
  });

  factory Bond.fromJson(Map<String, dynamic> json) {
    return Bond(
      image: json['image'],
      title: json['title'],
      subTitle: json['subTitle'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'data': data,
    };
  }
}
