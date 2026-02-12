import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class TimelineCalendar extends StatelessWidget {
  const TimelineCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (DateTime selectedDate) {},
      headerProps: const EasyHeaderProps(
        showHeader: false,
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps:  EasyDayProps(
        inactiveDayStyle: const DayStyle(dayNumStyle: TextStyle(color: Colors.white)),
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ],
            ),
          ),
        ),
      ),
    );
  }
}
