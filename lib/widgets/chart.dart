import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // Parent Information
  final TextEditingController _fatherFirstNameController = TextEditingController();
  final TextEditingController _fatherLastNameController = TextEditingController();
  final TextEditingController _fatherPhoneController = TextEditingController();
  final TextEditingController _fatherInstagramController = TextEditingController();
  final TextEditingController _fatherCompanyController = TextEditingController();

  final TextEditingController _motherFirstNameController = TextEditingController();
  final TextEditingController _motherLastNameController = TextEditingController();
  final TextEditingController _motherPhoneController = TextEditingController();
  final TextEditingController _motherInstagramController = TextEditingController();
  final TextEditingController _motherCompanyController = TextEditingController();

  // Address Information
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _streetNumberController = TextEditingController();

  String _selectedFatherOccupation = 'Private Employee';
  String _selectedMotherOccupation = 'Private Employee';
  String _selectedProvince = 'Choose a province';
  String _selectedCity = 'Select City';
  String _selectedDistrict = 'Select District';

  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to AcademyView when back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              Text("Parents", style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _fatherFirstNameController,
                decoration: InputDecoration(labelText: "Father First Name"),
              ),
              TextFormField(
                controller: _fatherLastNameController,
                decoration: InputDecoration(labelText: "Father Last Name"),
              ),
              TextFormField(
                controller: _fatherInstagramController,
                decoration: InputDecoration(labelText: "Father's Instagram"),
              ),
              TextFormField(
                controller: _fatherPhoneController,
                decoration: InputDecoration(labelText: "Father Phone Number"),
                keyboardType: TextInputType.phone,
              ),
              DropdownButtonFormField<String>(
                value: _selectedFatherOccupation,
                decoration: InputDecoration(labelText: "Occupation"),
                items: ['Private Employee', 'Self-employed', 'Unemployed'].map((occupation) {
                  return DropdownMenuItem(value: occupation, child: Text(occupation));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFatherOccupation = value!;
                  });
                },
              ),
              TextFormField(
                controller: _fatherCompanyController,
                decoration: InputDecoration(labelText: "Company"),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _motherFirstNameController,
                decoration: InputDecoration(labelText: "Mother First Name"),
              ),
              TextFormField(
                controller: _motherLastNameController,
                decoration: InputDecoration(labelText: "Mother Last Name"),
              ),
              TextFormField(
                controller: _motherInstagramController,
                decoration: InputDecoration(labelText: "Mother's Instagram"),
              ),
              TextFormField(
                controller: _motherPhoneController,
                decoration: InputDecoration(labelText: "Mother Phone Number"),
                keyboardType: TextInputType.phone,
              ),
              DropdownButtonFormField<String>(
                value: _selectedMotherOccupation,
                decoration: InputDecoration(labelText: "Occupation"),
                items: ['Private Employee', 'Self-employed', 'Unemployed'].map((occupation) {
                  return DropdownMenuItem(value: occupation, child: Text(occupation));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMotherOccupation = value!;
                  });
                },
              ),
              TextFormField(
                controller: _motherCompanyController,
                decoration: InputDecoration(labelText: "Company"),
              ),
              SizedBox(height: 16),
              Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _selectedProvince,
                decoration: InputDecoration(labelText: "Province"),
                items: ['Choose a province', 'Province 1', 'Province 2'].map((province) {
                  return DropdownMenuItem(value: province, child: Text(province));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProvince = value!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCity,
                decoration: InputDecoration(labelText: "City"),
                items: ['Select City', 'City 1', 'City 2'].map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                decoration: InputDecoration(labelText: "District"),
                items: ['Select District', 'District 1', 'District 2'].map((district) {
                  return DropdownMenuItem(value: district, child: Text(district));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDistrict = value!;
                  });
                },
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(labelText: "Street Name"),
              ),
              TextFormField(
                controller: _streetNumberController,
                decoration: InputDecoration(labelText: "Number"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text("I AGREE TO THE TERMS & CONDITIONS"),
                value: _agreeToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _agreeToTerms = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _agreeToTerms ? _submitForm : null,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form data here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }
}
