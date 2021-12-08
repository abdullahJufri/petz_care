import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:petz_care/firestore/all_clinic_ref.dart';
import 'package:petz_care/model/city_model.dart';
import 'package:petz_care/state_management.dart';

class BookingScreen extends StatefulWidget {
  static const String id = 'booking_screen';

  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentStep = 0;

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: Text('City'),
            content: Container(
              // child: Text('assa')
              height: 550,
              child: displayCityList(),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('Clinic'),
            content: Container()),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text('City'),
            content: Container()),
        Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            title: Text('Complete'),
            content: Container()),
      ];

  displayCityList() {
    return FutureBuilder(
        future: getCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var cities = snapshot.data as List<CityModel>;
            if (cities == null || cities.length == 0)
              return Center(
                child: Text('Cannot load City'),
              );
            else
              return ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: ()=> context.read(selectedCity).state = cities[index].name,
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.home_work),
                          // trailing: context.read(selectedCity).state ==
                          //         cities[index].name
                          //     ? Icon(Icons.check)
                          //     : null,
                          title: Text('${cities[index].name}'),
                        ),
                      ),
                    );
                  });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                print('complete');
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1)),
      ),
    );
  }
}
