import 'package:flutter/material.dart';
import 'meetinginfor.dart'; // import bottom sheet vào

class MettingPagState extends StatefulWidget {
  const MettingPagState({super.key});

  @override
  State<MettingPagState> createState() => __MettingPagStateState();
}

class __MettingPagStateState extends State<MettingPagState> {
  final List<Map<String, String>> events = [
    {
      'title': 'Bonding Noel',
      'time': 'Tuesday, 26   6:00pm',
      'type': 'Offline',
      'location': '2nd floor Alumni',
    },
    {
      'title': 'Tech Talk',
      'time': 'Friday, 29   8:00pm',
      'type': 'Online',
      'location': 'Google Meet',
    },
    {
      'title': 'Year End Party',
      'time': 'Sunday, 31   7:00pm',
      'type': 'Offline',
      'location': 'Central Park',
    },
  ];

  final List<Map<String, String>> meetings = [
    {
      'title': 'CMS project meeting',
      'subtitle': 'Developer Meeting',
      'time': '9h-9h30',
      'date': '27 Dec 2023',
      'location': 'Microsoft Teams',
    },
    {
      'title': 'Figma tutorials',
      'subtitle': 'Tech sharing',
      'time': '9h-9h30',
      'date': '28 Dec 2023',
      'location': 'Microsoft Teams',
    },
    {
      'title': 'Flutter workshop',
      'subtitle': 'Mobile Dev Training',
      'time': '14h-16h',
      'date': '05 Jan 2024',
      'location': 'Google Meet',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Title(color: Colors.black, child: Text('Meeting')),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade600,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Tiêu đề Upcoming Events
              const Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 170, // Tăng chiều cao để không bị tràn chữ
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return _buildEventCard(
                      title: event['title'] ?? '',
                      time: event['time'] ?? '',
                      type: event['type'] ?? '',
                      location: event['location'] ?? '',
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Upcoming Meetings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meetings.length,
                itemBuilder: (context, index) {
                  final meeting = meetings[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildMeetingCard(
                      context: context,
                      title: meeting['title'] ?? '',
                      subtitle: meeting['subtitle'] ?? '',
                      time: meeting['time'] ?? '',
                      date: meeting['date'] ?? '',
                      location: meeting['location'] ?? '',
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String time,
    required String type,
    required String location,
  }) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade400, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.park, color: Colors.green, size: 40),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(fontSize: 10, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                type,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, size: 11, color: Colors.black87),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 10, color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMeetingCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String time,
    required String date,
    required String location,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              IconButton(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => MeetingInfoSheet(
                      title: title,
                      subtitle: subtitle,
                      time: time,
                      date: date,
                      location: location,
                      description: 'Mô tả chi tiết cho event: $title',
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 57, 56, 56),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Text(
                  '$time, $date',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 60, 59, 59),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAvatarStack(),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.add, color: Colors.green, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      width: 140,
      height: 24,
      child: Stack(
        children: [
          Positioned(left: 0, child: _buildAvatar(Colors.grey.shade400)),
          Positioned(left: 14, child: _buildAvatar(Colors.blue.shade200)),
          Positioned(left: 28, child: _buildAvatar(Colors.orange.shade200)),
          Positioned(left: 42, child: _buildAvatar(Colors.purple.shade200)),
          Positioned(left: 56, child: _buildAvatar(Colors.teal.shade200)),
          Positioned(
            left: 70,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Text(
                  '+5',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(Icons.person, size: 14, color: Colors.black.withOpacity(0.5)),
    );
  }
}
