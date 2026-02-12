import 'package:ant_design_flutter/ant_design_flutter.dart';

class PagePaginator extends StatelessWidget {
  const PagePaginator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Center(
        child: Pagination(
          total: 40,
          responsive: true,
          size: Size.large,
        ),
      ),
    );
  }
}
