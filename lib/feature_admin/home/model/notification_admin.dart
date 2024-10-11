class NotificationAdmin {
  final int id;
  final String title;
  final String content;
  final int brovider;

  NotificationAdmin({
    required this.id,
    required this.title,
    required this.content,
    required this.brovider,
  });

  factory NotificationAdmin.fromJson(Map<String, dynamic> json) {
    return NotificationAdmin(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      brovider: json['brovider'],
    );
  }
}

