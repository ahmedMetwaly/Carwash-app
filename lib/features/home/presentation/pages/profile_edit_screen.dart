import 'dart:io';

import 'package:carwashapp/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_event.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:carwashapp/features/home/presentation/widgets/change_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; // For profile image picking

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentCarType;
  final String currentProfileImageUrl;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    required this.currentEmail,
    required this.currentCarType,
    required this.currentProfileImageUrl,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _carTypeController;
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
    _carTypeController = TextEditingController(text: widget.currentCarType);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _carTypeController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Profile picture section
                  const Center(
                    child: ChangeProfileImageWidget(),
                  ),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: _pickImage,
                  //     child: CircleAvatar(
                  //       radius: 50,
                  //       backgroundImage: _profileImagePath == null
                  //           ? NetworkImage(widget.currentProfileImageUrl)
                  //           : FileImage(File(_profileImagePath!)) as ImageProvider,
                  //       child: const Align(
                  //         alignment: Alignment.bottomRight,
                  //         child: CircleAvatar(
                  //           backgroundColor: Colors.white,
                  //           radius: 20,
                  //           child: Icon(
                  //             Icons.camera_alt,
                  //             color: Colors.blueAccent,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),

                  // Name field
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Email field
                  TextFormField(
                    controller: _emailController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Car type field (if editable)
                  TextFormField(
                    controller: _carTypeController,
                    decoration: const InputDecoration(
                      labelText: "Car Type",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.directions_car),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Save button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save profile changes
                        _formKey.currentState!.save();

                        AuthenticationBloc.user.name = _nameController.text;
                        context.read<UserBloc>().add(ChangeProfileEvent());

                        // Call your API or update logic here

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile updated')),
                        );
                      }
                    },
                    child: const Text("Save Changes"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
