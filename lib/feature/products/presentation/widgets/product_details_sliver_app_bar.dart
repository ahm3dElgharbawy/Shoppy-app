
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/extensions/screen_size.dart';
import 'package:shoppy/core/extensions/theme_mode.dart';

class ProductDetailsSliverAppBar extends StatefulWidget {
  const ProductDetailsSliverAppBar({
    super.key,
    required this.product,
    required this.heroId,
  });
  final Product product;
  final String heroId;

  @override
  State<ProductDetailsSliverAppBar> createState() =>
      _ProductDetailsSliverAppBarState();
}

class _ProductDetailsSliverAppBarState
    extends State<ProductDetailsSliverAppBar> {
  late final ValueNotifier<String> currentSelectedImage;
  @override
  void initState() {
    currentSelectedImage = ValueNotifier<String>(widget.product.images.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: context.screenHeight * 0.4,
      backgroundColor: context.isDark ? Color(0xff272727) : AppColors.grey300,
      flexibleSpace: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCollapsed = constraints.maxHeight <= kToolbarHeight + 20;
            final isImagesCollapsed =
                constraints.maxHeight < context.screenHeight * 0.4 - 30;
            return Stack(
              children: [
                ValueListenableBuilder(
                  valueListenable: currentSelectedImage,
                  builder: (_, String image, __) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isCollapsed ? 0 : 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: widget.product.images.length > 1
                              ? context.screenHeight * .3
                              : context.screenHeight * .4,
                          child: Hero(
                            tag: widget.heroId,
                            child: CachedNetworkImage(
                              imageUrl: image,
                              placeholder: (_, __) => CachedNetworkImage(
                                imageUrl: widget.product.thumbnail,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (widget.product.images.length > 1)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isImagesCollapsed ? 0 : 1,
                    child: _buildProductImages(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Align _buildProductImages() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ...widget.product.images.map(
              (image) => GestureDetector(
                onTap: () {
                  currentSelectedImage.value = image;
                },
                child: ValueListenableBuilder(
                  valueListenable: currentSelectedImage,
                  child: CachedNetworkImage(imageUrl: image), // avoid rebuild
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      height: 50,
                      width: 50,
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: value == image
                              ? AppColors.primaryLight
                              : Colors.grey.withValues(alpha: .8),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
