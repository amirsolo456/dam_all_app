import 'package:flutter/widgets.dart';
import 'package:khatoon_container/src/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_shared/index.dart';


typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MicroAppsChangingStatesModel<T> {
  final BaseMasterDetailPagesOpenType pageType;
  final PageActionsTypes pageActionType;
  final T pagePrivateParameters;

  const MicroAppsChangingStatesModel({
    required this.pageType,
    required this.pageActionType,
    required this.pagePrivateParameters,
  });
}
