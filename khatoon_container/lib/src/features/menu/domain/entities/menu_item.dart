// lib/features/menu/domain/entities/menu_item.dart

class MenuItem {
  final String id;
  final String? title;
  final String? backIcon;
  final String? route; // برای navigation داخلی
  final String? apiEndpoint; // برای API calls
  final String? httpMethod; // GET, POST, PUT, DELETE
  final Map<String, dynamic>? apiParams;
  final List<MenuItem>? children;
  final List<String> permissions;
  final bool isActive;

  MenuItem({
    required this.id,
      this.title,
    this.backIcon,
    this.route,
    this.apiEndpoint,
    this.httpMethod,
    this.apiParams,
    this.children,
    this.permissions = const <String>[],
    this.isActive = true,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      title: json['title'],
      backIcon: json['icon'],
      route: json['route'],
      apiEndpoint: json['apiEndpoint'],
      httpMethod: json['httpMethod'],
      apiParams: json['apiParams'] != null
          ? Map<String, dynamic>.from(json['apiParams'])
          : null,
      children: json['children'] != null
          ? (json['children']  as List<dynamic>)
                .map((dynamic item) => MenuItem.fromJson(item))
                .toList()
          : null,
      permissions: List<String>.from(json['permissions'] ?? <dynamic>[]),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'icon':  backIcon,
    'route': route,
    'apiEndpoint': apiEndpoint,
    'httpMethod': httpMethod,
    'apiParams': apiParams,
    'children': children?.map((MenuItem item) => item.toJson()).toList(),
    'permissions': permissions,
    'isActive': isActive,
  };
}
