import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', showActionButton: true, actionText: 'Change', onPressed: () {},),
        Text('Paula Angela', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.sm,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+63 995 965 2206', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.sm,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Bonuan Binloc, Dagupan', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ],
    );
  }
}
