import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{

   const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final  user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

   int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Add')),
    const Center(child: Text('Notifications')),
    const Center(child: Text('Profile')),
  ];

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello ${user.email}'),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: signUserOut,
                  icon: const Icon(Icons.logout),
                ),
              ],
            )
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _onItemTapped(1),
              ),
              const SizedBox(width: 32.0),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _onItemTapped(2),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

}
