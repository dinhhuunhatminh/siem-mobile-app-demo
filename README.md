# SIEM Mobile App (demo)

App mobile Flutter theo mô hình **Splunk Mobile** — SIEM di động tổng hợp log/cảnh báo từ nhiều nguồn. Có đăng nhập, dữ liệu lưu trên Postgres online qua backend API riêng (app không kết nối thẳng vào database).

## Chức năng

- **Alerts** — xem danh sách cảnh báo, nhóm theo nguồn (Firewall/SIEM/WAF/NAC/Antivirus), lọc theo mức độ (High/Medium/Low), tìm kiếm.
- **Dashboards** — 4 panel thống kê: tỷ lệ theo mức độ, cảnh báo theo nguồn, xu hướng 7 ngày, top nguồn.
- **Home** — chào user sau đăng nhập, logout.
- **Reports** — chưa có chức năng (placeholder).

## Kiến trúc & quy ước

Toàn bộ quy ước bắt buộc (cấu trúc thư mục, tech stack, pipeline xây feature) nằm trong [`CLAUDE.md`](./CLAUDE.md). Tài liệu trình bày chi tiết luồng dữ liệu, sơ đồ, hướng dẫn chạy thử: [`presentation-overview.html`](./presentation-overview.html) (mở trực tiếp bằng trình duyệt).

## Backend

Project này **không tự chạy được một mình** — cần backend riêng (Node.js + Express + Postgres) cung cấp API. Xem repo backend: [siem-mobile-backend-demo](https://github.com/dinhhuunhatminh/siem-mobile-backend-demo)

## Chạy thử nhanh

```bash
flutter pub get
flutter run          # cần backend đang chạy trước, xem README backend
```

Tài khoản test: `test@example.com` / `password123` (seed sẵn ở backend).

Chi tiết đầy đủ (setup Android emulator, chạy Widgetbook xem component độc lập...) xem mục V trong [`presentation-overview.html`](./presentation-overview.html).
