import 'package:khatoon_container/src/features/app_shortcuts/presentation/bloc/base_bloc/short_cuts_events.dart';
import 'package:khatoon_container/src/features/app_shortcuts/presentation/bloc/base_bloc/short_cuts_resolver.dart';
import 'package:khatoon_container/src/features/not_found/presentation/bloc/base_bloc/not_found_events.dart';
import 'package:khatoon_container/src/features/not_found/presentation/bloc/base_bloc/not_found_resolver.dart';
import 'package:khatoon_container/src/features/products/presentation/bloc/base_bloc/products_events.dart';
import 'package:khatoon_container/src/features/products/presentation/bloc/base_bloc/products_resolver.dart';
import 'package:khatoon_container/src/features/profile/presentation/bloc/base_bloc/profile_events.dart';
import 'package:khatoon_container/src/features/profile/presentation/bloc/base_bloc/profile_resolver.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/base_bloc/purchase_resolver.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/base_bloc/purchase_events.dart';
import 'package:khatoon_container/src/features/reports/presentations/bloc/base_bloc/reports_events.dart';
import 'package:khatoon_container/src/features/reports/presentations/bloc/base_bloc/reports_resolver.dart';
import 'package:khatoon_container/src/features/settings/presentation/bloc/base_bloc/settings_events.dart';
import 'package:khatoon_container/src/features/settings/presentation/bloc/base_bloc/settings_resolver.dart';

import 'package:khatoon_container/src/features/sign_in/presentation/bloc/base_bloc/sign_in_events.dart';
import 'package:khatoon_container/src/features/sign_in/presentation/bloc/base_bloc/sign_in_resolver.dart';

import 'package:khatoon_container/src/core/event_base_core/utils/enum.dart';


///
/// * All NAMED ROUTES must be registred here
///
class Routes extends Enum<String> {
  Routes(super.value);

  static Routes signIn = Routes(SignInResolver().microAppName);
  static Routes profile = Routes(ProfileResolver().microAppName);
  static Routes purchases = Routes(PurchaseResolver().microAppName);
  static Routes settings = Routes(SettingsResolver().microAppName);
  static Routes notFound = Routes(NotFoundResolver().microAppName);
  static Routes reports = Routes(ReportsResolver().microAppName);
  static Routes shortCuts = Routes(ShortCutsResolver().microAppName);
  static Routes animalProducts = Routes(ProductsResolver().microAppName);

}

///
/// * All ROUTE EVENTS must be registred here
///
class RouteEvents {
  static SignInEvents get loginEvents => SignInResolver().microAppEvents();

  static PurchaseCustomEvents get purchaseEvents =>
      PurchaseResolver().microAppEvents();

  static ProfileEvents get profileEvents => ProfileResolver().microAppEvents();

  static SettingsEvents get settingsEvents =>
      SettingsResolver().microAppEvents();

  static NotFoundEvents get notFoundEvents =>
      NotFoundResolver().microAppEvents();

  static ReportsEvents get reportsEvents => ReportsResolver().microAppEvents();

  static ShortCutsEvents get shortCutsEvents =>
      ShortCutsResolver().microAppEvents();

  static ProductsEvents get productsEvents =>
      ProductsResolver().microAppEvents();
}
