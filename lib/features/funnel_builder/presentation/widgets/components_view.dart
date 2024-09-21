import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/commons/app_divider.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/data/models/text_view_params.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/multi_select_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/selection_item_view.dart';
import 'package:lead_flow/features/views/single_select_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addWidget(
          onTap: () {},
          child: ContinueButton(
            onPressed: () {},
            buttonParams: ButtonParams(Colors.white, Colors.black),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: ImageView(
            imageParams: ImageViewParams(
              imageLink: 'assets/images/example_1.jpeg',
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: InputView(
            inputViewParams: InputViewParams(
              hint: 'email',
              textColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const AppDivider(),
        // _addWidget(child: MultiSelectView(onSelect: (value) {})),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: PriceView(params: [
            SubscriptionButtonParams(
                'Elementary', '', '', '\$25', 'month', '', 'Foydali', true, 'FF1744'),
            SubscriptionButtonParams('Starter', '', '', '\$15', 'month', '', '', false, 'FF1744')
          ]),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const SelectionItemView(isCheckable: true),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: SingleSelectView(
            onSelect: (value) {},
            selectionParam: SelectionParams(
              selectionColor: Colors.redAccent,
              size: 16,
              textOptions: [
                '😊 Hello, how are you?',
                '✅ What is the plans?',
                '😜 Bye, see you?',
              ],
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: MultiSelectView(
            onSelect: (value) {},
            selectionParam: SelectionParams(
              selectionColor: Colors.redAccent,
              size: 16,
              textOptions: [
                '❤️ Bye, see you?',
                '🥾 What is the plans?',
                '🔥 Hello, how are you?',
              ],
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: SuccessView(
            params: SuccessViewParams(
              appName: 'Your app name',
              appUrl: 'https://mail.google.com/mail/u/0/#inbox',
              buttonColor: Colors.deepPurple,
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: TextView(params: TextViewParam(text: 'Text View')),
        ),
        const AppDivider(),
      ],
    );
  }

  Widget _addWidget({void Function()? onTap, required Widget child}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: child),
      ],
    );
  }
}
