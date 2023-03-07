class PhotoResource {
  int id;
  String url;
  String photographer;
  String photographerUrl;
  String avgColor;
  String alt;

  PhotoResource(this.id, this.url, this.photographer, this.photographerUrl,
      this.avgColor, this.alt);

  factory PhotoResource.fromJson(Map<String, dynamic> json) {
    return PhotoResource(
        json['id'] as int,
        json['src']['large'] as String,
        json['photographer'] as String,
        "https://api.dicebear.com/5"
            ".x/personas/png?seed=${json['photographer']}",
        json['avg_color'] as String,
        json['alt'] as String);
  }
}
