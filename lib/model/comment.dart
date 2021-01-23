class Comment {
  int postId;
  int id;
  String email;
  String body;
  String name;

  Comment({this.postId, this.id, this.email, this.body, this.name});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postId: json["postId"],
        id: json["id"],
        email: json["email"],
        body: json["body"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "email": email,
        "body": body,
        "name": name,
      };
  String toString() => "postId:$postId, id: $id, email: $email, body: $body, name: $name";
}
