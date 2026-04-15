import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/stadium_container.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/features/search/presentation/view_model/search_cubit/search_cubit.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key, required this.onChanged, required this.onClear});
  final Function(String) onChanged;
  final VoidCallback onClear;
  @override
  Widget build(BuildContext context) {
    List<String> recent = context.read<SearchCubit>().recent.toList();
    return Visibility(
      visible: recent.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: AppTextStyles.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: onClear,
                  child: Text(
                    "Clear all",
                    style: AppTextStyles.bodyText2.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: AppSizes.xs,
              children: [
                ...recent.map(
                  (e) => GestureDetector(
                    onTap: () {
                      onChanged(e);
                    },
                    child: StadiumContainer(
                      backgroundColor: Theme.of(context).cardColor,
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      child: Text(e),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
