import 'package:flutter/material.dart';

/// Tail-end widget for paginated lists/grids.
///
/// Shows one of four states: spinner while loading the next page, error+retry
/// when a page failed, "end of list" when the server has nothing more, or a
/// silent spacer otherwise.
class AppPaginationFooter extends StatelessWidget {
  final bool loading;
  final String? error;
  final bool hasReachedEnd;
  final VoidCallback onRetry;
  final String endLabel;

  const AppPaginationFooter({
    super.key,
    required this.loading,
    required this.error,
    required this.hasReachedEnd,
    required this.onRetry,
    this.endLabel = "You've reached the end",
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(strokeWidth: 2.4),
          ),
        ),
      );
    }
    if (error != null) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              error!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
            const SizedBox(height: 8),
            FilledButton.tonal(
              onPressed: onRetry,
              child: const Text('Try again'),
            ),
          ],
        ),
      );
    }
    if (hasReachedEnd) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            endLabel,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
      );
    }
    return const SizedBox(height: 24);
  }
}
