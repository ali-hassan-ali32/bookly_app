import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Future<void> customUrlLauncher(context,String? url) async {
  if(url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Can Not Launch $url'))
      );
    }
  }
}