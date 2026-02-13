import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/di/injection_container.dart';
import 'package:khatoon_shared/index.dart';
import 'package:dio/dio.dart';

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('افزودن محصول جدید')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'نام محصول'),
                validator: (String? v) => (v == null || v.isEmpty) ? 'اجباری' : null,
              ),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'واحد (مثلا کیلوگرم، عدد)'),
                validator: (String? v) => (v == null || v.isEmpty) ? 'اجباری' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'قیمت پیش‌فرض'),
                keyboardType: TextInputType.number,
                validator: (String? v) => (v == null || v.isEmpty) ? 'اجباری' : null,
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _saveProduct,
                child: const Text('ذخیره محصول'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProduct() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      final Map<String, dynamic> productData = <String, dynamic>{
        'name': _nameController.text,
        'unit': _unitController.text,
        'defaultPrice': double.tryParse(_priceController.text) ?? 0.0,
      };

      try {
        final Dio dio = sl<Dio>();
        await dio.post('/Products', data: productData);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('محصول با موفقیت اضافه شد')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطا در ذخیره محصول: $e')),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }
}
