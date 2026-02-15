# راهنمای گام‌به‌گام راه‌اندازی دیتابیس

شما دو راه برای راه‌اندازی دیتابیس خود دارید:

## روش اول: استفاده از اسکریپت SQL (پیشنهادی)
اگر می‌خواهید مستقیماً تیبل‌ها را در SQL Server Management Studio (SSMS) ایجاد کنید:
1. فایل `database_setup.sql` که در ریشه پروژه بک‌ند قرار دارد را باز کنید.
2. محتویات آن را کپی کرده و در یک Query جدید در دیتابیس خود اجرا کنید.

## روش دوم: استفاده از Entity Framework Core Migrations
این روش استاندارد .NET برای همگام‌سازی کد و دیتابیس است:

### ۱. نصب ابزار EF (اگر نصب نیست)
در ترمینال دستور زیر را اجرا کنید:
```bash
dotnet tool install --global dotnet-ef
```

### ۲. اضافه کردن میگریشن اولیه
در پوشه `khatoon_server_dotnet` دستور زیر را بزنید تا تمام مدل‌ها به زبان میگریشن ترجمه شوند:
```bash
dotnet ef migrations add InitialCreate
```

### ۳. بروزرسانی دیتابیس
دستور زیر را بزنید تا تیبل‌ها مستقیماً در دیتابیس ساخته شوند (اطمینان حاصل کنید که ConnectionString در `appsettings.json` درست باشد):
```bash
dotnet ef database update
```

---

### تنظیمات رشته اتصال (Connection String)
فایل `appsettings.json` را باز کنید و آدرس دیتابیس خود را تنظیم کنید:
```json
"ConnectionStrings": {
  "DatabaseConnection": "Server=YOUR_SERVER;Database=FarmDb;Trusted_Connection=True;TrustServerCertificate=True;"
}
```
