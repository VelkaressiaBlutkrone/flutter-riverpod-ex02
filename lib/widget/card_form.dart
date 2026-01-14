import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/model/card_item.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_button.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_drop_down.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_text_field.dart';

class CardForm extends StatefulWidget {
  final CardItem? initalCi;
  final VoidCallback? onCancel;
  final VoidCallback? onSubmit;
  final isReadOnly;

  const CardForm({
    super.key,
    this.initalCi,
    this.onCancel,
    required this.onSubmit,
    this.isReadOnly = false,
  });

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    late final _txtTitleController;
    late EditorState _editorState;

    @override
    void initState() {
      super.initState();
      _txtTitleController = TextEditingController(text: widget.initalCi?.title ?? '');
      _editorState = EditorState(document: Document.blank());
    }

    @override
    void dispose() {
      super.dispose();
      _txtTitleController.dispose();
    }

    Node paragraphNode({required String text}) => Node(
      type: ParagraphBlockKeys.type,
      attributes: {ParagraphBlockKeys.delta: Delta()..insert(text)},
    );

    Map<String, String> _category() => {
      'cate1': '업무',
      'cate2': '개인',
      'cate3': '교육',
      'cate4': '생활',
      'cate5': '건강',
      'cate6': '취미',
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                label: 'Title',
                hint: 'input title text...',
                controller: _txtTitleController,
                readOnly: widget.isReadOnly,
              ),
              const SizedBox(height: 10),
              CustomDropDown(
                items: _category(),
                label: 'Category',
                hint: 'select category...',
                enabled: widget.isReadOnly,
                initialValue: widget.initalCi?.category ?? '',
              ),
              const SizedBox(height: 10),
              SafeArea(
                child: SizedBox(
                  height: 300,
                  child: AppFlowyEditor(
                    editorState: _editorState,
                    editable: widget.isReadOnly,
                    editorStyle: EditorStyle(
                      cursorColor: Colors.blue,
                      padding: const EdgeInsets.all(10.0),
                      dragHandleColor: Colors.blue,
                      selectionColor: Colors.blue.shade300,
                      textStyleConfiguration: const TextStyleConfiguration(
                        text: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                      ),
                      textSpanDecorator:
                          (
                            BuildContext context,
                            Node node,
                            int index,
                            TextInsert text,
                            TextSpan? before,
                            TextSpan? after,
                          ) {
                            // 기본 텍스트 스타일 적용
                            final textSpan = TextSpan(
                              text: text.text,
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            );

                            // before와 after가 있으면 연결
                            if (before != null && after != null) {
                              return TextSpan(children: [before, textSpan, after]);
                            } else if (before != null) {
                              return TextSpan(children: [before, textSpan]);
                            } else if (after != null) {
                              return TextSpan(children: [textSpan, after]);
                            }

                            return textSpan;
                          },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (!widget.isReadOnly) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      style: CustomButtonStyle.secondary,
                      onPressed: () {},
                    ),
                    CustomButton(
                      text: 'Cancel',
                      style: CustomButtonStyle.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
