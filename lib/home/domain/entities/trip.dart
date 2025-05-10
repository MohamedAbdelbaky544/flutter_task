import 'package:flutter_task/home/domain/entities/tourist.dart';

class Trip {
  final String id;
  final String itemTitle;
  final DateTime startDate;
  final DateTime endDate;
  final int unfinishedTasks;
  final int nights;
  final String? image;

  final List<Tourist>? tourists;

  Trip({
    required this.id,
    required this.itemTitle,
    required this.startDate,
    required this.endDate,
    required this.unfinishedTasks,
    required this.nights,
    this.image,
    this.tourists,
  });
}
