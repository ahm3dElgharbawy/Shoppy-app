import 'package:flutter/material.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/feature/products/data/models/category.dart';

class CategoryTabsAppBar extends StatelessWidget {
  const CategoryTabsAppBar({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 50,
      scrolledUnderElevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: AppSizes.sm,
            start: AppSizes.sm,
            bottom: AppSizes.sm,
          ),
          child: TabBar(
            dividerHeight: 0,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: [
              Tab(text: "All", height: 35),
              ...categories.map((c) => Tab(text: c.name, height: 35)),
            ],
          ),
        ),
      ),
      toolbarHeight: 0,
    );
  }
}
