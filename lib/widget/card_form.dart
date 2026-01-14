import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/model/card_item.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_button.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_drop_down.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_text_field.dart';
import 'package:flutter/foundation.dart';

class CardForm extends StatefulWidget {
  final CardItem? initalCi;
  final VoidCallback? onCancel;
  final VoidCallback? onSubmit;
  final bool isReadOnly;

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
  late final TextEditingController _txtTitleController;
  late final EditorState _editorState;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _txtTitleController = TextEditingController(text: widget.initalCi?.title ?? '');
    _editorState = EditorState.blank(withInitialText: true);
  }

  @override
  void dispose() {
    _txtTitleController.dispose();
    _editorState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final targetPlatform = defaultTargetPlatform;
    final bool isMobile =
        targetPlatform == TargetPlatform.android || targetPlatform == TargetPlatform.iOS;

    const textStyleConfig = TextStyleConfiguration(
      text: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
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
                enabled: !widget.isReadOnly,
                initialValue: widget.initalCi?.category,
              ),
              const SizedBox(height: 10),
              SafeArea(
                child: Container(
                  height: 300,
                  // 시각적 디버깅을 위해 테두리 추가
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppFlowyEditor(
                    editorState: _editorState,
                    editable: !widget.isReadOnly,
                    editorStyle: EditorStyle.desktop(
                      cursorColor: Colors.blue,

                      selectionColor: Colors.blue.shade300,
                      padding: const EdgeInsets.all(10.0),
                      textStyleConfiguration: textStyleConfig, // 공통 스타일 적용
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
                    const SizedBox(width: 20),
                    CustomButton(
                      text: 'Add',
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
