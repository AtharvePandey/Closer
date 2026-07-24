// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const CloserApp());
}

const Color kBackground = Color(0xFF090909);
const Color kSurface = Color(0xFF151515);
const Color kPurple = Color(0xFF9C4DFF);
const Color kPink = Color(0xFFFF4FA6);

class CloserApp extends StatelessWidget {
  const CloserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Closer",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackground,
        fontFamily: "Roboto",
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const PlaceholderPage(title: "Discover"),
    const PlaceholderPage(title: "Create"),
    const PlaceholderPage(title: "Inbox"),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101010),
        border: Border(
          top: BorderSide(color: Colors.white10),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomButton(
            icon: Icons.home_outlined,
            label: "Home",
            selected: selectedIndex == 0,
            onTap: () => setState(() => selectedIndex = 0),
          ),
          _BottomButton(
            icon: Icons.explore_outlined,
            label: "Discover",
            selected: selectedIndex == 1,
            onTap: () => setState(() => selectedIndex = 1),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [kPurple, kPink]),
                boxShadow: [
                  BoxShadow(
                    color: kPurple.withOpacity(0.35),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: kBackground,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 36),
              ),
            ),
          ),
          _BottomButton(
            icon: Icons.chat_bubble_outline,
            label: "Chats",
            selected: selectedIndex == 3,
            onTap: () => setState(() => selectedIndex = 3),
          ),
          _BottomButton(
            icon: Icons.person_outline,
            label: "Profile",
            selected: selectedIndex == 4,
            onTap: () => setState(() => selectedIndex = 4),
          ),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BottomButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? kPurple : Colors.white70;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(color: color, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 32, color: Colors.white70),
        ),
      ),
    );
  }
}
