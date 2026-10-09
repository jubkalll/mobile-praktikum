class Course {
  final String code;
  final String title;
  final int credits;
  final String status;
  bool isFavorite;

  Course({
    required this.code,
    required this.title,
    required this.credits,
    required this.status,
    this.isFavorite = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'] as String,
      title: json['title'] as String,
      credits: json['credits'] as int,
      status: json['status'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'title': title,
      'credits': credits,
      'status': status,
      'isFavorite': isFavorite,
    };
  }
}