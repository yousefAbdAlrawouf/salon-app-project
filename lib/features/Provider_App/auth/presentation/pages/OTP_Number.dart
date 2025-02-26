import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/core/widgets/GradientAppBar.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';

class OTPNumberConfirm extends StatefulWidget {
  final String? phoneNumber;
  const OTPNumberConfirm({super.key, this.phoneNumber});

  @override
  State<OTPNumberConfirm> createState() => _OTPNumberConfirmState();
}

class _OTPNumberConfirmState extends State<OTPNumberConfirm> {
  late List<TextEditingController> codeControllers;
  int remainingTime = 60;
  bool isResendEnabled = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    codeControllers = List.generate(4, (_) => TextEditingController());
    startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() => remainingTime--);
      } else {
        setState(() => isResendEnabled = true);
        _timer?.cancel();
      }
    });
  }

  void resendCode() {
    if (isResendEnabled) {
      setState(() {
        remainingTime = 60;
        isResendEnabled = false;
      });
      startCountdown();
    }
  }

  String getOTPCode() => codeControllers.map((c) => c.text).join();

  void verifyOTP(BuildContext context) {
    final otpCode = getOTPCode();
    context.go(RoutesPath.changePassword, extra: {
      'code': otpCode,
      'phoneNumber': widget.phoneNumber,
    });
    context.read<AuthnticationCubit>().verifyCode(widget.phoneNumber ?? "", otpCode, "0");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthnticationCubit(getInstance<AuthRemoteDataSource>()),
      child: Builder(builder: (ctx) {
        return GradientBackgroundScaffold(
          appBar: GradientAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildLogoSection(),
                _buildOTPForm(context),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildLogoSection() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: Text("Logo", style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildOTPForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 43),
          Text("OTP Number".tr(),
        style: TextStyle(fontSize: 45, color: Color.fromRGBO(56, 56, 56, 1), fontFamily: "Meditative")),
          _buildInstructionText(),
          const SizedBox(height: 32),
          _buildOTPInputFields(),
          const SizedBox(height: 40),
          _buildConfirmButton(context),
          const SizedBox(height: 20),
          _buildResendTimer(),
          const SizedBox(height: 20),
          _buildResendLink(),
        ]),
      ),
    );
  }



  Widget _buildInstructionText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Color.fromRGBO(81, 81, 81, 1), fontSize: 20, fontWeight: FontWeight.w500),
        children: [
          const TextSpan(text: "Enter the Code Sent to "),
          TextSpan(
            text: widget.phoneNumber ?? "",
            style: const TextStyle(color: Color.fromRGBO(166, 77, 121, 1), decoration: TextDecoration.underline),
          ),
          const TextSpan(text: " to Continue Log in Registration"),
        ],
      ),
    );
  }

  Widget _buildOTPInputFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: TextFormField(
              controller: codeControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: codeControllers[index].text.isNotEmpty
                  ?  Color.fromRGBO(241, 241, 241, 1) 
                  : Colors.white,
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return GestureDetector(
      onTap: () => verifyOTP(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            colors: [Color.fromRGBO(166, 77, 121, 1), Color.fromRGBO(225, 149, 171, 1)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(child: Text("Confirm".tr(), style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }

  Widget _buildResendTimer() {
    return Center(
      child: Text(
        isResendEnabled ? "" : "${getFormattedTime(remainingTime)} second",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: isResendEnabled ? Colors.pink : Colors.black,fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _buildResendLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Color.fromRGBO(102, 102, 102, 1), fontWeight: FontWeight.w700),
          children: [
            const TextSpan(text: "Didn't receive a Code? "),
            TextSpan(
              text: "Resend Code",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                color: isResendEnabled ?  Color.fromRGBO(166, 77, 121, 1) : Colors.grey ,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => resendCode(),
            ),
          ],
        ),
      ),
    );
  }

  String getFormattedTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$remainingSeconds";
  }
}
