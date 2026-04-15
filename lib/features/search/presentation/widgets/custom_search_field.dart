import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final Function(String)? onSubmitted;
  final String hintText;
  final TextEditingController? controller;
  const CustomSearchField({
    super.key,
    this.onSubmitted,
    this.hintText = "Search products...",
    this.controller,
  });

  @override
  State<CustomSearchField> createState() => CustomSearchFieldState();
}

class CustomSearchFieldState extends State<CustomSearchField> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {
        _hasText = widget.controller?.text.isNotEmpty ?? false;
      });
    });
  }

  void _clear() {
    widget.controller?.clear();
    widget.onSubmitted?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: widget.controller,
        // onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: const TextStyle(fontSize: 16),
        textInputAction: TextInputAction.search,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _hasText
              ? IconButton(icon: const Icon(Icons.close), onPressed: _clear)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
