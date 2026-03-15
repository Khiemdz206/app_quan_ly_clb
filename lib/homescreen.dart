import 'package:flutter/material.dart';
import 'package:app_clb/home_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State <Homescreen> createState() =>  _HomescreenState();
}

class  _HomescreenState extends State <Homescreen> {
  int _selectedIndex = 0;

  int _preIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _preIndex = index;
      
    });
    _pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOutQuad
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          if(index == _preIndex){
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