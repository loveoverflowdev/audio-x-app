import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

class CommonCacheImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  final bool hasFullScreen;

  const CommonCacheImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.radius = 8,
    this.hasFullScreen = true,
    this.fit = BoxFit.cover,
  });

  @override
  State<CommonCacheImage> createState() => _CommonCacheImageState();
}

class _CommonCacheImageState extends State<CommonCacheImage> {
  late ImageProvider<Object>? _imageProvider;

  void _showFullModel(
    BuildContext context, {
    required ImageProvider<Object>? imageProvider,
  }) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          final minScale = PhotoViewComputedScale.contained * 1;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                iconTheme: const IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                toolbarHeight: 60,
              ),
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: PhotoView(
                minScale: minScale,
                imageProvider: _imageProvider,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeholderWidget = Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade600,
      child: Container(
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
    );
    final isValidUrl = Uri.parse(widget.imageUrl).isAbsolute;
    if (!isValidUrl) return placeholderWidget;

    return GestureDetector(
      onTap: widget.hasFullScreen
          ? () => _showFullModel(
                context,
                imageProvider: _imageProvider,
              )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: widget.fit,
          height: widget.height,
          width: widget.width,
          imageBuilder: (context, imageProvider) {
            _imageProvider = imageProvider;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            );
          },
          placeholder: (context, url) {
            return placeholderWidget;
          },
        ),
      ),
    );
  }
}
