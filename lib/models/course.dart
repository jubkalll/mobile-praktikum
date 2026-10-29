class Course {
  final int? id;
  final String code;
  final String title;
  final int credits;
  final String status;
  bool isFavorite; // Field ini ditambahkan kembali agar error hilang

  // Hapus kata 'const' di sini karena isFavorite bisa berubah nilainya
  Course({
    this.id,
    required this.code,
    required this.title,
    required this.credits,
    this.status = 'planned',
    this.isFavorite = false, // Default value
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int?,
      code: json['code'] as String? ?? 'MOB-${json['id'] ?? 0}', 
      title: json['title'] as String? ?? 'Tanpa Judul',
      credits: json['credits'] as int? ?? 2,
      status: json['status'] as String? ?? 'planned',
      // isFavorite tidak diambil dari JSON karena ini state lokal UI
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'title': title,
    'credits': credits,
    'status': status,
  };
}