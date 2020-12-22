class ChatMessage{
  String message;
  String sender;
  String receiver;
  ChatMessage({this.message, this.sender, this.receiver});

  Map<String, Object> toJson() {
    Map<String, Object> data = {
      "message" : this.message,
      "sender": this.sender,
      "receiver": this.receiver,
    };
    return data;
  }
}