import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/check_boxes/simple_check_box.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_list_tile.dart';
import 'package:khatoon_container/src/core/constants/extensions.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/persons/domain/usecases/person_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/shared/title_text_drop_down.dart';
import 'package:khatoon_container/index.dart';

class PersonPickerDialog extends StatefulWidget {
  const PersonPickerDialog({super.key});

  @override
  State<PersonPickerDialog> createState() => _PersonPickerDialogState();
}

class _PersonPickerDialogState extends State<PersonPickerDialog> {
  late List<PersonModel> persons;
  GetPersonUseCase getPersonUseCase = sl<GetPersonUseCase>();
  bool enabled = true;
  bool showSelectionBox = true;

  @override
  Widget build(BuildContext context) {
    // pick(const SizedBox(child: Text('a')));
    return Padding(
      padding: const .all(4),
      child: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: persons.length,
            padding: const .fromSTEB(5, 5, 5, 5),
            itemBuilder: (BuildContext context, int index) {
              final PersonModel person = persons[index];
              return CustomCard(
                cardShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  side: BorderSide(width: 0.8, color: Colors.black87),
                ),
                cardChild: CustomListTile(
                  selected: person.isSelected,
                  enabled: enabled,
                  leading: Visibility(
                    visible: showSelectionBox,
                    child: CustomCheckbox(
                      onSelectionChanged: () {
                        setState(() {
                          person.isSelected = !person.isSelected;
                        });
                      },
                    ),
                  ),
                  title: SizedBox(
                    child: TitleTextDropDown(
                      title: '${context.l10n.invoice_invoice}  ',
                      items: const <PopupMenuItem<dynamic>>[],
                    ),
                  ),
                  subtitle: Text(
                    maxLines: 1,
                    '${context.l10n.invoice_saler}: ${person.id} - ${context.l10n.payment_amount}: ${person.description}',
                  ),
                  trailing: const Chip(
                    mouseCursor: .defer,
                    label: Text('', style: TextStyle(color: Colors.white)),
                  ),
                  onLongPress: () {
                    setState(() => showSelectionBox = true);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  // Future<PersonModel> pick(Widget content) async {
  //   if (persons == <PersonModel>[]) {
  //     persons = await getPersonUseCase.execute();
  //   }
  //
  //   final PersonModel? result = await showDialog<PersonModel>(
  //     animationStyle: const .new(
  //       duration: Duration(milliseconds: 250),
  //       curve: Curves.linear,
  //     ),
  //     useSafeArea: false,
  //     barrierColor: Colors.white70,
  //     barrierLabel: context.l10n.common_select,
  //     traversalEdgeBehavior: .parentScope,
  //     builder: (BuildContext context) {
  //       return CustomDialog(content: content);
  //     },
  //     // context: context,
  //     anchorPoint: const .new(150, 200),
  //     context: context,
  //   );
  //
  //   return result ??
  //       PersonModel(
  //         0,
  //         town: '',
  //         street: 'street',
  //         fullAddress: 'fullAddress',
  //         description: 'description',
  //         name: 'name',
  //         familyName: 'familyName',
  //         phoneNumber: 'phoneNumber',
  //         createDate: 0,
  //       );
  // }
}
