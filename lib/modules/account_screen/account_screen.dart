import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton {
  final String phoneNumber;
  final String message;

  WhatsAppButton({required this.phoneNumber, required this.message});

  Future<void> launchWhatsApp() async {
    String encodedMessage = Uri.encodeFull(message);
    String url = "whatsapp://send?phone=$phoneNumber&text=$encodedMessage";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
