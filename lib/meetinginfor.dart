import 'package:flutter/material.dart';

class MeetingInfoSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final String location;
  final String description;

  const MeetingInfoSheet({
    super.key,
    this.title = 'CMS project meeting',
    this.subtitle = 'Developer Meeting',
    this.date = '27 Dec, 2023',
    this.time = '9h-9h30',
    this.location = 'Online, Microsoft teams',
    this.description = 'Some description about meeting',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAvatarStack(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          _buildInfoRow(Icons.calendar_today_outlined, date),
          _buildInfoRow(Icons.access_time_outlined, time),
          _buildInfoRow(Icons.location_on_outlined, location),
          _buildInfoRow(Icons.subject_outlined, description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 16),
                  Text('Reminder', style: TextStyle(fontSize: 16)),
                ],
              ),
              Switch(value: false, onChanged: (val) {}),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          const Text(
            'Notes:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
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
