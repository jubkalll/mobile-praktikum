class Course {
  final String code;
  final String title;
  final int credits;
  bool isFavorite;

  Course({
    required this.code,
    required this.title,
    required this.credits,
    this.isFavorite = false,
  });
}