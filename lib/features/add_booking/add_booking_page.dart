import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/features/add_booking/bloc/add_booking_bloc.dart';
import 'package:toastification/toastification.dart';

class AddBookingPage extends StatelessWidget {
  const AddBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // provide bloc provider for the functionality
      create: (_) => AddBookingBloc(),
      child: const _AddBookingView(),
    );
  }
}

class _AddBookingView extends StatefulWidget {
  const _AddBookingView();

  @override
  State<_AddBookingView> createState() => _AddBookingViewState();
}

class _AddBookingViewState extends State<_AddBookingView> {
  final _meetingDateController = TextEditingController();
  final _startMeetingController = TextEditingController();
  final _endMeetingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Ruang Meeting'),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          child: Column(
            children: [
              DropdownSearch<String>(
                items: (_, __) => [
                  'Marketing',
                  'Sales',
                  'Development',
                  'Finance',
                ],
                popupProps: const PopupProps.menu(
                  fit: FlexFit.loose,
                  menuProps: MenuProps(
                    elevation: 4,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(4),
                      bottom: Radius.circular(12),
                    ),
                  ),
                ),
                suffixProps: const DropdownSuffixProps(
                  dropdownButtonProps: DropdownButtonProps(
                    visualDensity: VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                ),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    hintText: 'Divisi',
                    isDense: true,
                    fillColor: const Color(0xFFFAF5F5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFFFAE1E1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DropdownSearch<String>(
                items: (_, __) => [
                  'Squats Room',
                  'Lunges Room',
                ],
                popupProps: const PopupProps.menu(
                  fit: FlexFit.loose,
                  menuProps: MenuProps(
                    elevation: 4,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(4),
                      bottom: Radius.circular(12),
                    ),
                  ),
                ),
                suffixProps: const DropdownSuffixProps(
                  dropdownButtonProps: DropdownButtonProps(
                    visualDensity: VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                ),
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    hintText: 'Ruang Meeting',
                    isDense: true,
                    fillColor: const Color(0xFFFAF5F5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFFFAE1E1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (date != null) {
                    setState(() {
                      _meetingDateController.text = DateFormat(
                        'dd MMMM yyyy',
                      ).format(date);
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _meetingDateController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      hintText: 'Tanggal Meeting',
                      isDense: true,
                      fillColor: const Color(0xFFFAF5F5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFFFAE1E1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(
                      hour: 0,
                      minute: 0,
                    ),
                  );
                  if (time != null) {
                    setState(() {
                      _startMeetingController.text = time.format(context);
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _startMeetingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      hintText: 'Waktu Mulai Meeting',
                      isDense: true,
                      fillColor: const Color(0xFFFAF5F5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFFFAE1E1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.access_time_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(
                      hour: 0,
                      minute: 0,
                    ),
                  );
                  if (time != null) {
                    setState(() {
                      _endMeetingController.text = time.format(context);
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _endMeetingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      hintText: 'Waktu Selesai Meeting',
                      isDense: true,
                      fillColor: const Color(0xFFFAF5F5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFFFAE1E1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.access_time_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  hintText: 'Jumlah Peserta',
                  // isDense: true,
                  fillColor: const Color(0xFFFAF5F5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFFAE1E1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          toastification.show(
            context: context,
            autoCloseDuration: const Duration(seconds: 5),
            type: ToastificationType.success,
            style: ToastificationStyle.flatColored,
            title: const Text('Sukses'),
            showProgressBar: false,
          );
          Navigator.of(context).pop();
        },
        child: const Text('Submit'),
      ),
    );
  }
}
