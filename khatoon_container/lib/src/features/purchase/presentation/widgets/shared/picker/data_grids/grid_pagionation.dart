import 'package:flutter/material.dart';
import 'package:khatoon_container/src/app/theme/app_color.dart';
import 'package:khatoon_container/src/app/theme/app_theme.dart';
import 'package:khatoon_container/src/core/components/menu/domain/entities/menu_item.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/index.dart';

class GridPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int rowsPerPage;
  final ValueChanged<int> onPageChange;
  final ValueChanged<int> onRowsChange;

  const GridPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.rowsPerPage,
    required this.onPageChange,
    required this.onRowsChange,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        spacing: 8,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.chevron_left, color: colors.text),
            onPressed: currentPage > 1
                ? () => onPageChange(currentPage - 1)
                : null,
          ),

          Text('1 of $totalPages Pages', style: TextStyle(color: colors.text)),

          const Spacer(),

          Text('Rows per page', style: TextStyle(color: colors.text)),

          DropdownButton<int>(
            value: rowsPerPage,
            focusColor: colors.splashTransparent,
            borderRadius: const .all(Radius.circular(8)),
            dropdownColor: colors.secondary,
            padding: const .all(4),
            icon: ImageIcon(
              AssetImage(IconMapper.getImageIcon(MicroAppsName.menu.name)),
              size: 20,
            ),
            // barrierDismissible: false,
            // autofocus: true,
            // isDense: true,
            style: .new(
              locale: AppTheme().localMode,
              decorationThickness: 0,
              color: colors.main,
              backgroundColor: colors.main,
            ),

            items: const <int>[10, 25, 50]
                .map(
                  (int e) => DropdownMenuItem<int>(
                    value: e,
                    child: Text(
                      e.toString(),
                      style: TextStyle(color: colors.text),
                    ),
                  ),
                )
                .toList(),
            onChanged: (int? v) => v != null ? onRowsChange(v) : null,
          ),
        ],
      ),
    );
  }
}
