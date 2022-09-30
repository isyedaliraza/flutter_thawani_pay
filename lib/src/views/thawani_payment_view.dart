import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../repositories/repositories.dart';

class ThawaniPaymentView extends StatefulWidget {
  const ThawaniPaymentView({
    super.key,
    required this.thawaniRepository,
    required this.payload,
    this.onSuccess,
    this.onFailure,
  });

  final ThawaniRepository thawaniRepository;
  final Map<String, dynamic> payload;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  @override
  State<ThawaniPaymentView> createState() => _ThawaniPaymentViewState();
}

class _ThawaniPaymentViewState extends State<ThawaniPaymentView> {
  String _initialUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.thawaniRepository.createSession(payload: widget.payload).then(
      (url) {
        if (mounted) {
          setState(() {
            _initialUrl = url;
            _isLoading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return WebView(
      initialUrl: _initialUrl,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith(widget.payload['success_url']) &&
            widget.onSuccess != null) {
          widget.onSuccess!();
        }
        if (request.url.startsWith(widget.payload['cancel_url']) &&
            widget.onFailure != null) {
          widget.onFailure!();
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
