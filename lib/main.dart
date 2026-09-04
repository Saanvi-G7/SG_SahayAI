import 'package:flutter/material.dart';

void main() {
  runApp(const SahayAIApp());
}

class SahayAIApp extends StatelessWidget {
  const SahayAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SahayAI',
      debugShowCheckedModeBanner: false, // Removes the red "DEBUG" banner
      theme: ThemeData(
        // Nice teal color for accessibility (high contrast)
        primarySwatch: Colors.teal,
        // BIG FONTS so visually impaired users can read easily
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 20),
          labelLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // BIG BUTTONS everywhere
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SahayAI', style: TextStyle(fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 columns of buttons
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildFeatureCard(Icons.medical_services, 'SOS Emergency', Colors.red, context),
            _buildFeatureCard(Icons.gavel, 'Government Schemes', Colors.blue, context),
            _buildFeatureCard(Icons.chat, 'Talk with Me', Colors.green, context),
            _buildFeatureCard(Icons.health_and_safety, 'Health Reminder', Colors.orange, context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String label, Color color, BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // This shows a popup message at the bottom when you tap a button
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening $label... (Coming Soon!)'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: color),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}