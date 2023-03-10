class PhotoResource {
  int id;
  String url;
  String photographer;
  String photographerUrl;
  String avgColor;
  String alt;
  bool liked;

  PhotoResource(this.id, this.url, this.photographer, this.photographerUrl,
      this.avgColor, this.alt, this.liked);

  factory PhotoResource.fromJson(Map<String, dynamic> json) {
    // Using dicebear to generate an avatar based on the name
    return PhotoResource(
      json['id'] as int,
      json['src']['large'] as String,
      json['photographer'] as String,
      "https://api.dicebear.com/5.x/personas/png?seed=${json['photographer']}",
      json['avg_color'] as String,
      json['alt'] as String,
      false,
    );
  }
}
