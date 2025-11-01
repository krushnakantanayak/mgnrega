import 'package:flutter/material.dart';
import 'package:mgnrega/metric_card.dart';
import 'package:mgnrega/odisha_mgnrega_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MGNREGA Dashboard',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDistrict = 'Cuttack';

  @override
  Widget build(BuildContext context) {
    final data = districtData[selectedDistrict]!;

    return Scaffold(
      appBar: AppBar(title: const Text('MGNREGA Dashboard'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // District Selector
            DropdownButton<String>(
              value: selectedDistrict,
              isExpanded: true,
              items: districtData.keys.map((district) {
                return DropdownMenuItem(
                  value: district,
                  child: Text(district, style: const TextStyle(fontSize: 20)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedDistrict = value!);
              },
            ),
            const SizedBox(height: 24),

            // Metrics Cards
            MetricCard(
              title: 'Job Cards Issued',
              value: data['jobCards']!,
              icon: Icons.credit_card,
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            MetricCard(
              title: 'Workers Employed',
              value: data['workers']!,
              icon: Icons.people,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            MetricCard(
              title: 'Person-Days',
              value: data['personDays']!,
              icon: Icons.calendar_today,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            MetricCard(
              title: 'Total Expenditure (₹)',
              value: data['expenditure']!,
              icon: Icons.account_balance_wallet,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
