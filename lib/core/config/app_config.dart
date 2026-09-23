/// Cấu hình theo môi trường (dev/staging/prod).
class AppConfig {
  const AppConfig({required this.apiBaseUrl});

  final String apiBaseUrl;

  /// 10.0.2.2 là địa chỉ đặc biệt của Android emulator trỏ về localhost
  /// của máy host — dùng để gọi backend Node.js đang chạy trên máy dev
  /// (npm run dev, cổng 3000). Chạy trên thiết bị thật cần đổi sang IP
  /// LAN thật của máy host hoặc domain backend đã deploy.
  static const AppConfig dev = AppConfig(
    apiBaseUrl: 'http://10.0.2.2:3000',
  );
}
