import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String link;
  final VoidCallback? onClose;

  const WebviewPage({Key? key, required this.link, this.onClose})
      : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  String title = 'IT Book Store';

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.1,
        title: Text(title),
      ),
      body: WebView(
        initialUrl: widget.link,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
              name: 'IT Book Store',
              onMessageReceived: (JavascriptMessage js) {
                if (js.message.startsWith('title=')) {
                  setState(() {
                    title = js.message.substring(6);
                  });
                }

                if (widget.onClose != null) {
                  widget.onClose!();
                }
              })
        },
      ),
    );
  }
}
