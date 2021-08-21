import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'accessibility_new_outlined',
                child: Center(child: Icon(Icons.accessibility_new_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'access_time_filled_outlined',
                child: Center(child: Icon(Icons.access_time_filled_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'shop_2_outlined',
                child: Center(child: Icon(Icons.shop_2_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'car_rental_outlined',
                child: Center(child: Icon(Icons.car_rental_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'holiday_village_outlined',
                child: Center(child: Icon(Icons.holiday_village_outlined)),
                width: 170,
              )
            ],
          )
        ],
      ),
    );
  }
}
