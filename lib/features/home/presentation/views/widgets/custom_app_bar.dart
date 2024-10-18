import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
      child: Row(
        children: [
          Image.asset(AssetsProvider.logo,height: 20,),
          const Spacer(),
          IconButton(
            onPressed: () => GoRouter.of(context).push(AppRouter.kSearchViewRoute),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 24,)
          )
        ],
      ),
    );
  }
}
