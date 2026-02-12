import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalStepper extends StatefulWidget {
  const HorizontalStepper({super.key});

  @override
  State<HorizontalStepper> createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  int _currentStep = 0;
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: stepList(),
      type: StepperType.horizontal,
      elevation: 0,
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < (stepList().length - 1)) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Row(
          children: <Widget>[
            if (_currentStep > 0)
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: details.onStepContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Step> stepList() => <Step>[
    Step(
      title: Text('Info', style: Theme.of(context).textTheme.bodyLarge),
      isActive: _currentStep >= 0,
      state: _currentStep <= 0 ? StepState.editing : StepState.complete,
      content: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person, color: Theme.of(context).iconTheme.color),
            title: Text(
              'Username: johndoe',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text('This is your public username', style: Theme.of(context).textTheme.bodySmall),
          ),
          ListTile(
            leading: Icon(Icons.cake, color: Theme.of(context).iconTheme.color),
            title: Text(
              'Birthday: January 1, 1990',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text('Your birth date', style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    ),
    Step(
      title: const Text('Address'),
      isActive: _currentStep >= 1,
      state: _currentStep <= 1 ? StepState.editing : StepState.complete,
      content: const Column(
        children: <Widget>[
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.red),
            title: Text(
              'Home Address: 123 St',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('Street and number'),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text(
              'City: Springfield',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('Your city of residence'),
          ),
        ],
      ),
    ),
    Step(
      title: const Text('Rate'),
      isActive: _currentStep >= 2,
      state: _currentStep == 2 ? StepState.editing : StepState.complete,
      content: Column(
        children: <Widget>[
          const Text(
            'Rate your experience',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(5, (int index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 36,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            'You selected $_rating star${_rating != 1 ? 's' : ''}',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    ),
  ];
}
