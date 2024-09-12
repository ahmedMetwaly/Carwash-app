import 'package:carwashapp/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditAppointmentScreen extends StatefulWidget {
  final String initialDate;
  final String initialTime;
  final String initialLocation;
  final String initialPaymentMethod;

  const EditAppointmentScreen({
    super.key,
    required this.initialDate,
    required this.initialTime,
    required this.initialLocation,
    required this.initialPaymentMethod,
  });

  @override
  State<EditAppointmentScreen> createState() => _EditAppointmentScreenState();
}

class _EditAppointmentScreenState extends State<EditAppointmentScreen> {
  late TextEditingController _locationController;
  late String _selectedPaymentMethod;
  late String _selectedDate;
  late String _selectedTime;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.initialLocation);
    _selectedPaymentMethod = widget.initialPaymentMethod;
    _selectedDate = widget.initialDate;
    _selectedTime = widget.initialTime;
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate =
            "${pickedDate.month}.${pickedDate.day}.${pickedDate.year}";
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Appointment"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date & Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      labelText: _selectedDate ?? "Select Date",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: _pickTime,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.access_time),
                      labelText: _selectedTime ?? "Select Time",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Location Field
            const Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: "Enter Location",
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method Dropdown
            // const Text(
            //   "Payment Method",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // DropdownButtonFormField<String>(
            //   value: _selectedPaymentMethod,
            //   items: ['Cash', 'Credit', 'Vodafone']
            //       .map((method) => DropdownMenuItem(
            //             value: method,
            //             child: Text(method),
            //           ))
            //       .toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedPaymentMethod = value!;
            //     });
            //   },
            //   decoration: const InputDecoration(
            //     labelText: "Select Payment Method",
            //     prefixIcon: Icon(Icons.payment),
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(height: 30),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validate and Save Changes Here
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreenBody(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Appointment details updated!')),
                  );
                },
                child: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
