import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_dialog.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_information_card.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/persons/domain/usecases/person_usecase.dart';
import 'package:khatoon_container/src/features/persons/presentation/widgets/person_picker_dialog.dart';
import 'package:khatoon_container/index.dart';

class CustomerInfoWidget extends StatefulWidget {
  const CustomerInfoWidget({super.key});

  @override
  State<CustomerInfoWidget> createState() => _CustomerInfoWidgetState();
}

class _CustomerInfoWidgetState extends State<CustomerInfoWidget> {
  String? name, family, town, street, phonNumber;
  GetPersonUseCase getPersonUseCase = sl<GetPersonUseCase>();
  late final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    return CustomerInformationCard(
       onNameChanged: onUserFieldClickEvent,
      // name: name,
      // familyName: family,
       onAddressChanged: onDetailClickEvent,
      // phonNumber: phonNumber,
       onPhoneChanged: onPhoneClickEvent ,
      // town: town,
    );
  }

  // Widget dialog = const Dialog(child: ListView.builder(b),);

  void onUserFieldClickEvent(String value) async{


    // final PersonPickerDialog result = const PersonPickerDialog();
    // result;
    // persons = await getPersonUseCase.execute();
    await showDialog<String>(

      animationStyle: const .new(
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      ),

      context: context,
      barrierColor: Colors.white70,
      barrierLabel: 'انتخاب',
      traversalEdgeBehavior: .parentScope,
      builder: (BuildContext context) {
        return const CustomDialog(content: PersonPickerDialog());
      },
      anchorPoint: const .new(150, 200),
    );
  }

  void onDetailClickEvent(String value) {}
  void onPhoneClickEvent(String value) {}
}
