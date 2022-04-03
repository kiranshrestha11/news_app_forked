class TopHeadlineModel {
  TopHeadlineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  factory TopHeadlineModel.fromJson(Map<String, dynamic> json) =>
      TopHeadlineModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };
}
