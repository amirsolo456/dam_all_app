import 'package:flutter/material.dart';

class SafeNetworkImage extends StatefulWidget {
  final String url;
  final String fallbackAsset;
  final double? width;
  final double? height;
  final BoxFit fit;

  const SafeNetworkImage({
    super.key,
    required this.url,
    required this.fallbackAsset,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  State<SafeNetworkImage> createState() => _SafeNetworkImageState();
}

class _SafeNetworkImageState extends State<SafeNetworkImage> {
  ImageProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider = AssetImage(widget.fallbackAsset);
    _tryLoadNetwork();
  }

  Future<void> _tryLoadNetwork() async {
    final NetworkImage network = NetworkImage(widget.url);

    final ImageStream stream = network.resolve(const ImageConfiguration());
    late final ImageStreamListener listener;

    listener = ImageStreamListener(
      (ImageInfo image, _) {
        if (!mounted) return;
        setState(() => _provider = network);
        stream.removeListener(listener);
      },
      onError: (_, _) {
        stream.removeListener(listener);
      },
    );

    stream.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _provider!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
