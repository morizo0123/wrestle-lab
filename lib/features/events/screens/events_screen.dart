import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Map<String, String>>> _events = {
    DateTime(2025, 7, 5): [
      {'title': 'G1 CLIMAX', 'type': 'tournament'},
    ],
    DateTime(2025, 7, 12): [
      {'title': '記者会見', 'type': 'event'},
      {'title': 'ファンミーティング', 'type': 'event'},
    ],
    DateTime(2025, 7, 20): [
      {'title': 'DOMINION', 'type': 'tournament'},
    ],
    DateTime(2025, 7, 25): [
      {'title': '特別番組', 'type': 'event'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildCalendar(),
        _buildLegend(),
        _buildSampleNotice(),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),

      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime(2020, 1, 1),
        lastDay: DateTime(2030, 12, 31),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          // 日付選択時の処理
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });

          // イベントがある日かチェック
          final normalizedDay = DateTime(
            selectedDay.year,
            selectedDay.month,
            selectedDay.day,
          );
          final events = _events[normalizedDay];

          if (events != null && events.isNotEmpty) {
            _showEventBottomSheet(context, selectedDay, events);
          }

          print('選択された日付: $selectedDay');
        },
        onPageChanged: (focusedDay) {
          // 月移動時の処理
          setState(() {
            _focusedDay = focusedDay;
          });
          print('表示月変更: $focusedDay');
        },

        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        locale: 'ja_JP',

        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
        ),

        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(color: Colors.black),
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),

        eventLoader: (day) {
          // DateTime正規化
          final normalizedDay = DateTime(day.year, day.month, day.day);
          final events = _events[normalizedDay] ?? [];
          if (events.isNotEmpty) {
            print('イベントあり: $day, イベント数: ${events.length}');
          }
          return events;
        },

        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              return _buildEventMarkers(events);
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildEventMarkers(List events) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          events.map<Widget>((event) {
            Color markerColor;
            if (event['type'] == 'tournament') {
              markerColor = Colors.yellow;
            } else {
              markerColor = Colors.red;
            }

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: markerColor,
                shape: BoxShape.circle,
              ),
            );
          }).toList(),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLegendItem(Colors.yellow, '大会日程'),
          _buildLegendItem(Colors.red, '各種イベント'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildSampleNotice() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.orange[200]!),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '※ 2025年7月分のサンプルデータを表示しています',
                style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEventBottomSheet(
    BuildContext context,
    DateTime date,
    List<Map<String, String>> events,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${date.month}月${date.day}日のイベント',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...events.map((event) => _buildEventItem(event)).toList(),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEventItem(Map<String, String> event) {
    Color iconColor =
        event['type'] == 'tournament' ? Colors.yellow[700]! : Colors.red;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Text(event['title']!, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
