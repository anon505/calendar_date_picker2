import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import 'package:example/app_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

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
              InkWell(
                onTap: (){
                  AppBottomSheet().showModal(content: _buildDefaultSingleDatePickerWithValue(),
                      isScrollControlled: true, context: context);
                },
                child: Text('show dialog'),
              )
              //_buildCalendarDialogButton(),

              //_buildDefaultMultiDatePickerWithValue(),
              //_buildDefaultRangeDatePickerWithValue(),
              //_buildCalendarWithActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final currentYear = DateTime.now().year;
    final firstDate = DateTime(currentYear - 100, 1);
    final config = CalendarDatePicker2Config(
      firstDate: firstDate,
      lastDate: DateTime(firstDate.year + 100, firstDate.month + 12)
          .subtract(Duration(days: 1)),
      selectedDayHighlightColor: Colors.amber[900],
      weekdayLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 0,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          initialValue: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (values) =>
              setState(() => _singleDatePickerValueWithDefaultValue = values),
        ),
        TimePickerSpinner(
          isForce2Digits: true,
          is24HourMode: true,
          isShowSeconds: false,
          onTimeChange: (time) {

          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Text(
              _getValueText(
                config.calendarType,
                _singleDatePickerValueWithDefaultValue,
              ),
            ),
          ],
        ),
        /*CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (DateTime newDate) {
            print(newDate);

          },
        ),*/
        const SizedBox(height: 25),
      ],
    );
  }
}
