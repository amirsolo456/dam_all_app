import 'dart:async';
import 'package:flutter/material.dart';
typedef ProgressCallback = void Function(double progress);
typedef AsyncLoader = Future<void> Function([ProgressCallback? progressCb]);
//
// typedef ProgressCallback = void Function(double progress); // 0.0 - 1.0
// typedef AsyncLoader = Future<void> Function([ProgressCallback? progressCb]);

class PageLoadLoadingBuilderWidget extends StatefulWidget {
  /// تابعی که کار لود را انجام می‌دهد. می‌تواند progressCb را صدا بزند یا نه.
  final AsyncLoader load;

  /// ویجت نهایی را می‌سازد (child). این تابع هر بار build صدا زده می‌شود.
  final Widget Function(BuildContext context) childBuilder;

  /// مشابه Image.loadingBuilder: وقتی هنوز loading است صدا زده می‌شود.
  /// [child] همان ویجت نهایی است (برای overlay یا جایگذاری).
  /// [progress] مقدار بین 0.0 تا 1.0 یا null اگر معلوم نیست.
  final Widget Function(BuildContext context, Widget child, double? progress)
  loadingBuilder;

  /// وقتی خطا رخ دهد نمایش می‌دهد (اختیاری).
  final Widget Function(BuildContext context, Object error, VoidCallback retry)?
  errorBuilder;

  /// آیا در هر تغییر props باید دوباره load اجرا شود (پیش‌فرض true).
  final bool reloadOnUpdate;

  const PageLoadLoadingBuilderWidget({
    super.key,
    required this.load,
    required this.childBuilder,
    required this.loadingBuilder,
    this.errorBuilder,
    this.reloadOnUpdate = true,
  });

  @override
  State<PageLoadLoadingBuilderWidget> createState() =>
      _WidgetLoadingBuilderState();
}

class _WidgetLoadingBuilderState extends State<PageLoadLoadingBuilderWidget> {
  bool _isLoading = true;
  double? _progress;
  Object? _error;
  // ignore: unused_field
  late Future<void> _currentLoadFuture;
  int _loadToken = 0; // برای جلوگیری از race

  @override
  void initState() {
    super.initState();
    _startLoad();
  }

  @override
  void didUpdateWidget(covariant PageLoadLoadingBuilderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reloadOnUpdate && widget.load != oldWidget.load) {
      _startLoad();
    }
  }

  void _startLoad() {
    _error = null;
    _progress = null;
    setState(() => _isLoading = true);

    final int token = ++_loadToken;
    try {
      final Future<void> future = widget.load((double p) {
        if (token != _loadToken) return;
        // clamp to 0..1
        final double? clamped = p.isFinite ? p.clamp(0.0, 1.0) : null;
        if (mounted) {
          setState(() => _progress = clamped);
        }
      });

      _currentLoadFuture = future;

      future
          .then((_) {
            if (!mounted) return;
            if (token != _loadToken) return; // older run
            setState(() {
              _isLoading = false;
              _progress = 1.0;
            });
          })
          // ignore: always_specify_types
          .catchError((e, s) {
            if (!mounted) return;
            if (token != _loadToken) return;
            setState(() {
              _error = e;
              _isLoading = false;
            });
            // optional: print stack for debug
            debugPrint('WidgetLoadingBuilder.load error: $e\n$s');
          });
    } catch (e, s) {
      // synchronous throw
      debugPrint('WidgetLoadingBuilder.load sync error: $e\n$s');
      setState(() {
        _error = e;
        _isLoading = false;
      });
    }
  }

  void _retry() => _startLoad();

  @override
  Widget build(BuildContext context) {
    final Widget child = widget.childBuilder(context);

    if (_error != null) {
      if (widget.errorBuilder != null) {
        return widget.errorBuilder!(context, _error!, _retry);
      } else {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text('خطا در بارگذاری: $_error'),
              const SizedBox(height: 8),
              ElevatedButton(onPressed: _retry, child: const Text('تلاش مجدد')),
            ],
          ),
        );
      }
    }

    if (!_isLoading) {
      return child;
    }

    // هنوز loading: مثل Image.loadingBuilder؛ loadingBuilder می‌تواند child را overlay کند
    try {
      return widget.loadingBuilder(context, child, _progress);
    } catch (e, s) {
      // اگر loadingBuilder خودش خطا داد، fallback کنیم
      debugPrint('loadingBuilder threw: $e\n$s');
      return Center(
        child: _progress != null
            ? CircularProgressIndicator(value: _progress)
            : const CircularProgressIndicator(),
      );
    }
  }

  @override
  void dispose() {
    _loadToken++; // invalidate any pending callbacks
    super.dispose();
  }
}
