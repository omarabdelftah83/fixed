class NotificationUserDelete {
  final String message;  // تغيير الاسم هنا من 'massage' إلى 'message'

  NotificationUserDelete({
    required this.message,
  });

  factory NotificationUserDelete.fromJson(Map<String, dynamic> json) {
    return NotificationUserDelete(
      message: json['message'],  // تأكد من تطابق الحقل مع الـ API
    );
  }
}