import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/available_for_work_section.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/client_appointment_section.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/product_metrices_dashboard_section.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/rating_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit,AppManagerState>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.greyColor,
            leading: CircleAvatar(child: Image.network(state.authResponseModel?.user.image ?? "",height: 27,width: 27,)),
            title: Text(state.authResponseModel?.user.name ?? "" ,style: TextStyle(color: Colors.black,fontFamily: "Meditative",fontWeight: FontWeight.w400,fontSize: 20), ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Location",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [Text(state.authResponseModel?.user.email ?? ""), Icon(Icons.arrow_downward)],
                  )
                ],
              ),
              Icon(
                Icons.notifications_none,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width / 80,
                right: MediaQuery.sizeOf(context).width / 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height / 80),
                  AvailableForWorkSection(),
                  ClientAppointmentSection(),
                  Divider(thickness: 2),
                  ProductMetricesDashboardSection(),
                  Divider(thickness: 2),
                  RatingSection(),
                  SizedBox(height: 50)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
