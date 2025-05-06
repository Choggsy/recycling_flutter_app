import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class InvolvementPage extends StatelessWidget {
  const InvolvementPage({super.key});

  final String imageUrl = 'https://images.unsplash.com/photo-1620676524838-7017c424120e?q=80&w=1954&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'; // Copyright free image site
  final String email = 's5416604@bournemouth.ac.uk';

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Recycling App Contribution'),
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Involvement Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    const TextSpan(
                      text: 'Are You Passionate About Recycling? ♻️\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const TextSpan(
                      text:
                      'Do you know a hidden gem of a recycling point in your neighborhood? Want to help others recycle smarter and conveniently?\n\n'
                          'This is the start of a community-powered recycling app, and ',
                    ),
                    const TextSpan(
                      text: 'we need YOU!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text:
                      ' If you’d like to contribute by submitting a recycling point near you, we’d love to hear from you.\n\n',
                    ),
                    TextSpan(
                      text: 'Email at $email',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _launchEmail,
                    ),
                    const TextSpan(
                      text: ' to learn more and get involved!\n\nLet’s make recycling easier, together. 💚',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
