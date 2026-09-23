/// Bộ giá trị bo góc dùng chung — mọi component tham chiếu tới đây thay
/// vì gõ số tùy hứng (8, 10, 12...) rải rác từng nơi.
class AppRadius {
  AppRadius._();

  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const full = 999.0; // bo tròn hoàn toàn (pill shape)
}
