import 'package:flutter/material.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/service_row_item.dart';

class ServicesPriceList extends StatefulWidget {
  @override
  _ServicesPriceListState createState() => _ServicesPriceListState();
}

class _ServicesPriceListState extends State<ServicesPriceList> {
  bool _isExpanded = false; // Controls the expansion state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), 
      child: Column(
        children: [
          Row(
            children: [
                 Expanded(
                   child: Text(
                    "Services Price",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                                   ),
                 ),
                
                    Text(
                      "\$36.9",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                    ),
               
              
            ],
          ),
          if (_isExpanded) 
            Column(
              children: [
                ServiceRowItem(serviceName: "Cut Hair", price: "1.3"),
                Divider(),
                ServiceRowItem(serviceName: "Nails",price:  "4.3"),
                Divider(),
                ServiceRowItem(serviceName: "Color",price: "3.3"),
                Divider(),
              ],
            ),
            SizedBox(height: 12),
            ServiceRowItem(serviceName: "Delivery price",price: "3",serviceStyle:TextStyle(fontWeight: FontWeight.w700, fontSize: 16,color: Colors.black),priceStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      )),
        
          SizedBox(height: 8),
                ServiceRowItem(serviceName: "Tax",price: "1.3",priceStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      ),serviceStyle:TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      ) ,),

           
          Divider(),
             ServiceRowItem(serviceName: "Total",price: "39.9",serviceStyle:TextStyle(fontWeight: FontWeight.w800, fontSize: 16,color: Colors.black),priceStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(30, 25, 24, 1),
                      )),

        ],
      ),
    );
  }


}

