import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/core/enum/status_enum.dart';
import 'package:technical_test/features/add_booking/add_booking_page.dart';
import 'package:technical_test/features/home/bloc/home_bloc.dart';
import 'package:technical_test/features/home/widget/schedule_list.dart';
import 'package:technical_test/features/schedule/schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Text(
                      'Y',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Yosi'),
                      SizedBox(height: 4),
                      Text('Web Developer'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text('Jadwal Ruang Meeting Hari Ini'),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (_, state) {
                    if (state.status == Status.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.status == Status.failure) {
                      return const Center(
                        child: Text('Gagal menarik jadwal ruang meeting.'),
                      );
                    }
                    return ScheduleList(
                      schedules: state.schedules,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 28,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  final schedules = context.read<HomeBloc>().state.schedules;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SchedulePage(
                        schedules: schedules,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/ic_clipboard.png',
                      width: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Jadwal Ruang Meeting',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddBookingPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/ic_edit.png',
                      width: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Booking Ruang Meeting',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
