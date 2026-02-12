// lib/src/repositories/product_repo.dart

import 'package:khatoon_server/src/db/database.dart';
import 'package:uuid/uuid.dart';

class ProductRepository {

    final Uuid _uuid = const Uuid();

  Future<Map<String, dynamic>> create(Map<String, dynamic> dto) async {
    final id = dto['id'] ?? _uuid.v4();
    final sku = dto['sku'] as String?;
    final name = dto['name'] as String? ?? 'untitled';
    final price = dto['price'] != null ? dto['price'].toString() : '0';
    final description = dto['description'] as String?;
    final db = DatabaseService();
    await db.execute(
      '''
      INSERT INTO product (id, sku, name, description, price, metadata)
      VALUES (@id::uuid, @sku, @name, @description, @price::numeric, @meta::jsonb)
      ON CONFLICT (id) DO UPDATE
      SET sku = EXCLUDED.sku, name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price, metadata = EXCLUDED.metadata, updated_at = now()
      ''',
      params:   <String, Object?>{
        'id': id,
        'sku': sku,
        'name': name,
        'description': description,
        'price': price,
        'meta': dto['meta'] ?? '{}',
      },
    );

    return <String, dynamic>{'id': id};
  }

  Future<List<Map<String, dynamic>>> listAll() async {
    final db = DatabaseService();
    final results = await db.execute('SELECT * FROM product ORDER BY created_at DESC');
    return results..map((Map<String, dynamic> row) => row['product']).toList();
  }

// more methods: getById, delete, update...
}
