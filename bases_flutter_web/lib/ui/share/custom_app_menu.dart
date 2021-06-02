import 'package:bases_flutter_web/services/navigation_service.dart';
import 'package:bases_flutter_web/ui/share/custom_flat_button.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class CustomAppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) =>
          (constraints.maxWidth > 520) ? _TabletDesktopMenu() : _MobileMenu(),
    );
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Stateful Counter',
            //onPressed: () => Navigator.pushNamed(context, '/stateful'),
            //onPressed: () => navigationService.navigateTo('/stateful'),
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            text: 'Provider Counter',
            //onPressed: () => Navigator.pushNamed(context, '/provider'),
            //onPressed: () => navigationService.navigateTo('/provider'),
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            text: 'Other Page',
            //onPressed: () => Navigator.pushNamed(context, '/aaa'),
            //onPressed: () => navigationService.navigateTo('/aaa'),
            onPressed: () => locator<NavigationService>().navigateTo('/aaa'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            text: 'Stateful Counter',
            //onPressed: () => Navigator.pushNamed(context, '/stateful'),
            //onPressed: () => navigationService.navigateTo('/stateful'),
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            text: 'Provider Counter',
            //onPressed: () => Navigator.pushNamed(context, '/provider'),
            //onPressed: () => navigationService.navigateTo('/provider'),
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            text: 'Other Page',
            //onPressed: () => Navigator.pushNamed(context, '/aaa'),
            //onPressed: () => navigationService.navigateTo('/aaa'),
            onPressed: () => locator<NavigationService>().navigateTo('/aaa'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
