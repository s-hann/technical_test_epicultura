import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 20),
                Column(
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
            Text('Jadwal Ruang Meeting Hari Ini'),
            ListView.builder(
              itemBuilder: (_, index) {},
            )
          ],
        ),
      ),
    );
  }
}
