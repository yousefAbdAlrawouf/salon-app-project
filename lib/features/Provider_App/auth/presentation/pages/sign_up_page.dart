// ignore_for_file: unused_field

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/core/widgets/GradientAppBar.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/models/register_model.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/TextFormFieldWithTopHintText.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/image_picker_widget.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/select_one_from_options_widget.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/sign_up_bottom.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/sign_up_header.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/upload_doc_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();

  String _gender = '';
  String _type = '';
  XFile? _image;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _onSignUp(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AuthnticationCubit>(context).signUp(
        CreateNewUserParams(
          "",
          _phoneController.text,
          _emailController.text,
          _passwordController.text,
          _gender,
          _nameController.text,
          _passwordConfirmController.text,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid data'.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthnticationCubit(getInstance<AuthRemoteDataSource>()),
      child: Builder(
        builder: (ctx) {
          return GradientBackgroundScaffold(
            appBar: const GradientAppBar(),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        signUpHeader(),
                        ImagePickerWidget(
                          onSelectedImage: (selectedImage) {
                            setState(() => _image = selectedImage);
                          },
                        ),
                        _buildTextField(_nameController, "Full Name",
                            "John Doe", Icons.person_outline),
                        const SizedBox(height: 15),
                        SelectOneFromOptionsWidget(
                          name: "Type",
                          onOptionSelected: (option) =>
                              setState(() => _type = option),
                          items: ['Salon'.tr(), 'Free Lancer'.tr()],
                        ),
                        const SizedBox(height: 15),
                        SelectOneFromOptionsWidget(
                          name: "Gender",
                          onOptionSelected: (option) =>
                              setState(() => _gender = option),
                          items: ['female'.tr(), 'male'.tr()],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(_emailController, "Email (Optional)",
                            "example@email.com", Icons.mail_outline),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Phone Number",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // CountryPickerWidget(
                            //     phoneController: _phoneController),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                            _cityController,
                            "City",
                            "EX: United Arab Emirates",
                            Icons.location_on_outlined),
                        const SizedBox(height: 20),
                        _buildTextField(
                            _countryController,
                            "Country",
                            "EX: United Arab Emirates",
                            Icons.location_on_outlined),
                        const SizedBox(height: 20),
                        _buildTextField(_passwordController, "Password",
                            "********", Icons.key_rounded),
                        const SizedBox(height: 20),
                        _buildTextField(_passwordConfirmController,
                            "Confirm Password", "********", Icons.key_outlined),
                        const SizedBox(height: 20),
                        UploadDocumentWidget(),
                        TermsAndConditionsWidget(),
                        const SizedBox(height: 20),
                        BlocConsumer<AuthnticationCubit, AuthnticationState>(
                          listener: (context, state) {
                            if (state.haveAccess || state.authData != null) {
                              BlocProvider.of<AppManagerCubit>(context)
                                  .saveUserDataInAppState(state.authData!);
                              context.go(RoutesPath.homeProvider,
                                  extra: BlocProvider.of<AuthnticationCubit>(
                                      context));
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () => _onSignUp(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(166, 77, 121, 1),
                                          Color.fromRGBO(225, 149, 171, 1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Text(
                                        'Sign Up'.tr(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const SignUpBottom(),
                                const SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }





  Widget _buildTextField(TextEditingController controller, String label,
      String hint, IconData icon) {
    return TextFormFieldWithTopText(
      controller: controller,
      topText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
    );
  }
}
