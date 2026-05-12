import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

enum CatalogView { grid, list }

class CatalogSearchRow extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final CatalogView view;
  final VoidCallback onToggleView;

  const CatalogSearchRow({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.view,
    required this.onToggleView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              onChanged: onChanged,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search gift cards',
                hintStyle:
                    TextStyle(color: Colors.grey.shade500, fontSize: 14),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.textMuted,
                  size: 22,
                ),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: onClear,
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: AppColors.textMuted,
                        ),
                      ),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.4,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _ViewToggleButton(view: view, onToggle: onToggleView),
        ],
      ),
    );
  }
}

class _ViewToggleButton extends StatelessWidget {
  final CatalogView view;
  final VoidCallback onToggle;

  const _ViewToggleButton({required this.view, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final isGrid = view == CatalogView.grid;
    return Tooltip(
      message: isGrid ? 'Switch to list view' : 'Switch to grid view',
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              transitionBuilder: (child, anim) => ScaleTransition(
                scale: anim,
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: Icon(
                isGrid ? Icons.view_list_rounded : Icons.grid_view_rounded,
                key: ValueKey(isGrid),
                color: AppColors.primary,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
