class ChatUser {
  final String name;
  final String lastMessage;
  final String image;
  final String time;

  ChatUser({this.name, this.lastMessage, this.image, this.time});

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastMessage": lastMessage,
        "image": image,
        "time": time,
      };
}
