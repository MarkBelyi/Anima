import 'package:flutter/material.dart';

import '../Theme/Color/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Messages Page')),
    Center(child: Text('Settings Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3629B7).withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(
            icon: Icons.home_rounded,
            label: 'Home',
            isActive: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          _buildIcon(
            icon: Icons.search_rounded,
            label: 'Search',
            isActive: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          _buildIcon(
            icon: Icons.mail_outline_rounded,
            label: 'Message',
            isActive: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          _buildIcon(
            icon: Icons.settings_outlined,
            label: 'Settings',
            isActive: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
    Color activeColor = AppColors.primaryGreenLight,
    Color backgroundColor = Colors.transparent,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: AppColors.neutralWhite,
                    size: 24,
                  ),
                  if (label.isNotEmpty) SizedBox(width: 8),
                  if (label.isNotEmpty)
                    Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.neutralWhite,
                      ),
                    ),
                ],
              ),
            )
          else
            Icon(
              icon,
              color: AppColors.neutralGrayDark,
              size: 24,
            ),
        ],
      ),
    );
  }
}
