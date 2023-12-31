import 'package:bundtask/data/models/CompanyModels.dart';

import 'models/BondsModel.dart';

abstract class DummyData{


  static  List<Company> dummyCompanies = [
  Company(
    name: "bünd",
    category: "Standard",
    image: "assets/images/image 19.png",
    conditions: [
      Condition(
          text: "No Minimum Deposit", image: "assets/images/withdraw.png"),
      Condition(
          text: "\$15/Month (Paid Annually)", image: "assets/images/bank.png"),
    ],
    whatYouGet: [
      WhatYouGet(
        text: "Swiss Bank Account",
        image: "assets/images/bank.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Mastercard Prepaid",
        image: "assets/images/mastercard.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Account Open Same Day",
        image: "assets/images/flash.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Protected up to \$100,000",
        image: "assets/images/umbrella.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Investments Portfolios",
        image: "assets/images/Vector.png",
        isEnabled: false,
      ),
      WhatYouGet(
        text: "Deposits Options",
        image: "assets/images/vault 1.png",
        isEnabled: false,
      ),
    ],
  ),
  Company(
    name: "bünd",
    category: "Plus",
    image: "assets/images/Group.png",
    conditions: [
      Condition(
          text: "\$10,000 Minimum", image: "assets/images/withdraw.png"),
      Condition(
          text: "\$30/Month (Paid Annually)", image: "assets/images/bank.png"),
    ],
    whatYouGet: [
      WhatYouGet(
        text: "Swiss Bank Account",
        image: "assets/images/bank.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Mastercard Prepaid",
        image: "assets/images/mastercard.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Protected up to \$100,000",
        image: "assets/images/umbrella.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Investments Portfolios",
        image: "assets/images/Vector.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Deposits Options",
        image: "assets/images/vault 1.png",
        isEnabled: true,
      ),
    ],
  ),
  Company(
    name: "bünd",
    category: "Max",
    image: "assets/images/ubs-logo-svg 1.png",
    conditions: [
      Condition(
          text: "\$50,000 Minimum", image: "assets/images/withdraw.png"),
      Condition(
          text: "\$200/Month (Paid Annually)", image: "assets/images/bank.png"),
    ],
    whatYouGet: [
      WhatYouGet(
        text: "Swiss Bank Account",
        image: "assets/images/bank.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Mastercard Prepaid",
        image: "assets/images/mastercard.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Protected up to \$100,000",
        image: "assets/images/umbrella.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Investments Portfolios",
        image: "assets/images/Vector.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Deposits Options",
        image: "assets/images/vault 1.png",
        isEnabled: true,
      ),
    ],
  ),
  Company(
    name: "bünd",
    category: "Unlimited",
    image: "assets/images/ubs-logo-svg 1.png",
    conditions: [
      Condition(
          text: "\$500,000 Minimum", image: "assets/images/withdraw.png"),
      Condition(
          text: "No Monthly Subscription", image: "assets/images/bank.png"),
    ],
    whatYouGet: [
      WhatYouGet(
        text: "Swiss Bank Account",
        image: "assets/images/bank.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Mastercard Prepaid",
        image: "assets/images/mastercard.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Protected up to \$100,000",
        image: "assets/images/umbrella.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Investments Portfolios",
        image: "assets/images/Vector.png",
        isEnabled: true,
      ),
      WhatYouGet(
        text: "Deposits Options",
        image: "assets/images/vault 1.png",
        isEnabled: true,
      ),
    ],
  ),
];

  static List<Bond> dummyBonds = [
    Bond(
      image: "assets/images/image 13.png",
      title: "Netflix INC",
      subTitle: "BBB",
      data: "5.37% APY",
    ),
    Bond(
      image: "assets/images/image 14.png",
      title: "Apple INC",
      subTitle: "BB+",
      data: "7.71% APY",
    ),
    Bond(
      image: "assets/images/image 15.png",
      title: "Ford Motor LLC",
      subTitle: "AA+",
      data: "4.85% APY",
    ),
    Bond(
      image: "assets/images/Intersect.png",
      title: "Morgan Stanley",
      subTitle: "A-",
      data: "6.27% APY",
    ),
  ];


}
