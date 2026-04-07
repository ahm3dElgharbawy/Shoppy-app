import 'package:intl/intl.dart';

extension TimeAgo on DateTime {
  String get inAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s Ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m Ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h Ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d Ago';
    } else if (difference.inDays <= 28) {
      return '${difference.inDays / 7}w Ago';
    }
    return DateFormat('MMM dd, yyyy').format(this);
  }
}
