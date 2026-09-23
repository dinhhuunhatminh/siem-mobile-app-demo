/// Thông tin user dùng chung nhiều feature (auth, dashboard, profile...).
///
/// Đặt ở shared/models thay vì features/auth/data để feature khác
/// không phải import chéo vào data/ của feature auth.
class User {
  const User({
    required this.id,
    required this.email,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

  final String id;
  final String email;
  final String name;
}
