import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;


void main() => runApp(HtmlEditorExampleApp());

class HtmlEditorExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      darkTheme: ThemeData.light(),
      home: HtmlEditorExample(title: 'Flutter HTML Editor Example'),
    );
  }
}

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  int redoUndoCount = 0;
  int mainRedoUndoCount = 0;
  bool isRedoUndoDisable = true;
  final HtmlEditorController controller = HtmlEditorController();
  bool _isControlPressed = false;
  bool callContentChange = true;
  String changedContent = '';

  // @override
  // void initState() {
  //   super.initState();
  //   js.context['handlePasteEvent'] = handlePasteEvent;
  //   injectPasteHandler();
  // }
  //
  // void injectPasteHandler() {
  //   js.context.callMethod('eval', ["""
  //     document.addEventListener('paste', async function(event) {
  //       if (event.clipboardData && event.clipboardData.getData) {
  //         event.stopPropagation();
  //         event.preventDefault();
  //         let html = event.clipboardData.getData('text/html');
  //         if (html) {
  //           html = await handlePasteEvent(html);
  //           let selection = window.getSelection();
  //           if (!selection.rangeCount) return false;
  //           selection.deleteFromDocument();
  //           let range = selection.getRangeAt(0);
  //           let node = document.createElement('div');
  //           node.innerHTML = html;
  //           let frag = document.createDocumentFragment(), child;
  //           while ((child = node.firstChild)) {
  //             frag.appendChild(child);
  //           }
  //           range.insertNode(frag);
  //         }
  //       }
  //     });
  //   """]);
  // }
  //
  // Future<String> handlePasteEvent(String html) async {
  //   RegExp liRegex = RegExp(r'<li[^>]*>(.*?)</li>', dotAll: true);
  //   RegExp olRegex = RegExp(r'<ol[^>]*>(.*?)</ol>', dotAll: true);
  //
  //   String modifiedHtmlString = html
  //       .replaceAllMapped(liRegex, (Match match) => match.group(1) ?? '')
  //       .replaceAllMapped(olRegex, (Match match) => match.group(1) ?? '');
  //
  //   return modifiedHtmlString;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWidget(
            controller: controller,
            htmlToolbarOptions: HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.custom,
              //by default
              toolbarType: ToolbarType.nativeGrid,
              //by default
              onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
                if (kDebugMode) {
                  // print("button '${describeEnum(type)}' pressed, the current selected status is $status");
                }
                return true;
              },
              onDropdownChanged: (DropdownType type, dynamic changed, Function(dynamic)? updateSelectedItem) {
                if (kDebugMode) {
                  // print("dropdown '${describeEnum(type)}' changed to $changed");
                }
                return true;
              },
              mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                if (kDebugMode) {
                  print(url);
                }
                return true;
              },
              defaultToolbarButtons: [
                const FontButtons(subscript: false, superscript: false, clearAll: false, strikethrough: false),
                const InsertButtons(picture: false, audio: false, video: false, otherFile: false, table: false, hr: false),
                const OtherButtons(fullscreen: false, codeview: false, help: false),
              ],
              // disableUndo: redoUndoCount == 0,
              disableUndo: isRedoUndoDisable,
              onUndo: () {
                setState(() {
                  if (redoUndoCount > 0) {
                    redoUndoCount--;
                  }
                });
              },
              // disableRedo: redoUndoCount == mainRedoUndoCount,
              disableRedo: isRedoUndoDisable,
              onRedo: () {
                setState(() {
                  if (redoUndoCount <= mainRedoUndoCount) {
                    redoUndoCount++;
                  }
                });
              },
              attributeDropDown: CustomDropdownButtonHideUnderline(
                child: CustomDropdownButton<String>(
                  iconSize: 32,
                  icon: Text("{...}"),
                  menuDirection: DropdownMenuDirection.down,
                  items: [
                    ...['companyName', 'companyLogo'].map((e) {
                      return CustomDropdownMenuItem(
                        value: e,
                        child: Text(e, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      );
                    })
                  ],
                  onChanged: (String? changed) async {
                    if (changed != null) {
                      controller.insertHtml(
                          '''<input type="button" value="$changed" style="background-color:red; color:white" disable>''');
                      // controller.insertHtml('''<button>$changed</button>&nbsp;''');
                      if(isRedoUndoDisable) {
                        setState(() {
                          isRedoUndoDisable = false;
                        });
                      }
                    }
                  },
                ),
              ),
            ),
            callbacks: null,
          ),
          Container(
            color: Colors.grey,
            height: 1,
            width: double.infinity,
          ),
          HtmlEditor(
            controller: controller,
            htmlEditorOptions: HtmlEditorOptions(
              hint: 'Your text here...',
              // initialText: '''<input type="button" value="test" style="background-color:red; color:white" disable>'''
            ),
            htmlToolbarOptions: const HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.custom,
            ),
            otherOptions: OtherOptions(height: MediaQuery.of(context).size.height - 230),
            callbacks: Callbacks(
              onChangeContent: (String? changed) {
                debugPrint('content changed to $changed');
                // if(changed != null) {
                //   debugPrint('Outside If $changed, ${changed.length}, ${changedContent.length}');
                //   if(changed.length+1 >= changedContent.length) {
                //     debugPrint('Inside If $changed, ${changed.length}, ${changedContent.length}');
                //     changedContent = changed ?? '';
                //   }
                // }
                // if (changed != null) {
                //   String filter = filterButtonTags(changed, ['companyName', 'companyLogo']);
                //   if (filter != changed) {
                //     controller.clear();
                //     controller.insertHtml(filter);
                //   }
                // }
                // setState(() {
                  // if (redoUndoCount == mainRedoUndoCount) {
                  //   redoUndoCount++;
                  // }
                  // mainRedoUndoCount++;
                  // isRedoUndoDisable = false;
                // });
              },
              onKeyDown: (index) {
                debugPrint('index: $index');
                // if (index == 8) {
                //   callContentChange = false;
                //   String filter = filterButtonTags(changedContent, ['companyName', 'companyLogo']);
                //   if (filter != changedContent) {
                //     controller.clear();
                //     controller.insertHtml(filter);
                //   }
                // }
                if(isRedoUndoDisable) {
                  setState(() {
                    isRedoUndoDisable = false;
                  });
                }
              }
              // onKeyDown: (index) async {
              //   if (!_isControlPressed) {
              //     _isControlPressed = index == 91;
              //   }
              //   if ((_isControlPressed && index == 86)) {
              //     final clipboardData = await RichClipboard.getData();
              //     if (clipboardData.html != null) {
              //       debugPrint('Inside If');
              //       // Define the regular expressions to match the <li> and <ol> tags
              //       RegExp liRegex = RegExp(r'<li[^>]*>(.*?)</li>', dotAll: true);
              //       RegExp olRegex = RegExp(r'<ol[^>]*>(.*?)</ol>', dotAll: true);
              //
              //       // Replace the <li> and <ol> tags with an empty string
              //       String modifiedHtmlString = clipboardData.html
              //           !.replaceAllMapped(liRegex, (Match match) => match.group(1) ?? '')
              //           .replaceAllMapped(olRegex, (Match match) => match.group(1) ?? '');
              //
              //       // print('modifiedHtmlString: $modifiedHtmlString');
              //       // String modifiedText = clipboardData.text!.toLowerCase();
              //       // await RichClipboard.setData(RichClipboardData(
              //       //     html: modifiedHtmlString
              //       // ));
              //       Future.microtask(() {
              //         _isControlPressed = false;
              //         controller.insertHtml(modifiedHtmlString);
              //       });
              //     }
              //   }
              // }
            ),
          )
        ],
      ),
    );
  }

  String filterButtonTags(String htmlString, List<String> attributeList) {
    debugPrint('htmlString: $htmlString');
    // Parse the HTML string
    dom.Document document = html_parser.parse(htmlString);

    // Find all <button> tags
    List<dom.Element> buttonElements = document.querySelectorAll('button');

    for (var button in buttonElements) {
      // Get the text content of the button
      String buttonText = button.text.trim();

      // Check if the button text is in the attributeList
      if (!attributeList.contains(buttonText)) {
        // Remove the <button> tag if the text is not in the attributeList
        button.remove();
      }
    }

    // Return the modified HTML string
    debugPrint('document.body?.outerHtml: ${document.body?.outerHtml}');
    return document.body?.outerHtml ?? '';
  }

}
