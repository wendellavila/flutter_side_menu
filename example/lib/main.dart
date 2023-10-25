import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<String> _title = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];

  SideMenuItemDataTile _sideMenuItem(int index, bool isMenuOpen) {
    return SideMenuItemDataTile(
      isSelected: _currentIndex == index,
      title: _title[index],
      //tooltip: isMenuOpen ? null : _title[index],
      tooltip: _title[index],
      titleStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      selectedTitleStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      icon: Icon(
        Icons.info,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      selectedIcon: Icon(
        Icons.info,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      highlightSelectedColor: Theme.of(context).colorScheme.primary,
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ],
          ),
          child: SideMenu(
            mode: SideMenuMode.auto,
            hasResizer: true,
            hasResizerToggle: true,
            builder: (data) {
              return SideMenuData(
                items: [
                  for (int i = 0; i < 5; i++) _sideMenuItem(i, data.isOpen)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
