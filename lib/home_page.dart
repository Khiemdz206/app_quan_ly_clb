import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:app_clb/homescreen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusDay = DateTime.now();
  DateTime? _selectDay;
  @override
  void initState(){
    super.initState();
    _selectDay = _focusDay;
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
            context, 
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Homescreen(),
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child,);
              },
            )
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset('assets/image/gdgsc_new.png', height: 30),
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined, 
                  color: Colors.black, 
                  size: 28,
                ),
                onPressed: () {
                },
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8), 
        ],
      ),

    body: SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(1, 5),
                )
              ]
            ),
            padding: const EdgeInsets.only(bottom: 10),
            child: TableCalendar<Color>(
              firstDay: DateTime.utc(2020, 1 ,1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) => isSameDay(_selectDay, day),
              onDaySelected: (selectedDay, focusedDay){
                setState(() {
                  _selectDay = selectedDay;
                  _focusDay = focusedDay;
                });
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.arrow_back_ios, size: 16),
                rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                outsideTextStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                weekendTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                todayDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                )
              ),
            ),
          ),
          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: _buildMenuButton('assets/image/calender.png', 'Events', 'Check out the tech sharing,\n meetings schedule', () => ())
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildMenuButton('assets/image/teamwork.png', 'Teammates', 'Find Teammates to join \nthe competition', () =>()) 
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _buildMenuButton('assets/image/podium.png', 'Leaderboards', 'Active club member\nranking', () => ()),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildMenuButton('assets/image/setting.png', 'Tools', 'Some other products\nof GDG', () => ()),
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
  
  Widget _buildMenuButton(String imagePath, String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 75,  
            height: 75,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.black87, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Text(
            title, 
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 14, 
              color: Colors.black
            ),
          ),
          
          const SizedBox(height: 5), 
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11, 
              color: Colors.grey, 
              height: 1.3 
            ),
          ),
        ],
      ),
    );
    
  }
}