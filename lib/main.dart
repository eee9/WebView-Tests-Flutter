import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(new MyApp());

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Html()));
  }
}

class Html extends StatefulWidget {
  LoadHtml createState() => LoadHtml();
}

class LoadHtml extends State<Html> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('r01, L27. HTML Code in Flutter')),
      body: WebviewScaffold(
        url: new Uri.dataFromString(html, mimeType: 'text/html').toString(),
      ),
    );
  }
}

String str3() => 'Str 323.';

String lines(int qual, [int from = 1]) {
  String res = '';
  int to = from + qual;
  for (int i = from; i <= to; i++) {
    res += i.toString() + "th line added.<br/>";
  }
  return res;
}

String html = '' +
    '<script>' +
    '  function _setCounter(val) {' +
    '    var counter_tag = document.getElementById("counter_tag");' +
    '    counter_tag.innerHTML = val;' +
    '  }' +
    '  function _onBScroll() {' +
    '    var body_tag = document.getElementById("body_tag");' +
    '    _setCounter(body_tag.scrollTop);' +
    '  }' +
    '  function _gotoPos1(pos) {' +
    '    window.scrollTo(0, pos);' +
    '  }' +
    '  function _gotoPos2(pos) {' +
    '    var body_tag = document.getElementById("body_tag");' +
    '    if (body_tag.scrollTo == undefined) {' +
    '      alert(\'No new scrollTo !\');' +
    '    } else { body_tag.scrollTo({top: pos}); }' +
    '  }' +
    '</script>' +
    '<body id="body_tag" style="background-color:lightgreen" onscroll="_onBScroll();" >' +
    '<button onclick="_setCounter(77); alert(22);">Test1</button><br/>' +
    lines(15) +
    '<hr/><div id="counter_tag" style="font-size:22px; color:red;">0</div>' +
    '<button onclick="_gotoPos1(221);">Go to 221...</button>&nbsp;&nbsp;&nbsp;&nbsp;' +
    '<button onclick="_gotoPos2(122);">Go to 122...</button><hr/>' +
    lines(25, 101) +
    '<p> Sample Paragraph Tag </p>' +
    '</body>' +
    '';
