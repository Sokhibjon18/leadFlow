import 'dart:async';

import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key, required this.nextScreen});

  final Function() nextScreen;

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String clientSecret = '';
  // PaymentRepository repository = PaymentRepository();
  bool isSubscribeClicked = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // repository.getClientSecret(ScreenBuilder.subscriptionButton?.priceId ?? '').then((secret) {
    //   setState(() {
    //     clientSecret = secret;
    //   });
    // });
  }

  double calculatePriceDifference(String? oldPrice, String? newPrice) {
    if (oldPrice == null || newPrice == null) return 0;
    double oldAmount = double.parse(oldPrice.replaceAll('\$', ''));
    double newAmount = double.parse(newPrice.replaceAll('\$', ''));

    return oldAmount - newAmount;
  }

  listenUserStatus() {
    // timer = Timer.periodic(
    //   const Duration(seconds: 1),
    //   (tick) {
    //     repository.isUserSubscribed().then((status){
    //       if(status) {
    //         widget.nextScreen();
    //         timer?.cancel();
    //         FacebookPixel.track('Purchase');
    //         ScreenBuilder.subscriptionButton = null;
    //       }
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select payment method',
          style:
              TextStyle(fontSize: 22, fontWeight: FontWeight.w800, overflow: TextOverflow.ellipsis),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Text',
              // ScreenBuilder.subscriptionButton?.title ?? 'Error',
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Text(
              'text',
              // ScreenBuilder.subscriptionButton?.oldPrice ?? '\$0.00',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '50% introductory offer discount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.redAccent,
              ),
            ),
            const Spacer(),
            Text(
              '-20\$',
              // '-\$${calculatePriceDifference(
              //   ScreenBuilder.subscriptionButton?.oldPrice,
              //   ScreenBuilder.subscriptionButton?.price,
              // )}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total today:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              'Button',
              // '${ScreenBuilder.subscriptionButton?.price ?? 0.0}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '(50% off)',
              // 'You\'ve just saved -\$${calculatePriceDifference(
              //   ScreenBuilder.subscriptionButton?.oldPrice,
              //   ScreenBuilder.subscriptionButton?.price,
              // )} (50% off)',
              style: const TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ],
        ),
        if (clientSecret.isNotEmpty) ...[
          const SizedBox(height: 64),
          // PaymentElement(
          //   enablePostalCode: true,
          //   onCardChanged: (_) {},
          //   clientSecret: clientSecret,
          // ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 64,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onPressed: () async {
                // if (isSubscribeClicked) return;
                // try {
                //   setState(() => isSubscribeClicked = true);
                //   var paymentIntent = await WebStripe.instance
                //       .confirmPaymentElement(const ConfirmPaymentElementOptions(
                //     redirect: PaymentConfirmationRedirect.ifRequired,
                //     confirmParams: ConfirmPaymentParams(return_url: ''),
                //   ));
                //   if (paymentIntent.status != PaymentIntentsStatus.Succeeded) {
                //     context.showSnackBar(paymentIntent.status.name);
                //     setState(() => isSubscribeClicked = false);
                //   }
                //   listenUserStatus();
                // } on Exception catch (e) {
                //   context.showSnackBar(e.toString());
                // }
              },
              child:
                  isSubscribeClicked ? const CircularProgressIndicator() : const Text('Subscribe'),
            ),
          ),
        ]
      ],
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
