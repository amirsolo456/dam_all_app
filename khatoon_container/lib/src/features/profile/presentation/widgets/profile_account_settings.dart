import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/profile/presentation/bloc/base_bloc/profile_events.dart';

class ProfileAccountSettings extends StatelessWidget {
  final ProfileEvents? args;

  const ProfileAccountSettings({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(context.l10n.profile_account),
    );
  }
}
