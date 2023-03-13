class PhotoComment {
  int photoId;
  String userName;
  String comment;

  PhotoComment(this.photoId, this.userName, this.comment);

  factory PhotoComment.fromJson(Map<String, dynamic> json) {
    final comment = json["body"] as String;
    final userName = json["user"]["username"] as String;

    // TODO use the right Id
    final id = json["postId"] as int;
    return PhotoComment(id, userName, comment);
  }
}
