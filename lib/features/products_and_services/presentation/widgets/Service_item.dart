import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/features/products_and_services/models/service_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceDetails;
  const ServiceItem({super.key, required this.serviceDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.infinity,
            child: Image.network(
              serviceDetails.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/handleimageerror.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Text(serviceDetails.name.tr(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              Text(
            "Dubai",
            style: TextStyle(color: Colors.grey),
          ),
          Row(children: [
            Icon(Icons.location_on),
            Text("2 km away",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold),)
          ],),
           Row(children: [
            Icon(Icons.star_border),
            Text("4.5",style: TextStyle(color: Colors.grey),)
          ],),
       
        ],
      ),
    );
  }
}
