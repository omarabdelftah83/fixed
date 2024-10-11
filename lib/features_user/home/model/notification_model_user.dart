class NotificationUser {
  final int id;
  final String title;
  final String content;
  final int user;

  NotificationUser({
    required this.id,
    required this.title,
    required this.content,
    required this.user,
  });

  factory NotificationUser.fromJson(Map<String, dynamic> json) {
    return NotificationUser(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      user: json['user'],
    );
  }

}
