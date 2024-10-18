import 'package:flutter/material.dart';
import 'package:technical_test/core/domain/entity/schedule_entity.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    required this.schedules,
    super.key,
  });

  final List<ScheduleEntity> schedules;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: schedules.length,
      itemBuilder: (_, index) {
        final schedule = schedules[index];
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                schedule.time,
              ),
              const SizedBox(width: 8),
              Text(
                schedule.roomName,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }
}
