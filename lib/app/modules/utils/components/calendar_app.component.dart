import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPickerAppComponent extends StatefulWidget {
  final List<DateTime> blockedDates; // Dias inteiros indisponíveis
  final List<DateTime> unavailableHours; // Horários específicos ocupados
  final bool showHour; // Se deve pedir a hora ou não
  final Function(DateTime selectedDate, DateTime? fullDateTime) onConfirm;

  const CalendarPickerAppComponent({
    super.key,
    required this.blockedDates,
    required this.unavailableHours,
    required this.showHour,
    required this.onConfirm,
  });

  @override
  State<CalendarPickerAppComponent> createState() =>
      _CalendarPickerAppComponentState();
}

class _CalendarPickerAppComponentState
    extends State<CalendarPickerAppComponent> {
  DateTime? _selectedDay;
  DateTime? _selectedFullDateTime;

  List<DateTime> _generateAvailableSlots(DateTime date) {
    List<DateTime> slots = [];
    // Define o range de atendimento: 08:00 às 18:00
    DateTime start = DateTime(date.year, date.month, date.day, 8, 0);
    DateTime end = DateTime(date.year, date.month, date.day, 18, 0);

    while (start.isBefore(end)) {
      // Verifica se o slot exato está na lista de indisponíveis
      bool isBooked = widget.unavailableHours.any(
        (uh) =>
            uh.year == start.year &&
            uh.month == start.month &&
            uh.day == start.day &&
            uh.hour == start.hour &&
            uh.minute == start.minute,
      );

      if (!isBooked) slots.add(start);
      start = start.add(const Duration(minutes: 30)); // Intervalos de 30 min
    }
    return slots;
  }

  void _openTimePicker(DateTime date) {
    final availableSlots = _generateAvailableSlots(date);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Horários disponíveis para ${date.day}/${date.month}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColor.pantone348C,
                ),
              ),
              const SizedBox(height: 15),
              availableSlots.isEmpty
                  ? const Center(
                      child: Text("Nenhum horário disponível para este dia."),
                    )
                  : Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 2.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemCount:
                            availableSlots.length, // Correção lógica abaixo
                        itemBuilder: (context, index) {
                          final slot = availableSlots[index];
                          return InkWell(
                            onTap: () {
                              setState(() => _selectedFullDateTime = slot);
                              Navigator.pop(context);
                              widget.onConfirm(date, slot);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.pantone382C.withAlpha(60),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColor.pantone7722C,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "${slot.hour}:${slot.minute.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  color: AppColor.pantone7722C,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCalendar(
          cellBorderColor: AppColor.pantone7722C.withAlpha(60),
          todayHighlightColor: AppColor.pantone382C,
          todayTextStyle: const TextStyle(
            color: AppColor.pantone7722C,
            fontWeight: FontWeight.w800,
          ),
          weekNumberStyle: WeekNumberStyle(
            textStyle: TextStyle(color: AppColor.danger),
          ),
          view: CalendarView.month,
          blackoutDates: widget.blockedDates,
          blackoutDatesTextStyle: const TextStyle(
            color: AppColor.danger,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
          ),
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColor.pantone382C, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle(
              color: AppColor.pantone7722C,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          monthViewSettings: const MonthViewSettings(
            showAgenda: false,
            dayFormat: 'EEE',
          ),
          onTap: (details) {
            if (details.date == null) return;

            // Verifica se é um dia bloqueado (Syncfusion as vezes permite o tap em blackout)
            bool isBlocked = widget.blockedDates.any(
              (d) =>
                  d.year == details.date!.year &&
                  d.month == details.date!.month &&
                  d.day == details.date!.day,
            );

            if (isBlocked) return;

            setState(() => _selectedDay = details.date);

            if (widget.showHour) {
              _openTimePicker(details.date!);
            } else {
              widget.onConfirm(details.date!, null);
            }
          },
        ),
      ],
    );
  }
}

/* 
Ex de uso:

CalendarPickerAppComponent(
                  showHour: true, // Mude para false para ignorar a hora
                  blockedDates: [DateTime(2026, 2, 25), DateTime(2026, 2, 26)],
                  unavailableHours: [
                    DateTime(2026, 02, 22, 14, 00), // Domingo às 14:00 ocupado
                    DateTime(2026, 02, 22, 14, 30), // Domingo às 14:30 ocupado
                  ],
                  onConfirm: (date, time) {
                    print("Data: $date, Hora: $time");
                  },
                ),

*/
