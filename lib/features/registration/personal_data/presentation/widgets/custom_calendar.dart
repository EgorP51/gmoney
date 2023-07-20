import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/features/registration/personal_data/domain/controllers/personal_data_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalendar {
  final List<int> _monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }

  List<Calendar> getMonthCalendar(
    int month,
    int year, {
    StartWeekDay startWeekDay = StartWeekDay.sunday,
  }) {
    if (month < 1 || month > 12) throw ArgumentError('Invalid year or month');

    List<Calendar> calendar = [];

    int otherYear;
    int otherMonth;
    int leftDays;

    // get no. of days in the month
    // month-1 because _monthDays starts from index 0 and month starts from 1
    int totalDays = _monthDays[month - 1];
    // if this is a leap year and the month is february, increment the total days by 1
    if (_isLeapYear(year) && month == DateTime.february) totalDays++;

    // get this month's calendar days
    for (int i = 0; i < totalDays; i++) {
      calendar.add(
        Calendar(
          // i+1 because day starts from 1 in DateTime class
          date: DateTime(year, month, i + 1),
          thisMonth: true,
        ),
      );
    }

    // fill the unfilled starting weekdays of this month with the previous month days
    if ((startWeekDay == StartWeekDay.sunday &&
            calendar.first.date.weekday != DateTime.sunday) ||
        (startWeekDay == StartWeekDay.monday &&
            calendar.first.date.weekday != DateTime.monday)) {
      // if this month is january, then previous month would be decemeber of previous year
      if (month == DateTime.january) {
        otherMonth = DateTime
            .december; // _monthDays index starts from 0 (11 for december)
        otherYear = year - 1;
      } else {
        otherMonth = month - 1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth - 1];
      if (_isLeapYear(otherYear) && otherMonth == DateTime.february) {
        totalDays++;
      }

      leftDays = totalDays -
          calendar.first.date.weekday +
          ((startWeekDay == StartWeekDay.sunday) ? 0 : 1);

      for (int i = totalDays; i > leftDays; i--) {
        calendar.insert(
          0,
          Calendar(
            date: DateTime(otherYear, otherMonth, i),
            prevMonth: true,
          ),
        );
      }
    }

    // fill the unfilled ending weekdays of this month with the next month days
    if ((startWeekDay == StartWeekDay.sunday &&
            calendar.last.date.weekday != DateTime.saturday) ||
        (startWeekDay == StartWeekDay.monday &&
            calendar.last.date.weekday != DateTime.sunday)) {
      // if this month is december, then next month would be january of next year
      if (month == DateTime.december) {
        otherMonth = DateTime.january;
        otherYear = year + 1;
      } else {
        otherMonth = month + 1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth - 1];
      if (_isLeapYear(otherYear) && otherMonth == DateTime.february) {
        totalDays++;
      }

      leftDays = 7 -
          calendar.last.date.weekday -
          ((startWeekDay == StartWeekDay.sunday) ? 1 : 0);
      if (leftDays == -1) leftDays = 6;

      for (int i = 0; i < leftDays; i++) {
        calendar.add(
          Calendar(
            date: DateTime(otherYear, otherMonth, i + 1),
            nextMonth: true,
          ),
        );
      }
    }

    return calendar;
  }
}

class Calendar {
  final DateTime date;
  final bool thisMonth;
  final bool prevMonth;
  final bool nextMonth;

  Calendar(
      {required this.date,
      this.thisMonth = false,
      this.prevMonth = false,
      this.nextMonth = false});
}

enum StartWeekDay { sunday, monday }

enum CalendarViews { dates, months, year }

class GMoneyCustomCalendar extends StatefulWidget {
  const GMoneyCustomCalendar({super.key});

  @override
  GMoneyCustomCalendarState createState() => GMoneyCustomCalendarState();
}

class GMoneyCustomCalendarState extends State<GMoneyCustomCalendar> {
  late DateTime _currentDateTime;
  late DateTime _selectedDateTime;
  List<Calendar>? _sequentialDates;
  int? midYear;
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);
    _selectedDateTime = DateTime(date.year, date.month, date.day);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendar());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.gmoneyColors.buttonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
          child: (_currentView == CalendarViews.dates)
              ? _datesView()
              : (_currentView == CalendarViews.months)
                  ? _showMonthsList()
                  : _yearsView(midYear ?? _currentDateTime.year)),
    );
  }

  // dates view
  Widget _datesView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // header
        Row(
          children: <Widget>[
            // prev month button
            _toggleBtn(false),
            // month and year
            Expanded(
              child: InkWell(
                onTap: () =>
                    setState(() => _currentView = CalendarViews.months),
                child: Center(
                  child: Text(
                    '${_monthNames[_currentDateTime.month - 1]} ${_currentDateTime.year}',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFE0E0E0)),
                  ),
                ),
              ),
            ),
            // next month button
            _toggleBtn(true),
          ],
        ),
        const SizedBox(height: 20),
        Flexible(child: _calendarBody()),
      ],
    );
  }

  Widget _toggleBtn(bool next) {
    return InkWell(
      onTap: () {
        if (_currentView == CalendarViews.dates) {
          setState(() => (next) ? _getNextMonth() : _getPrevMonth());
        } else if (_currentView == CalendarViews.year) {
          if (next) {
            midYear =
                (midYear == null) ? _currentDateTime.year + 9 : midYear! + 9;
          } else {
            midYear =
                (midYear == null) ? _currentDateTime.year - 9 : midYear! - 9;
          }
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: Icon(
          (next) ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
          color: context.gmoneyColors.whiteColor.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _calendarBody() {
    if (_sequentialDates == null) return const SizedBox();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: _sequentialDates!.length + 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < 7) return _weekDayTitle(index);
        if (_sequentialDates![index - 7].date == _selectedDateTime) {
          return _selector(_sequentialDates![index - 7]);
        }
        return _calendarDates(_sequentialDates![index - 7]);
      },
    );
  }

  // calendar header
  Widget _weekDayTitle(int index) {
    return Text(
      textAlign: TextAlign.center,
      _weekDays[index],
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: (index == 5 || index == 6)
            ? context.gmoneyColors.errorColor
            : context.gmoneyColors.whiteColor,
      ),
    );
  }

  // calendar element
  Widget _calendarDates(Calendar calendarDate) {
    return InkWell(
      onTap: () {
        if (_selectedDateTime != calendarDate.date) {
          if (calendarDate.nextMonth) {
            _getNextMonth();
          } else if (calendarDate.prevMonth) {
            _getPrevMonth();
          }
          setState(() {
            _selectedDateTime = calendarDate.date;
            Get.find<PersonalDataController>()
              ..dateOfBirth = _selectedDateTime
              ..dateOfBirthController.text =
                  '${_selectedDateTime.day.toString().padLeft(2, '0')}/'
                      '${_selectedDateTime.month.toString().padLeft(2, '0')}/'
                      '${_selectedDateTime.year.toString()}';
          });
        }
      },
      child: Center(
        child: Text(
          '${calendarDate.date.day}',
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: (calendarDate.thisMonth)
                ? ((calendarDate.date.weekday == DateTime.sunday) ||
                        (calendarDate.date.weekday == DateTime.saturday))
                    ? const Color(0xFFFF3B30)
                    : const Color(0xFFE0E0E0)
                : (calendarDate.date.weekday == DateTime.sunday) ||
                        (calendarDate.date.weekday == DateTime.saturday)
                    ? const Color(0xFFFF3B30).withOpacity(0.5)
                    : const Color(0xFFE0E0E0).withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _selector(Calendar calendarDate) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          '${calendarDate.date.day}',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: context.gmoneyColors.buttonColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  // get next month calendar
  void _getNextMonth() {
    if (_currentDateTime.month == 12) {
      _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month + 1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth() {
    if (_currentDateTime.month == 1) {
      _currentDateTime = DateTime(_currentDateTime.year - 1, 12);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month - 1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar() {
    _sequentialDates = CustomCalendar().getMonthCalendar(
        _currentDateTime.month, _currentDateTime.year,
        startWeekDay: StartWeekDay.monday);
  }

  // show months list
  Widget _showMonthsList() {
    return SizedBox(
      height: 390,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => setState(() => _currentView = CalendarViews.year),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${_currentDateTime.year}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          const Divider(color: Colors.white),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _monthNames.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  _currentDateTime = DateTime(_currentDateTime.year, index + 1);
                  _getCalendar();
                  setState(() => _currentView = CalendarViews.dates);
                },
                title: Center(
                  child: Text(
                    _monthNames[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: (index == _currentDateTime.month - 1)
                          ? Colors.yellow
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // years list views
  Widget _yearsView(int midYear) {
    return SizedBox(
      height: 390,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _toggleBtn(false),
              const Spacer(),
              _toggleBtn(true),
            ],
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                int thisYear;
                if (index < 4) {
                  thisYear = midYear - (4 - index);
                } else if (index > 4) {
                  thisYear = midYear + (index - 4);
                } else {
                  thisYear = midYear;
                }
                return ListTile(
                  onTap: () {
                    _currentDateTime =
                        DateTime(thisYear, _currentDateTime.month);
                    _getCalendar();
                    setState(() => _currentView = CalendarViews.months);
                  },
                  title: Text(
                    '$thisYear',
                    style: TextStyle(
                        fontSize: 18,
                        color: (thisYear == _currentDateTime.year)
                            ? Colors.yellow
                            : Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
