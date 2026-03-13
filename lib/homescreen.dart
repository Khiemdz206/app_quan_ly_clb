import 'package:flutter/material.dart';
import 'package:app_clb/home_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State <Homescreen> createState() =>  _HomescreenState();
}

class  _HomescreenState extends State <Homescreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('Đây là trang Memories', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Đây là trang Profile', style: TextStyle(fontSize: 24))),
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 5)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               GestureDetector(
                onTap: () => _onItemTapped(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/home.png', width: 24, height: 24),
                    const SizedBox(height: 4,),
                    Text(
                     'Home',
                     style: TextStyle(
                      color: _selectedIndex == 0? Colors.blue: Colors.grey,
                      fontSize: 12,
                      fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal
                     ), 
                    )
                  ],
                ),
               )
              ],
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/photo.png', width: 24, height: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Memories', 
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey, 
                      fontSize: 12,
                      fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal
                    )
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/user.png', width: 24, height: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Profile', 
                    style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey, 
                      fontSize: 12,
                      fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal
                    )
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}