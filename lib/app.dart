import 'package:flutter/material.dart';
import 'package:recast_designs_task/screens/home/home_screen.dart';
import 'package:recast_designs_task/screens/profile/profile_screen.dart';
import 'theme/app_theme.dart';
import 'theme/responsive.dart';

class AlterNowApp extends StatelessWidget {
  const AlterNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlterNow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const _ResponsiveShell(),
    );
  }
}

class _ResponsiveShell extends StatefulWidget {
  const _ResponsiveShell();

  @override
  State<_ResponsiveShell> createState() => _ResponsiveShellState();
}

class _ResponsiveShellState extends State<_ResponsiveShell> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Responsive.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      onProfileTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ProfileScreen(),
          ),
        );
      },
    );
  }
}
