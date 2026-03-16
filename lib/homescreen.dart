import 'package:flutter/material.dart';
import 'package:app_clb/home_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State <Homescreen> createState() =>  _HomescreenState();
}

class  _HomescreenState extends State <Homescreen> {
  int _selectedIndex = 0;
  bool _isAnimating = false;

  late PageController _pageController;

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('Đây là trang Memories', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Đây là trang Profile', style: TextStyle(fontSize: 24))),
  ];  
  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index; 
      _isAnimating = true;    
    });
    await _pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOutQuad
    );
    _isAnimating = false; 
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          if (!_isAnimating) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        physics: const BouncingScrollPhysics(),

        children: _pages,
      ),

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
            _buildNavItem(0, 'assets/image/home.png', 'Home'),
            _buildNavItem(1, 'assets/image/photo.png', 'Memories'),
            _buildNavItem(2, 'assets/image/user.png', 'Profile'),
          ]
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String assetPath, String label) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 24, height: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
              fontWeight: _selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}