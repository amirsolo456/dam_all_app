import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Demo app'**
  String get appName;

  /// No description provided for @pageLoginUsername.
  ///
  /// In en, this message translates to:
  /// **'Your username'**
  String get pageLoginUsername;

  /// No description provided for @pageLoginPassword.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get pageLoginPassword;

  /// Welcome message on the Home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome {firstName}'**
  String pageHomeTitle(Object firstName);

  /// New messages count on the Home screen
  ///
  /// In en, this message translates to:
  /// **'{count, plural, zero{You have no new messages} one{You have 1 new message} other{You have {count} new messages}}'**
  String pageHomeInboxCount(num count);

  /// Birthday message on the Home screen
  ///
  /// In en, this message translates to:
  /// **'{sex, select, male{His birthday} female{Her birthday} other{Their birthday}}'**
  String pageHomeBirthday(String sex);

  /// Vehicle type
  ///
  /// In en, this message translates to:
  /// **'{vehicleType, select, sedan{Sedan} cabriolet{Solid roof cabriolet} truck{16 wheel truck} other{Other}}'**
  String commonVehicleType(String vehicleType);

  /// No description provided for @pageHomeBalance.
  ///
  /// In en, this message translates to:
  /// **'Your balance is {amount} on {date}'**
  String pageHomeBalance(double amount, DateTime date);

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Accounting App'**
  String get appTitle;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get common_select;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get common_no;

  /// No description provided for @common_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get common_close;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get common_edit;

  /// No description provided for @common_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_delete;

  /// No description provided for @common_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get common_search;

  /// No description provided for @common_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get common_clear;

  /// No description provided for @common_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get common_loading;

  /// No description provided for @common_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get common_error;

  /// No description provided for @common_success.
  ///
  /// In en, this message translates to:
  /// **'Operation completed successfully'**
  String get common_success;

  /// No description provided for @common_date_format.
  ///
  /// In en, this message translates to:
  /// **'dd/MM/yyyy'**
  String get common_date_format;

  /// No description provided for @common_form_submit.
  ///
  /// In en, this message translates to:
  /// **'Form Submitted'**
  String get common_form_submit;

  /// The required prefix for invoice numbers
  ///
  /// In en, this message translates to:
  /// **'Invoice number should start with {prefix}'**
  String componentsMessagesInvoiceNumberPrefix(Object prefix);

  /// No description provided for @auth_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login;

  /// No description provided for @auth_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get auth_logout;

  /// No description provided for @auth_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get auth_username;

  /// No description provided for @auth_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password;

  /// No description provided for @auth_rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get auth_rememberMe;

  /// No description provided for @auth_invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password'**
  String get auth_invalidCredentials;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @dashboard_totalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get dashboard_totalBalance;

  /// No description provided for @dashboard_todayIncome.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Income'**
  String get dashboard_todayIncome;

  /// No description provided for @dashboard_todayExpense.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Expense'**
  String get dashboard_todayExpense;

  /// No description provided for @dashboard_reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get dashboard_reports;

  /// No description provided for @profile_account.
  ///
  /// In en, this message translates to:
  /// **'Profile Account'**
  String get profile_account;

  /// No description provided for @accounting_accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accounting_accounts;

  /// No description provided for @accounting_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accounting_account;

  /// No description provided for @accounting_newAccount.
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get accounting_newAccount;

  /// No description provided for @accounting_accountName.
  ///
  /// In en, this message translates to:
  /// **'Account Name'**
  String get accounting_accountName;

  /// No description provided for @accounting_accountCode.
  ///
  /// In en, this message translates to:
  /// **'Account Code'**
  String get accounting_accountCode;

  /// No description provided for @accounting_accountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get accounting_accountType;

  /// No description provided for @accounting_balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get accounting_balance;

  /// No description provided for @accounting_openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening Balance'**
  String get accounting_openingBalance;

  /// No description provided for @voucher_vouchers.
  ///
  /// In en, this message translates to:
  /// **'Vouchers'**
  String get voucher_vouchers;

  /// No description provided for @voucher_voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get voucher_voucher;

  /// No description provided for @voucher_voucher_detail.
  ///
  /// In en, this message translates to:
  /// **'Voucher Detail'**
  String get voucher_voucher_detail;

  /// No description provided for @voucher_newVoucher.
  ///
  /// In en, this message translates to:
  /// **'New Voucher'**
  String get voucher_newVoucher;

  /// No description provided for @voucher_voucherNumber.
  ///
  /// In en, this message translates to:
  /// **'Voucher Number'**
  String get voucher_voucherNumber;

  /// No description provided for @voucher_voucherDate.
  ///
  /// In en, this message translates to:
  /// **'Voucher Date'**
  String get voucher_voucherDate;

  /// No description provided for @voucher_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get voucher_description;

  /// No description provided for @voucher_debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get voucher_debit;

  /// No description provided for @voucher_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get voucher_credit;

  /// No description provided for @voucher_totalDebit.
  ///
  /// In en, this message translates to:
  /// **'Total Debit'**
  String get voucher_totalDebit;

  /// No description provided for @voucher_totalCredit.
  ///
  /// In en, this message translates to:
  /// **'Total Credit'**
  String get voucher_totalCredit;

  /// No description provided for @voucher_notBalanced.
  ///
  /// In en, this message translates to:
  /// **'Voucher is not balanced'**
  String get voucher_notBalanced;

  /// No description provided for @customer_customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customer_customers;

  /// No description provided for @customer_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer_customer;

  /// No description provided for @customer_newCustomer.
  ///
  /// In en, this message translates to:
  /// **'New Customer'**
  String get customer_newCustomer;

  /// No description provided for @customer_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get customer_name;

  /// No description provided for @customer_mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get customer_mobile;

  /// No description provided for @customer_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customer_address;

  /// No description provided for @customer_nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get customer_nationalId;

  /// No description provided for @customer_balance.
  ///
  /// In en, this message translates to:
  /// **'Account Balance'**
  String get customer_balance;

  /// No description provided for @invoice_invoices.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoice_invoices;

  /// No description provided for @invoice_invoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoice_invoice;

  /// No description provided for @invoice_sale_invoice.
  ///
  /// In en, this message translates to:
  /// **'Sale Invoice'**
  String get invoice_sale_invoice;

  /// No description provided for @invoice_buy_invoice.
  ///
  /// In en, this message translates to:
  /// **'Buy Invoice'**
  String get invoice_buy_invoice;

  /// No description provided for @invoice_newInvoice.
  ///
  /// In en, this message translates to:
  /// **'New Invoice'**
  String get invoice_newInvoice;

  /// No description provided for @invoice_invoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice Number'**
  String get invoice_invoiceNumber;

  /// No description provided for @invoice_invoiceDate.
  ///
  /// In en, this message translates to:
  /// **'Invoice Date'**
  String get invoice_invoiceDate;

  /// No description provided for @invoice_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get invoice_customer;

  /// No description provided for @invoice_saler.
  ///
  /// In en, this message translates to:
  /// **'Saler'**
  String get invoice_saler;

  /// No description provided for @invoice_customer_info.
  ///
  /// In en, this message translates to:
  /// **'Customer Info'**
  String get invoice_customer_info;

  /// No description provided for @invoice_totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get invoice_totalAmount;

  /// No description provided for @invoice_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get invoice_discount;

  /// No description provided for @invoice_discount_code.
  ///
  /// In en, this message translates to:
  /// **'Discount Code'**
  String get invoice_discount_code;

  /// No description provided for @invoice_tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get invoice_tax;

  /// No description provided for @invoice_payableAmount.
  ///
  /// In en, this message translates to:
  /// **'Payable Amount'**
  String get invoice_payableAmount;

  /// No description provided for @invoice_buy_invoices.
  ///
  /// In en, this message translates to:
  /// **'Buy Invoices'**
  String get invoice_buy_invoices;

  /// No description provided for @invoice_sale_invoices.
  ///
  /// In en, this message translates to:
  /// **'Sale Invoices'**
  String get invoice_sale_invoices;

  /// No description provided for @invoice_state_status.
  ///
  /// In en, this message translates to:
  /// **'Invoice Status'**
  String get invoice_state_status;

  /// No description provided for @invoice_state_common_selectionMsg.
  ///
  /// In en, this message translates to:
  /// **'Please select a status'**
  String get invoice_state_common_selectionMsg;

  /// No description provided for @invoice_state_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get invoice_state_completed;

  /// No description provided for @invoice_state_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending ...'**
  String get invoice_state_pending;

  /// No description provided for @invoice_state_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get invoice_state_canceled;

  /// No description provided for @invoice_state_refunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get invoice_state_refunded;

  /// No description provided for @invoice_common_empty.
  ///
  /// In en, this message translates to:
  /// **'No invoices found'**
  String get invoice_common_empty;

  /// No description provided for @product_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get product_products;

  /// No description provided for @product_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product_product;

  /// No description provided for @product_newProduct.
  ///
  /// In en, this message translates to:
  /// **'New Product'**
  String get product_newProduct;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get product_name;

  /// No description provided for @product_code.
  ///
  /// In en, this message translates to:
  /// **'Product Code'**
  String get product_code;

  /// No description provided for @product_unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get product_unit;

  /// No description provided for @product_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get product_price;

  /// No description provided for @product_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get product_stock;

  /// No description provided for @payment_payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payment_payments;

  /// No description provided for @payment_receive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get payment_receive;

  /// No description provided for @payment_pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get payment_pay;

  /// No description provided for @payment_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get payment_amount;

  /// No description provided for @payment_date.
  ///
  /// In en, this message translates to:
  /// **'Payment Date'**
  String get payment_date;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @payment_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get payment_cash;

  /// No description provided for @payment_card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get payment_card;

  /// No description provided for @payment_transfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get payment_transfer;

  /// No description provided for @report_reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get report_reports;

  /// No description provided for @report_profitLoss.
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss'**
  String get report_profitLoss;

  /// No description provided for @report_balanceSheet.
  ///
  /// In en, this message translates to:
  /// **'Balance Sheet'**
  String get report_balanceSheet;

  /// No description provided for @report_turnover.
  ///
  /// In en, this message translates to:
  /// **'Account Turnover'**
  String get report_turnover;

  /// No description provided for @report_fromDate.
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get report_fromDate;

  /// No description provided for @report_toDate.
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get report_toDate;

  /// No description provided for @settings_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_settings;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme;

  /// No description provided for @settings_darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settings_darkMode;

  /// No description provided for @settings_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settings_about;

  /// No description provided for @error_requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get error_requiredField;

  /// No description provided for @error_invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get error_invalidNumber;

  /// No description provided for @error_network.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get error_network;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get error_unknown;

  /// No description provided for @invoice_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter the invoice number'**
  String get invoice_number;

  /// No description provided for @voucher_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter the voucher number'**
  String get voucher_number;

  /// No description provided for @payment_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter the payment number'**
  String get payment_number;

  /// No description provided for @customer_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter the customer number'**
  String get customer_number;

  /// No description provided for @user_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter the user number'**
  String get user_number;

  /// No description provided for @submit_sale_invoice.
  ///
  /// In en, this message translates to:
  /// **'Submit Sale Invoice'**
  String get submit_sale_invoice;

  /// No description provided for @submit_buy_invoice.
  ///
  /// In en, this message translates to:
  /// **'Submit Buy Invoice'**
  String get submit_buy_invoice;

  /// No description provided for @submit_voucher.
  ///
  /// In en, this message translates to:
  /// **'Submit Voucher'**
  String get submit_voucher;

  /// No description provided for @submit_payment.
  ///
  /// In en, this message translates to:
  /// **'Submit Payment'**
  String get submit_payment;

  /// No description provided for @submit_customer.
  ///
  /// In en, this message translates to:
  /// **'Submit Customer'**
  String get submit_customer;

  /// No description provided for @submit_product.
  ///
  /// In en, this message translates to:
  /// **'Submit Product'**
  String get submit_product;

  /// No description provided for @submit_account.
  ///
  /// In en, this message translates to:
  /// **'Submit Account'**
  String get submit_account;

  /// No description provided for @submit_user.
  ///
  /// In en, this message translates to:
  /// **'Submit User'**
  String get submit_user;

  /// No description provided for @update_sale_invoice.
  ///
  /// In en, this message translates to:
  /// **'Update Sale Invoice'**
  String get update_sale_invoice;

  /// No description provided for @update_buy_invoice.
  ///
  /// In en, this message translates to:
  /// **'Update Buy Invoice'**
  String get update_buy_invoice;

  /// No description provided for @update_voucher.
  ///
  /// In en, this message translates to:
  /// **'Update Voucher'**
  String get update_voucher;

  /// No description provided for @update_payment.
  ///
  /// In en, this message translates to:
  /// **'Update Payment'**
  String get update_payment;

  /// No description provided for @update_customer.
  ///
  /// In en, this message translates to:
  /// **'Update Customer'**
  String get update_customer;

  /// No description provided for @update_product.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get update_product;

  /// No description provided for @update_account.
  ///
  /// In en, this message translates to:
  /// **'Update Account'**
  String get update_account;

  /// No description provided for @update_user.
  ///
  /// In en, this message translates to:
  /// **'Update User'**
  String get update_user;

  /// No description provided for @delete_sale_invoice.
  ///
  /// In en, this message translates to:
  /// **'Delete Sale Invoice'**
  String get delete_sale_invoice;

  /// No description provided for @delete_buy_invoice.
  ///
  /// In en, this message translates to:
  /// **'Delete Buy Invoice'**
  String get delete_buy_invoice;

  /// No description provided for @delete_voucher.
  ///
  /// In en, this message translates to:
  /// **'Delete Voucher'**
  String get delete_voucher;

  /// No description provided for @delete_payment.
  ///
  /// In en, this message translates to:
  /// **'Delete Payment'**
  String get delete_payment;

  /// No description provided for @delete_customer.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get delete_customer;

  /// No description provided for @delete_product.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get delete_product;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @delete_user.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get delete_user;

  /// No description provided for @submit_success.
  ///
  /// In en, this message translates to:
  /// **'Submission completed successfully'**
  String get submit_success;

  /// No description provided for @submit_error.
  ///
  /// In en, this message translates to:
  /// **'Submission failed'**
  String get submit_error;

  /// No description provided for @update_success.
  ///
  /// In en, this message translates to:
  /// **'Update completed successfully'**
  String get update_success;

  /// No description provided for @update_error.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get update_error;

  /// No description provided for @delete_success.
  ///
  /// In en, this message translates to:
  /// **'Deletion completed successfully'**
  String get delete_success;

  /// No description provided for @delete_error.
  ///
  /// In en, this message translates to:
  /// **'Deletion failed'**
  String get delete_error;

  /// Error message when the total amount field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter total amount'**
  String get validation_enterTotalAmount;

  /// Error message when the entered value is not a valid number
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get validation_enterValidNumber;

  /// Error message when the entered amount is less than or equal to zero
  ///
  /// In en, this message translates to:
  /// **'Amount must be greater than 0'**
  String get validation_amountGreaterThanZero;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
