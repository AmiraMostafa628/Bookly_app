import 'package:bookly_app/core/utils/function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future <void> launchCustomUrl(context,String? urlAccess)
async {
  if(urlAccess != null)
    {
      final Uri url = Uri.parse(urlAccess);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
      else
      {
        customSnackBar(context, 'cannot launch $urlAccess');
      }
    }
}

