# CLAUDE.md — Quy ước project (Flutter mobile app)

Tài liệu này là quy ước bắt buộc tuân theo khi code project này. Lý do/giải thích chi tiết cho từng quyết định nằm ở `report.html` cùng thư mục — file này chỉ tóm tắt phần "phải làm gì", không giải thích lại "vì sao".

## Tổng quan project

- App mobile bằng Flutter, build ra cả Android và iOS.
- Loại app: quản lý thông tin của nhiều hệ thống (system info management) — có đăng nhập, dữ liệu lưu trên SQL online qua backend API (app không kết nối thẳng vào SQL).
- Định hướng sản phẩm: **theo mô hình Splunk Mobile** — app SIEM di động, tổng hợp log/cảnh báo từ nhiều nguồn.

## Phạm vi chức năng đã chốt (không tự ý mở rộng)

Chỉ 3 chức năng chính, đúng phạm vi Splunk Mobile thật — **không** thêm chức năng quản lý user/cấu hình nguồn/thao tác xử lý sâu vào hệ thống:

1. **Dashboards** — chỉ XEM (không tạo/sửa trên app), gồm nhiều panel (chart/KPI/table) hiển thị dữ liệu có sẵn từ backend.
2. **Alerts** — 1 alert = 1 sự kiện/log từ 1 nguồn cụ thể, nhóm hiển thị theo nguồn (`SourceGroupCard`). Chỉ xem + lọc theo mức độ/nguồn — **không** có trạng thái đã đọc/đã xử lý (acknowledge).
3. **Search** — tìm kiếm đơn giản bằng từ khóa, lọc text trong danh sách alert/dashboard. **Không** phải tab riêng — tích hợp qua icon 🔍 trên AppBar của Alerts/Dashboards, mở `SearchDialog`. Không có ngôn ngữ truy vấn kiểu SPL.

**Mapping sang 4 tab hiện có:**
- `Home` — giữ nguyên vai trò chào user/logout, không đổi thành dashboard tổng quan.
- `Alerts`, `Dashboards` — đúng 2 chức năng trên.
- `Reports` — chưa có chức năng, giữ placeholder "đang phát triển" tới khi có quyết định mới.

## Tech stack đã chốt

| Hạng mục | Lựa chọn | Package |
|---|---|---|
| State management + DI | Riverpod (bản code generation) | `flutter_riverpod`, `riverpod_annotation`; dev: `riverpod_generator`, `build_runner` |
| Gọi API | Dio | `dio` |
| Local DB (cache có cấu trúc/quan hệ) | Drift | `drift`, `sqlite3_flutter_libs`; dev: `drift_dev`, `build_runner` |
| Lưu token | flutter_secure_storage | `flutter_secure_storage` |
| Cấu hình/cờ đơn giản | shared_preferences | `shared_preferences` |
| Điều hướng | go_router | `go_router` |
| Xem thử component/màn hình độc lập | Widgetbook | `widgetbook`, `widgetbook_annotation`; dev: `widgetbook_generator` |

**Không dùng `get_it`.** DI do Riverpod đảm nhiệm hoàn toàn — mỗi module tự khai báo `Provider` cung cấp instance của mình (xem mục Quy tắc bên dưới).

**go_router: ghim `^15.x`, không tự ý nâng major version.** Bản `18.0.1` từng kéo theo package thử nghiệm (`material_ui`/`cupertino_ui`) đòi `meta ^1.19`, xung đột với `meta 1.18.0` mà chính Flutter SDK pin cứng — gây lỗi biên dịch toàn app. Trước khi nâng version, kiểm tra lại vấn đề này.

Vì dùng code generation (Riverpod + Drift), khi code cần chạy song song:
```
dart run build_runner watch -d
```

## Cấu trúc thư mục `lib/` (bắt buộc theo đúng cây này)

```
lib/
├── main.dart                  → load config, bọc ProviderScope, runApp()
├── main_widgetbook.dart        → entrypoint riêng cho Widgetbook (xem Quy tắc 8)
├── widgetbook/                  → use case (@UseCase) cho Widgetbook — không phải code sản xuất,
│                                  không import từ app/, core/, features/
├── app/
│   ├── app.dart                → MaterialApp/CupertinoApp, dùng AppTheme.light/dark
│   └── router/
│       ├── app_router.dart     → GoRouter + logic redirect (đọc authProvider)
│       └── route_names.dart    → hằng số tên route
├── core/                        → hạ tầng kỹ thuật, KHÔNG chứa UI, KHÔNG chứa màn hình
│   ├── auth/                    → AuthService, AuthState/authProvider (logic only)
│   ├── config/                  → app_config.dart, env (dev/staging/prod)
│   ├── constants/
│   ├── database/                → Drift: app_database.dart, tables/
│   ├── network/                 → api_client.dart (Dio), interceptors/
│   └── storage/                 → secure storage (token), shared preferences
├── shared/                      → dùng chung nhiều feature, liên quan UI/tiện ích
│   ├── premium/                 → constants + widget hiệu ứng cao cấp riêng
│   ├── theme/
│   │   ├── app_colors.dart      → màu seed gốc
│   │   ├── app_theme.dart       → ThemeData đầy đủ (AppTheme.light / .dark)
│   │   ├── app_spacing.dart     → design token khoảng cách
│   │   └── app_radius.dart      → design token bo góc
│   ├── validation/               → validator dùng chung (email, password...)
│   ├── models/                   → model/DTO dùng chung nhiều feature
│   └── widgets/                  → mỗi component 1 thư mục con (bottom_navbar, buttons,
│                                    inputs, cards, states, scaffolds, glass_card...)
└── features/                     → mỗi feature 1 thư mục
    └── <feature>/
        ├── data/                  → models, datasources (remote/local), repositories
        ├── domain/                → (chỉ thêm khi feature phức tạp cần usecase)
        └── presentation/
            ├── screens/
            └── state/             → provider riêng của feature này (không dùng chung)
```

## Quy tắc bắt buộc

1. **`core/auth/` vs `features/auth/`**: `core/auth/` chỉ chứa logic (AuthService, AuthState, authProvider) — KHÔNG được đặt widget/màn hình ở đây. Toàn bộ giao diện đăng nhập/đăng ký nằm ở `features/auth/presentation/`, chỉ gọi xuống `core/auth/` qua `ref`.
2. **State toàn cục vs state riêng feature**: state chỉ dùng trong 1 feature → đặt trong `features/<feature>/presentation/state/`. State nhiều nơi cùng cần đọc (vd trạng thái đăng nhập) → đặt cạnh module sở hữu nó (vd `core/auth/`), không gom vào 1 thư mục "state" chung ở gốc.
3. **DI qua Riverpod, không qua get_it**: mỗi instance dùng chung (Dio, AppDatabase...) expose qua 1 `Provider` ngay trong module của nó (vd `apiClientProvider` trong `core/network/`), nơi khác lấy qua `ref.watch`/`ref.read`, không tự khởi tạo lại.
4. **Repository là lớp duy nhất được gọi từ tầng UI/state** — không gọi thẳng `datasources/remote` hay `datasources/local` từ `presentation/`.
5. **Model dùng chung ≥ 2 feature** → đặt ở `shared/models/`, không import chéo `data/` giữa các feature với nhau.
6. **Cấu hình môi trường** (API base URL, key...) đọc từ `core/config/`, không hardcode trong code.
7. **Quyền/permission, tên app, icon, bundle id**: sửa trong `android/app/src/main/AndroidManifest.xml` và `ios/Runner/Info.plist` — không sửa trong `lib/`. `android/` và `ios/` là project native do Flutter sinh sẵn, chỉ chỉnh sửa khi cần (quyền, version, signing, icon), không viết mới.
8. **Thứ tự dựng UI: theme/tokens → component dùng chung → ghép màn hình.** Trước khi code 1 component mới trong `shared/widgets/`, đảm bảo `shared/theme/` đã có giá trị cần dùng (màu, spacing, radius) — không hardcode số/màu trực tiếp trong component. Mỗi component/theme mới nên có 1 use case tương ứng trong `lib/widgetbook/` (file `*.usecase.dart`, dùng `@widgetbook.UseCase`) để xem thử qua `flutter run -t lib/main_widgetbook.dart -d chrome` trước khi ghép vào `features/`. Sau khi thêm/sửa use case, chạy lại `dart run build_runner build` để cập nhật `main_widgetbook.directories.g.dart` (file tự sinh, không sửa tay).

## Pipeline xây dựng 1 feature mới (bắt buộc theo đúng thứ tự)

Không nhảy thẳng vào code UI/component khi chưa xong bước 1–2. Thứ tự:

1. **Chốt kiến trúc + stack + cây thư mục** — đã xong 1 lần cho toàn app, chỉ cần xem lại khi feature mới cần công nghệ chưa có (vd Drift khi cần cache quan hệ).
2. **Thảo luận chức năng** — feature này cho người dùng làm được gì, phạm vi tới đâu (xem mục "Phạm vi chức năng đã chốt" ở trên làm ví dụ). Đây là bước dễ bị bỏ qua nhất — không suy luận chức năng từ ảnh tham khảo hay từ component đã có, phải chốt bằng thảo luận trước.
3. **Xác định màn hình cần có** — dựa trên chức năng đã chốt ở bước 2, không đoán theo giao diện tham khảo.
4. **Kiểm/đối chiếu danh mục component** — xem `shared/widgets/` đã đủ chưa cho các màn hình ở bước 3; thiếu thì quay lại quy tắc 8 để bổ sung.
5. **Xây dựng màn hình thật** — theo đúng luồng lớp: contract dữ liệu (model) → datasource (mock trước, API thật sau) → repository → state/controller riêng feature → UI ghép component có sẵn.

## Ghi chú môi trường build (Windows)

- **Kotlin incremental compilation đã tắt** (`android/gradle.properties`: `kotlin.incremental=false`) do bug "Could not close incremental caches" giữa Gradle 9.1.0 + Kotlin 2.3.20 trên Windows, gây fail `flutter build apk`. Không bật lại flag này trừ khi đã xác nhận bug được vá ở version mới hơn.

## Tài liệu tham khảo

- `report.html` (cùng thư mục): giải thích chi tiết lý do cho từng quyết định ở trên, lộ trình dev tổng thể, và nội dung bên trong `android/`/`ios/`.
- `project-overview.html` (cùng thư mục): mô tả trạng thái *hiện tại* của project — cây thư mục thật, tech stack đã cài, những gì đã xong/còn dở. Cập nhật file này mỗi khi thêm feature/stack mới, khác với `report.html` (kiến thức quy trình chung, ít đổi).
