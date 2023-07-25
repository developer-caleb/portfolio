import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_20/component/event_page.dart';
import 'package:hanaromart/scrn/app_20/component/no_event.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '이벤트',
      body: true ? EventPage() : NoEvent(),
    );
  }
}
