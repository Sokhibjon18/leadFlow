import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/success_view_params.dart';

class SuccessView extends StatelessWidget {
  final SuccessViewParams params;

  const SuccessView({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildInstructions(),
            const SizedBox(height: 24),
            _buildDownloadButton(),
            const SizedBox(height: 24),
            _buildSupportSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: AutoSizeText(
        'Just one more step!',
        maxLines: 1,
        minFontSize: 10,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          'It\'s time to download the app:',
          maxLines: 1,
          minFontSize: 10,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildStepText(['Click the button below to ', 'download the app'], [false, true]),
        _buildStepText(['Open the app and tap Sign in'], [false]),
        _buildStepText(['Enter email ', 'to get started'], [true, false]),
      ],
    );
  }

  Widget _buildStepText(List<String> texts, List<bool> isBold) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            for (int i = 0; i < texts.length; i++)
              TextSpan(
                text: texts[i],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold[i] ? FontWeight.bold : FontWeight.normal,
                ),
              ),
          ],
        ),
        minFontSize: 10,
        maxLines: 1,
      ),
    );
  }

  Widget _buildDownloadButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _launchDownloadUrl,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          // backgroundColor: params.buttonColor,
          padding: const EdgeInsets.symmetric(vertical: 26),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'Download',
          // 'Download ${params.appName}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _launchDownloadUrl() async {
    // final Uri url = Uri.parse(params.appUrl);
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   debugPrint('Could not launch $url');
    // }
  }

  Widget _buildSupportSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Having trouble logging in?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 16),
              children: [
                const TextSpan(text: 'Contact our friendly support team\n'),
                TextSpan(
                  text: 'support email',
                  // text: params.supportEmail,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _launchEmailClient,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmailClient() async {
    //   final Uri emailLaunchUri = Uri(
    //     scheme: 'mailto',
    //     path: params.supportEmail,
    //   );
    //   if (await canLaunchUrl(emailLaunchUri)) {
    //     await launchUrl(emailLaunchUri);
    //   } else {
    //     debugPrint('Could not launch $emailLaunchUri');
    //   }
  }
}
