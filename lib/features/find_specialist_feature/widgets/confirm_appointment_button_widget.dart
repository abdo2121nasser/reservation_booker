import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/configuration/routes.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/book_appointment.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';
import '../screens/specialist_detail_screen.dart';
import 'package:provider/provider.dart';

class ConfirmAppointmentButtonWidget extends StatelessWidget {
  final DataEntity dataEntity;
  const ConfirmAppointmentButtonWidget({
    super.key,
    required this.dataEntity
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DateChangerNotifier>(context);
    return GeneralButtonWidget(
        label: kConfirmAppointment,
        function: () async{
          if(provider.isTimeSelected){
            await BookAppointmentCubit.get(context).
            bookAppointment(
                bookAppointmentRepository: BookAppointmentFromFireBase(appointmentEntity: AppointmentEntity(specialistData: dataEntity,
                    selectedDate: provider.selectedDate.date,
                    selectedTime: provider.selectedTime)),);
            AppRoute.router.pop();
          }
        },
        textColor: kWhiteColor,
        backgroundColor:
            provider.isTimeSelected ? kOrangeColor : kLightOrangeColor,
        borderRadius: k10R);
  }
}
