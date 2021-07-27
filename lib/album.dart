class Album {
  int id;
  int userId;
  String title;

  Album(this.id, this.userId, this.title);

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json['id'], json['userId'], json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title
    };
  }
}