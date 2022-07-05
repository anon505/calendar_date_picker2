import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

var today = DateUtils.dateOnly(DateTime.now());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalendarDatePicker2 Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CalendarDatePicker2 Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 375,
          child: ListView(
            children: <Widget>[
              //_buildCalendarDialogButton(),
              //_buildDefaultSingleDatePickerWithValue(),
              _buildDefaultMultiDatePickerWithValue(),
              //_buildDefaultRangeDatePickerWithValue(),
              //_buildCalendarWithActionButtons(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildDefaultMultiDatePickerWithValue() {
    var config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: BaseColors.warning400,
      weekdayLabels: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat']
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          initialValue: [],
          initialEvent: [
            DateTime.parse("2022-06-01 13:27:00"),
            DateTime(today.year, today.month, 1),
            DateTime(today.year, today.month, 1),
            DateTime(today.year, today.month, 8),
            DateTime(today.year, today.month, 14),
            DateTime(today.year, today.month, 17),
            DateTime(today.year, today.month, 25),
          ],
          onValueChanged: (values) => {
            print(values)
          },
        ),
      ],
    );
  }

}
