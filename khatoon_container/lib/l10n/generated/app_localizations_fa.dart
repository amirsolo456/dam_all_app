// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'Demo app';

  @override
  String get pageLoginUsername => 'Your username';

  @override
  String get pageLoginPassword => 'Your password';

  @override
  String pageHomeTitle(Object firstName) {
    return 'Welcome $firstName';
  }

  @override
  String pageHomeInboxCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You have $count new messages',
      one: 'You have 1 new message',
      zero: 'You have no new messages',
    );
    return '$_temp0';
  }

  @override
  String pageHomeBirthday(String sex) {
    String _temp0 = intl.Intl.selectLogic(sex, {
      'male': 'His birthday',
      'female': 'Her birthday',
      'other': 'Their birthday',
    });
    return '$_temp0';
  }

  @override
  String commonVehicleType(String vehicleType) {
    String _temp0 = intl.Intl.selectLogic(vehicleType, {
      'sedan': 'Sedan',
      'cabriolet': 'Solid roof cabriolet',
      'truck': '16 wheel truck',
      'other': 'Other',
    });
    return '$_temp0';
  }

  @override
  String pageHomeBalance(double amount, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      decimalDigits: 2,
      name: 'USD',
      symbol: '\$',
      customPattern: '¤#0.00',
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Your balance is $amountString on $dateString';
  }

  @override
  String get appTitle => 'نرم‌افزار حسابداری';

  @override
  String get common_ok => 'تأیید';

  @override
  String get common_select => 'انتخاب';

  @override
  String get common_cancel => 'انصراف';

  @override
  String get common_yes => 'بله';

  @override
  String get common_no => 'خیر';

  @override
  String get common_close => 'بستن';

  @override
  String get common_save => 'ذخیره';

  @override
  String get common_edit => 'ویرایش';

  @override
  String get common_delete => 'حذف';

  @override
  String get common_search => 'جستجو';

  @override
  String get common_clear => 'پاک کردن';

  @override
  String get common_loading => 'در حال بارگذاری...';

  @override
  String get common_error => 'خطا';

  @override
  String get common_success => 'عملیات با موفقیت انجام شد';

  @override
  String get common_date_format => 'yyyy/MM/dd';

  @override
  String get common_form_submit => 'تأیید اطلاعات';

  @override
  String componentsMessagesInvoiceNumberPrefix(Object prefix) {
    return 'شماره فاکتور باید با $prefix شروع شود';
  }

  @override
  String get auth_login => 'ورود';

  @override
  String get auth_logout => 'خروج';

  @override
  String get auth_username => 'نام کاربری';

  @override
  String get auth_password => 'رمز عبور';

  @override
  String get auth_rememberMe => 'مرا به خاطر بسپار';

  @override
  String get auth_invalidCredentials => 'نام کاربری یا رمز عبور نادرست است';

  @override
  String get dashboard => 'داشبورد';

  @override
  String get dashboard_totalBalance => 'موجودی کل';

  @override
  String get dashboard_todayIncome => 'دریافتی امروز';

  @override
  String get dashboard_todayExpense => 'پرداختی امروز';

  @override
  String get dashboard_reports => 'گزارش‌ها';

  @override
  String get profile_account => 'حساب کاربری';

  @override
  String get accounting_accounts => 'حساب‌ها';

  @override
  String get accounting_account => 'حساب';

  @override
  String get accounting_newAccount => 'حساب جدید';

  @override
  String get accounting_accountName => 'نام حساب';

  @override
  String get accounting_accountCode => 'کد حساب';

  @override
  String get accounting_accountType => 'نوع حساب';

  @override
  String get accounting_balance => 'مانده';

  @override
  String get accounting_openingBalance => 'مانده افتتاحیه';

  @override
  String get voucher_vouchers => 'اسناد';

  @override
  String get voucher_voucher => 'سند';

  @override
  String get voucher_voucher_detail => 'اطلاعات سند';

  @override
  String get voucher_newVoucher => 'سند جدید';

  @override
  String get voucher_voucherNumber => 'شماره سند';

  @override
  String get voucher_voucherDate => 'تاریخ سند';

  @override
  String get voucher_description => 'شرح';

  @override
  String get voucher_debit => 'بدهکار';

  @override
  String get voucher_credit => 'بستانکار';

  @override
  String get voucher_totalDebit => 'جمع بدهکار';

  @override
  String get voucher_totalCredit => 'جمع بستانکار';

  @override
  String get voucher_notBalanced => 'سند تراز نیست';

  @override
  String get customer_customers => 'اشخاص';

  @override
  String get customer_customer => 'شخص';

  @override
  String get customer_newCustomer => 'شخص جدید';

  @override
  String get customer_name => 'نام';

  @override
  String get customer_mobile => 'شماره موبایل';

  @override
  String get customer_address => 'آدرس';

  @override
  String get customer_nationalId => 'کد ملی';

  @override
  String get customer_balance => 'مانده حساب';

  @override
  String get invoice_invoices => 'فاکتورها';

  @override
  String get invoice_invoice => 'فاکتور';

  @override
  String get invoice_sale_invoice => 'فاکتور فروش';

  @override
  String get invoice_buy_invoice => 'فاکتور خرید';

  @override
  String get invoice_newInvoice => 'فاکتور جدید';

  @override
  String get invoice_invoiceNumber => 'شماره فاکتور';

  @override
  String get invoice_invoiceDate => 'تاریخ فاکتور';

  @override
  String get invoice_customer => 'مشتری';

  @override
  String get invoice_saler => 'فروشنده';

  @override
  String get invoice_customer_info => 'اطلاعات مشتری';

  @override
  String get invoice_totalAmount => 'مبلغ کل';

  @override
  String get invoice_discount => 'تخفیف';

  @override
  String get invoice_discount_code => 'کد تخفیف';

  @override
  String get invoice_tax => 'مالیات';

  @override
  String get invoice_payableAmount => 'مبلغ قابل پرداخت';

  @override
  String get invoice_buy_invoices => 'لیست فاکتورهای خرید';

  @override
  String get invoice_sale_invoices => 'لیست فاکتورهای فروش';

  @override
  String get invoice_state_status => 'وضعیت صورتحساب';

  @override
  String get invoice_state_common_selectionMsg =>
      'لطفاً یک وضعیت را انتخاب کنید';

  @override
  String get invoice_state_completed => 'تسویه شده';

  @override
  String get invoice_state_pending => 'در انتظار ...';

  @override
  String get invoice_state_canceled => 'ناموفق';

  @override
  String get invoice_state_refunded => 'مرجوع شده';

  @override
  String get invoice_common_empty => 'هیچ فاکتوری ثبت نشده است';

  @override
  String get product_products => 'کالاها';

  @override
  String get product_product => 'کالا';

  @override
  String get product_newProduct => 'کالای جدید';

  @override
  String get product_name => 'نام کالا';

  @override
  String get product_code => 'کد کالا';

  @override
  String get product_unit => 'واحد';

  @override
  String get product_price => 'قیمت';

  @override
  String get product_stock => 'موجودی';

  @override
  String get payment_payments => 'پرداخت‌ها';

  @override
  String get payment_receive => 'دریافت';

  @override
  String get payment_pay => 'پرداخت';

  @override
  String get payment_amount => 'مبلغ';

  @override
  String get payment_date => 'تاریخ پرداخت';

  @override
  String get payment_method => 'روش پرداخت';

  @override
  String get payment_cash => 'نقدی';

  @override
  String get payment_card => 'کارت';

  @override
  String get payment_transfer => 'انتقال بانکی';

  @override
  String get report_reports => 'گزارش‌ها';

  @override
  String get report_profitLoss => 'سود و زیان';

  @override
  String get report_balanceSheet => 'ترازنامه';

  @override
  String get report_turnover => 'گردش حساب';

  @override
  String get report_fromDate => 'از تاریخ';

  @override
  String get report_toDate => 'تا تاریخ';

  @override
  String get settings_settings => 'تنظیمات';

  @override
  String get settings_language => 'زبان';

  @override
  String get settings_theme => 'پوسته';

  @override
  String get settings_darkMode => 'حالت تیره';

  @override
  String get settings_about => 'درباره برنامه';

  @override
  String get error_requiredField => 'این فیلد الزامی است';

  @override
  String get error_invalidNumber => 'عدد وارد شده معتبر نیست';

  @override
  String get error_network => 'خطا در ارتباط با سرور';

  @override
  String get error_unknown => 'خطای ناشناخته';

  @override
  String get invoice_number => 'لطفاً شماره فاکتور را وارد کنید';

  @override
  String get voucher_number => 'لطفاً شماره سند را وارد کنید';

  @override
  String get payment_number => 'لطفاً شماره پرداخت را وارد کنید';

  @override
  String get customer_number => 'لطفاً شماره مشتری را وارد کنید';

  @override
  String get user_number => 'لطفاً شماره کاربر را وارد کنید';

  @override
  String get submit_sale_invoice => 'ثبت فاکتور فروش';

  @override
  String get submit_buy_invoice => 'ثبت فاکتور خرید';

  @override
  String get submit_voucher => 'ثبت سند';

  @override
  String get submit_payment => 'ثبت پرداخت';

  @override
  String get submit_customer => 'ثبت مشتری';

  @override
  String get submit_product => 'ثبت کالا';

  @override
  String get submit_account => 'ثبت حساب';

  @override
  String get submit_user => 'ثبت کاربر';

  @override
  String get update_sale_invoice => 'ویرایش فاکتور فروش';

  @override
  String get update_buy_invoice => 'ویرایش فاکتور خرید';

  @override
  String get update_voucher => 'ویرایش سند';

  @override
  String get update_payment => 'ویرایش پرداخت';

  @override
  String get update_customer => 'ویرایش مشتری';

  @override
  String get update_product => 'ویرایش کالا';

  @override
  String get update_account => 'ویرایش حساب';

  @override
  String get update_user => 'ویرایش کاربر';

  @override
  String get delete_sale_invoice => 'حذف فاکتور فروش';

  @override
  String get delete_buy_invoice => 'حذف فاکتور خرید';

  @override
  String get delete_voucher => 'حذف سند';

  @override
  String get delete_payment => 'حذف پرداخت';

  @override
  String get delete_customer => 'حذف مشتری';

  @override
  String get delete_product => 'حذف کالا';

  @override
  String get delete_account => 'حذف حساب';

  @override
  String get delete_user => 'حذف کاربر';

  @override
  String get submit_success => 'ثبت با موفقیت انجام شد';

  @override
  String get submit_error => 'ثبت با خطا مواجه شد';

  @override
  String get update_success => 'ویرایش با موفقیت انجام شد';

  @override
  String get update_error => 'ویرایش با خطا مواجه شد';

  @override
  String get delete_success => 'حذف با موفقیت انجام شد';

  @override
  String get delete_error => 'حذف با خطا مواجه شد';

  @override
  String get validation_enterTotalAmount => 'لطفاً مبلغ کل را وارد کنید';

  @override
  String get validation_enterValidNumber => 'لطفاً یک عدد معتبر وارد کنید';

  @override
  String get validation_amountGreaterThanZero =>
      'مبلغ باید بزرگ‌تر از صفر باشد';
}
