// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get appTitle => 'Accounting App';

  @override
  String get common_ok => 'OK';

  @override
  String get common_select => 'Select';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_yes => 'Yes';

  @override
  String get common_no => 'No';

  @override
  String get common_close => 'Close';

  @override
  String get common_save => 'Save';

  @override
  String get common_edit => 'Edit';

  @override
  String get common_delete => 'Delete';

  @override
  String get common_search => 'Search';

  @override
  String get common_clear => 'Clear';

  @override
  String get common_loading => 'Loading...';

  @override
  String get common_error => 'Error';

  @override
  String get common_success => 'Operation completed successfully';

  @override
  String get common_date_format => 'dd/MM/yyyy';

  @override
  String get common_form_submit => 'Form Submitted';

  @override
  String componentsMessagesInvoiceNumberPrefix(Object prefix) {
    return 'Invoice number should start with $prefix';
  }

  @override
  String get auth_login => 'Login';

  @override
  String get auth_logout => 'Logout';

  @override
  String get auth_username => 'Username';

  @override
  String get auth_password => 'Password';

  @override
  String get auth_rememberMe => 'Remember me';

  @override
  String get auth_invalidCredentials => 'Invalid username or password';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get dashboard_totalBalance => 'Total Balance';

  @override
  String get dashboard_todayIncome => 'Today\'s Income';

  @override
  String get dashboard_todayExpense => 'Today\'s Expense';

  @override
  String get dashboard_reports => 'Reports';

  @override
  String get profile_account => 'Profile Account';

  @override
  String get accounting_accounts => 'Accounts';

  @override
  String get accounting_account => 'Account';

  @override
  String get accounting_newAccount => 'New Account';

  @override
  String get accounting_accountName => 'Account Name';

  @override
  String get accounting_accountCode => 'Account Code';

  @override
  String get accounting_accountType => 'Account Type';

  @override
  String get accounting_balance => 'Balance';

  @override
  String get accounting_openingBalance => 'Opening Balance';

  @override
  String get voucher_vouchers => 'Vouchers';

  @override
  String get voucher_voucher => 'Voucher';

  @override
  String get voucher_voucher_detail => 'Voucher Detail';

  @override
  String get voucher_newVoucher => 'New Voucher';

  @override
  String get voucher_voucherNumber => 'Voucher Number';

  @override
  String get voucher_voucherDate => 'Voucher Date';

  @override
  String get voucher_description => 'Description';

  @override
  String get voucher_debit => 'Debit';

  @override
  String get voucher_credit => 'Credit';

  @override
  String get voucher_totalDebit => 'Total Debit';

  @override
  String get voucher_totalCredit => 'Total Credit';

  @override
  String get voucher_notBalanced => 'Voucher is not balanced';

  @override
  String get customer_customers => 'Customers';

  @override
  String get customer_customer => 'Customer';

  @override
  String get customer_newCustomer => 'New Customer';

  @override
  String get customer_name => 'Name';

  @override
  String get customer_mobile => 'Mobile';

  @override
  String get customer_address => 'Address';

  @override
  String get customer_nationalId => 'National ID';

  @override
  String get customer_balance => 'Account Balance';

  @override
  String get invoice_invoices => 'Invoices';

  @override
  String get invoice_invoice => 'Invoice';

  @override
  String get invoice_sale_invoice => 'Sale Invoice';

  @override
  String get invoice_buy_invoice => 'Buy Invoice';

  @override
  String get invoice_newInvoice => 'New Invoice';

  @override
  String get invoice_invoiceNumber => 'Invoice Number';

  @override
  String get invoice_invoiceDate => 'Invoice Date';

  @override
  String get invoice_customer => 'Customer';

  @override
  String get invoice_saler => 'Saler';

  @override
  String get invoice_customer_info => 'Customer Info';

  @override
  String get invoice_totalAmount => 'Total Amount';

  @override
  String get invoice_discount => 'Discount';

  @override
  String get invoice_discount_code => 'Discount Code';

  @override
  String get invoice_tax => 'Tax';

  @override
  String get invoice_payableAmount => 'Payable Amount';

  @override
  String get invoice_buy_invoices => 'Buy Invoices';

  @override
  String get invoice_sale_invoices => 'Sale Invoices';

  @override
  String get invoice_state_status => 'Invoice Status';

  @override
  String get invoice_state_common_selectionMsg => 'Please select a status';

  @override
  String get invoice_state_completed => 'Completed';

  @override
  String get invoice_state_pending => 'Pending ...';

  @override
  String get invoice_state_canceled => 'Canceled';

  @override
  String get invoice_state_refunded => 'Refunded';

  @override
  String get invoice_common_empty => 'No invoices found';

  @override
  String get product_products => 'Products';

  @override
  String get product_product => 'Product';

  @override
  String get product_newProduct => 'New Product';

  @override
  String get product_name => 'Product Name';

  @override
  String get product_code => 'Product Code';

  @override
  String get product_unit => 'Unit';

  @override
  String get product_price => 'Price';

  @override
  String get product_stock => 'Stock';

  @override
  String get payment_payments => 'Payments';

  @override
  String get payment_receive => 'Receive';

  @override
  String get payment_pay => 'Pay';

  @override
  String get payment_amount => 'Amount';

  @override
  String get payment_date => 'Payment Date';

  @override
  String get payment_method => 'Payment Method';

  @override
  String get payment_cash => 'Cash';

  @override
  String get payment_card => 'Card';

  @override
  String get payment_transfer => 'Bank Transfer';

  @override
  String get report_reports => 'Reports';

  @override
  String get report_profitLoss => 'Profit & Loss';

  @override
  String get report_balanceSheet => 'Balance Sheet';

  @override
  String get report_turnover => 'Account Turnover';

  @override
  String get report_fromDate => 'From Date';

  @override
  String get report_toDate => 'To Date';

  @override
  String get settings_settings => 'Settings';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_darkMode => 'Dark Mode';

  @override
  String get settings_about => 'About';

  @override
  String get error_requiredField => 'This field is required';

  @override
  String get error_invalidNumber => 'Invalid number';

  @override
  String get error_network => 'Network error';

  @override
  String get error_unknown => 'Unknown error';

  @override
  String get invoice_number => 'Please enter the invoice number';

  @override
  String get voucher_number => 'Please enter the voucher number';

  @override
  String get payment_number => 'Please enter the payment number';

  @override
  String get customer_number => 'Please enter the customer number';

  @override
  String get user_number => 'Please enter the user number';

  @override
  String get submit_sale_invoice => 'Submit Sale Invoice';

  @override
  String get submit_buy_invoice => 'Submit Buy Invoice';

  @override
  String get submit_voucher => 'Submit Voucher';

  @override
  String get submit_payment => 'Submit Payment';

  @override
  String get submit_customer => 'Submit Customer';

  @override
  String get submit_product => 'Submit Product';

  @override
  String get submit_account => 'Submit Account';

  @override
  String get submit_user => 'Submit User';

  @override
  String get update_sale_invoice => 'Update Sale Invoice';

  @override
  String get update_buy_invoice => 'Update Buy Invoice';

  @override
  String get update_voucher => 'Update Voucher';

  @override
  String get update_payment => 'Update Payment';

  @override
  String get update_customer => 'Update Customer';

  @override
  String get update_product => 'Update Product';

  @override
  String get update_account => 'Update Account';

  @override
  String get update_user => 'Update User';

  @override
  String get delete_sale_invoice => 'Delete Sale Invoice';

  @override
  String get delete_buy_invoice => 'Delete Buy Invoice';

  @override
  String get delete_voucher => 'Delete Voucher';

  @override
  String get delete_payment => 'Delete Payment';

  @override
  String get delete_customer => 'Delete Customer';

  @override
  String get delete_product => 'Delete Product';

  @override
  String get delete_account => 'Delete Account';

  @override
  String get delete_user => 'Delete User';

  @override
  String get submit_success => 'Submission completed successfully';

  @override
  String get submit_error => 'Submission failed';

  @override
  String get update_success => 'Update completed successfully';

  @override
  String get update_error => 'Update failed';

  @override
  String get delete_success => 'Deletion completed successfully';

  @override
  String get delete_error => 'Deletion failed';

  @override
  String get validation_enterTotalAmount => 'Please enter total amount';

  @override
  String get validation_enterValidNumber => 'Please enter a valid number';

  @override
  String get validation_amountGreaterThanZero =>
      'Amount must be greater than 0';
}
