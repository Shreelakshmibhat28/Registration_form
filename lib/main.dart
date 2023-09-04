import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {'/': (context) => Register()},
));
//defining enumeration
enum Gender {
  Male,
  Female,
  Other,
}
//to convert gender to string
String genderToString(Gender gender) {
  switch (gender) {
    case Gender.Male:
      return 'Male';
    case Gender.Female:
      return 'Female';
    case Gender.Other:
      return 'Other';
    default:
      return '';
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map userData = {};
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  Gender? selectedGender;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _workStateController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  //this function displays the date picker dialogue and allows the user to select the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateOfBirthController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
//the compiler goes to success page function
  void _navigateToSuccessPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuccessPage()),
    );
  }

  @override
  //dispose method is used to release resources and perform cleanup operations associated with the widget and its related controllers.
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _genderController.dispose();
    _workStateController.dispose();
    _skillController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Here!!!'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/regime.jpg'),
                  ),
                ),
                //entering first name part
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first name'),
                      MinLengthValidator(2,
                          errorText: 'Name should be more than 2 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter first Name',
                      labelText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //enter last name part
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: MultiValidator([
                     // RequiredValidator(errorText: 'Enter last name'),
                      MinLengthValidator(1,
                          errorText: 'Last name should be at least 1 character'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter last Name',
                      labelText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //enter email part
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(
                          errorText: 'Please enter a valid email address'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //mobile number part
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _mobileController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      PatternValidator(
                        r'^\d{3}[-\s]?\d{3}[-\s]?\d{4}$',
                        errorText: 'Enter a valid mobile number',
                      ),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),

                //address part
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _addressController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your address'),
                      MaxLengthValidator(300,
                          errorText: 'Address should not exceed 300 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter your address',
                      labelText: 'Address',
                      prefixIcon: Icon(
                        Icons.home,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //date of birth part
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,

                    controller: _dateOfBirthController,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      labelText: 'Date of Birth',
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),

                //gender selection
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField<Gender>(
                    value: selectedGender,
                    onChanged: (Gender? newValue) {
                      setState(() {
                        selectedGender = newValue;
                        _genderController.text = genderToString(selectedGender!);
                      });
                    },
                    items: Gender.values.map<DropdownMenuItem<Gender>>(
                          (Gender gender) {
                        return DropdownMenuItem<Gender>(
                          value: gender,
                          child: Text(genderToString(gender)),
                        );
                      },
                    ).toList(),
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      prefixIcon: Icon(Icons.person_4),
                      border: OutlineInputBorder(),
                    ),
                  ),

                ),

                 //work state part
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _workStateController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your Working state'),
                      MaxLengthValidator(100,
                          errorText: 'Work State should not exceed 100 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter your working state',
                      labelText: 'Working State',
                      prefixIcon: Icon(
                        Icons.work,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //skills part
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _skillController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your skills'),
                      MaxLengthValidator(200,
                          errorText: 'skills should not exceed 200 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter the skills you are bold enough',
                      labelText: 'Skills',
                      prefixIcon: Icon(
                        Icons.tungsten,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //interests part
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _interestController,
                    validator: MultiValidator([
                     // RequiredValidator(errorText: 'Enter your interests'),
                      MaxLengthValidator(200,
                          errorText: 'Interests should not exceed 200 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter your Interests',
                      labelText: 'Interests',
                      prefixIcon: Icon(
                        Icons.interests,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                //register button part
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _navigateToSuccessPage();
                            print('Form submitted');
                            print('First Name: ${_firstNameController.text}');
                            print('Last Name: ${_lastNameController.text}');
                            print('Email: ${_emailController.text}');
                            print('Mobile: ${_addressController.text}');
                            print('Address: ${_addressController.text}');
                            print('Date of Birth: ${_dateOfBirthController.text}');
                            print('Gender: ${_genderController.text}');
                            print('Work state: ${_workStateController.text}');
                            print('Skills: ${_skillController.text}');
                            print('Interests: ${_interestController.text}');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//success page
class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered'),
       //  Color: Colors.green
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations 🤩 You have Registered Successfully in our portal!🤝',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}