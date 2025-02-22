import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlCustom(String? url) async {
  if (url == null || url.isEmpty) {
    print("Error: URL is null or empty");
    return;
  }
  Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print("Error from launchUrl: $e");
    }
  } else {
    print("Could not launch URL: $url");
  }
}
