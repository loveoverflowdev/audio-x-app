import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final void Function(String value)? onTextChanged;

  const CustomSearchBar({
    Key? key,
    this.onTextChanged,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  void _onTextChanged(
    BuildContext context, {
    required final String value,
  }) {
    EasyDebounce.debounce(
      'customer_search',
      const Duration(milliseconds: 180),
      () {
        widget.onTextChanged?.call(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _textEditingController,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () {
                        _textEditingController.clear();
                        _onTextChanged(context, value: '');
                      },
                      icon: Icon(
                        Icons.clear,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Search...',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onChanged: (value) {
                  _onTextChanged(context, value: value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
