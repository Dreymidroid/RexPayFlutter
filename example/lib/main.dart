import 'package:flutter/material.dart';
import 'package:randomstring_dart/randomstring_dart.dart';
import 'package:rexpay/rexpay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RexPay Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String rexpayPublicKey =
      "-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: Keybase OpenPGP v1.0.0\nComment: https:\/\/keybase.io\/crypto\n\nxo0EYKuUZgEEAJ3DqHrrgHXrvdLeJo538tT7Pml+VQjW\/fOwHKGHNzQ6Yf+EMpt8\nNTSxU2Pu6QjvxGNqEU+5Ejix8Mf57Iyn+Jlhk5nLG4rR\/z390wBwyLZzFhgsYKif\n5hdKpdg0+CEInp8hwFQyKcH99SDFRhvs6KBB\/iHearkCIrwEYKOtn4M5ABEBAAHN\nJ0FkZWJheW8gQWRlbml5YW4gPGFkZWJlc2xpY2tAZ21haWwuY29tPsKtBBMBCgAX\nBQJgq5RmAhsvAwsJBwMVCggCHgECF4AACgkQlaZA9sBWJb95nAP\/SiHrax4LSR6b\n9aWuzCKwb2URR+DIU9sZMSBhVn2ff8i2JzOEn9IjALJU7pIGPhuf9Dj4iAmOjEts\naM9uggnd5LwUEa3zmRcV+8pqez1e09DJNp437VfFpDU2uzjTX4JSQP2J7L73+lOX\nkfcYoxKCsOXuz77iHXUA2BVE7LiBtILOjQRgq5RmAQQAuzdGaE4FR4IaDp1EhQlX\n8xFJrfawWWGsEi5IIgwzujWtUiZd379pguAMe0j9Mo2KaMNVHSkMu6GtgEmtbka7\nIJ\/MEFmb68cx\/FH0YPNSRhOjJglbun0\/P9ohbIDoNtCrDoscbWKiP3X0UGa5wpul\ncJ3nhQXgtSuYzf58DbzdIjsAEQEAAcLAgwQYAQoADwUCYKuUZgUJDwmcAAIbLgCo\nCRCVpkD2wFYlv50gBBkBCgAGBQJgq5RmAAoJEGzORcMDtTyGFbMEAJayRvgeVs4K\nY9Eg2\/gU3x7ZXiIp2s09pTp2CXJSsrj3wfFfzY\/mB9At2BDQd0Infv2MMI5PaPDc\n1xTxSCvlEEwqrpMDU0NjjX7bWScmbY3VRf6QLNXw2YbIpd8leSYjxYLdW2IFXM6Z\n1JOgYo6J8Z+51SsFEer3Q4Qq8TNj0G0HbOcD\/19RojnSDYXXdcXzo7z+xVd47I0B\nH9Zeik8DXmw4M1ZxPvhgBOwyBvDFZNIc0FFlfJ7miA6tn4mzXFbInRo9nI4Mahug\n5JF2jzHP2tKBrco+EChJ1FuoXN9fZ1jvtIfCpsUnfFj+ws5EeutMk0lp830i3QCP\nxkoa5yM+1f3C6jAazo0EYKuUZgEEAMo518czkUlqSUjfNEVJy2NMwWtDKo2Lr8av\nTGkrFdhJoQC2Jy55LFZtrQ3oJX+6iNgmb7cHG83nbJ1DVEaJ+kZoSA4f4OfULsKW\nctU6fU+r8PAlis3n7RzQUbHMBdulDOwgPM5G1grBlci19i1QbzjlIOW\/aMp1znkf\n6tw90zVXABEBAAHCwIMEGAEKAA8FAmCrlGYFCQ8JnAACGy4AqAkQlaZA9sBWJb+d\nIAQZAQoABgUCYKuUZgAKCRBP1RVoKGjtdmyFA\/9\/Nxzl349Nmu3gLV+6B7ybk\/av\n5m41vIcjwqWX1LuoZVp7CwnlSKHkTiThBDs7wBt7Zx1A0qLEc0ibkjAKG67ZimLX\noaBh0jLkVgvb\/ptQl\/lI2Vb+yRfWigWlF8BES89Qr2CnjBbUrO+8T6YVw4311B1E\n0iGZIvPJa5eRKrZFwyYkBACIucDHDP9Kfca1EUKX2jDucjLP79XXzyZiRvXXvR4E\nAYHEW6lIMLDxD7ie1TEJzVfZYUHRgcXaZeAHk0dSoMQnm3pF2un7KZEA6AjmdU5A\n\/e9yzVX1Lw6l+BkYeovhFswz+r4A65pDIUOGJ1UXUGEaeAzvTYSlrcPcmQYVcL4k\n4g==\n=6uW\/\n-----END PGP PUBLIC KEY BLOCK-----";

  var publicKey =
      "-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: Keybase OpenPGP v2.0.76\nComment: https:\/\/keybase.io\/crypto\n\nxsBNBGW+bHQBCADlCkdoGghiYXWy59CkM\/6YtoDKuibOO3igONcDY1FfBcKv+jLh\nkvXhXeHQoSJhroDZ0ls\/8Gr3OAeoaoGrqwuCbrGBEvtWZAVyXr8e5oLBSvzSZafe\n54zeJDK26ZMJCFAlc8IEliavrPrK6KJ8A67ZZ2WwQ37zulY91d5GzIbCL6O6RFl5\nMihVjUzZ9726rcJrDtkWduTLjNieopWShu2aNpJouLw4KaoINurK30TO3F5ETD8R\ngOEI2n76RtXpqfIs3\/pQIhgeblVLaS5+0vyQVQ9g834w0HFdktpny2ALnmwitWO1\nd0RvFO5w6ykY9JNmgPT7tWoNVBZaxaBj9Wg9ABEBAAHNKEJhYmF0dW5kZSA8YWJk\ndWxsYWhpamltb2gzLmphQGdtYWlsLmNvbT7CwHoEEwEKACQFAmW+bHQCGy8DCwkH\nAxUKCAIeAQIXgAMWAgECGQEFCQAAAAAACgkQ4MlUleFClPq5bgf9GcI0ImMgrifH\n6GCiF2xSLfmRpfzupqe0p32YUr7Dw7GxFB+VC1eyaGi6JZ1HZxr7mgQa4ZzrOKQK\nVzuLBuydueUBLH3ZDqZUoxrl43wBsPdNaLq1ANYOcLM+nEozd9iUhK1ggZzHl3u7\nNx6lLXV8q3qt42+rrz5r7L33JnSWKXokBBGzHUJNJzqjU7\/hXD5gFIimp4ozH4su\n6fVptU9u\/rwm0CPg96BiFzUm9nnzvWxBut6ZtlMkpa8oYTz7lPwfwM+vRJDDGm18\nPElPIVNS02nOXG9gDf2ItQmc+RNVH3YOs3812oyhio2YNjT1RYv5s5SYIVuJfNJd\nO\/9uJ5VxFc7ATQRlvmx0AQgAtQK4QqGE1dyjQDiI4VBMaCIB9O9OO9sQHq0elIFF\n85Pn2gfijxTmGG7SJHZle08Mc\/MgQxj9yAqFvsff7VS6GFxb\/EABdJ\/YN1wEco76\ns7pw8+jpZPQhJBastZitSLvWO3KWUj6YcFcc7YnsJ3h4VZ1FyNqMMBOZvEmOHruG\nNY0MXOmexMfoEexREbNviBWvPm66baWz9w4ukjxIWkLtevIQeTUqkL5fzi4QZEIe\n+KXuxt3Cdlclj6Evdro25QnbuxcsdqYVG5R652tShLS6GTVtiWNwu2lt56gnx6Jf\nPWJC+drYFv2liGrxzMbPioKd+0LIoLJliH07kWMHLhhXYQARAQABwsGEBBgBCgAP\nBQJlvmx0BQkAAAAAAhsuASkJEODJVJXhQpT6wF0gBBkBCgAGBQJlvmx0AAoJELwc\nb75ys8s36UsH\/Ro52EnjYj8AvMuHV7sonrW0FGldgZFPZjk637mMrd7LIRaSPD36\nq4lFXy6fim8Eak5F55q2\/woj+fqI++IPGYYKsto9VlZ2M8GQXTv1EKfZWoWIQOyH\nAnzWBSMlXwLUdjamB6TsmvBJZ5ggGxC9+tKEoF15AHd+UX6B6jd0dPz9uAGhjXUV\nSBj66OYj2jk2Ay\/7EUcgPa5uWWNQRMEbDx02PuoX\/d0Vr\/pU4\/q0s+Mw8QViT+ZQ\nnqzHsvH3NN0\/OsYqBAcv\/OtycS0odaKnfoskDMNNbgUbPLRbqkfVPBIXsC+1tz0f\nCWHP8EsntCj5xjOUpRoPjln5IssJPGFY9fuRcwf\/QriRa\/kjXvVakU\/akXjVwIfr\nDsAU4CzLnGIb+Tz0BEiZUUdsWi6X++jMd7T4ZUnKPwrSdjEpVEuX1wJ6YWemQ5nY\n\/B2asRTChGwR4yztJESO2vYqPjpyC8b7VIvWaAgKw4I5Gq8wG+tmoBABR1HupZAB\noX7DpHmXTH9mlPwv\/CDCIjBVtSAEEdoWaFsMjjzixC5orb60yWQ2W7Y9JxV5E6T1\nd5V5XNLY6QGLf9qAZrxDWmJADe4cufdrz3IErIXuoZ6vMB5Xx4zfuIdz99lEOO9S\nWvfJKW0W0CRJQC5Gt339e8cCw4PLVaLQ9lGsFZX169f\/78Bc7uGB+5AkD5fEac7A\nTQRlvmx0AQgAnGYQ9uby8okzLc40sLCbM9xOmvLPRe4bvQGtt1+VgLOEZkKaXCb9\n5OikyW1Eq1Twl4NWg0pgSXqN4RA4raR+RyoAtFrLiOVnnsDc5bDP3mbK+elkQj\/0\nIy8Ly7WPamI9u1NuM+7gQRNS4+edLUNu\/+ha\/uu0v4xWVtUlF9Lz816Ofyc3cy7A\ntWwUnMqc93Y97Z1nP+T\/kgp1nLs4mGhJ3Eq+BUx9+HHyXL8KTq9Dtva3P0XCJGcL\nhs1ksRfHIzFxnEtKG0hzKAtWYM7D2Tt2cSmg7d\/7Hb7IuYAAZVE1JyyCbSVrUAhQ\nqCfR19c3HHPItnX0XxrMZdNtXFx00CHCOQARAQABwsGEBBgBCgAPBQJlvmx0BQkA\nAAAAAhsuASkJEODJVJXhQpT6wF0gBBkBCgAGBQJlvmx0AAoJEEuul7Yse7pm4NwH\n+gLdnvt23skooYMgobVnWw3nxW5OcQ0UKnYxUVhjRUZBL9pJAAErWO+ArLh8Kx66\nld1iN4lP5DbLfjb2J6jNZ0NZk2rh7gw1kjKVYlJ9sPt9A++ZqmS03vaxO9IfJJYW\nMW5bRJQNcj7tCo+TvzZX7yrvs+i1K5v4EoVuNc6xD5y\/GKnNG9wvnrd6Sc80U5i4\nBQ3Kg+k++5D\/yH6Gb7Y5TUtVm9v85sSaxh4Jupk2NcimQRV6tNwuyFt2oOfdG3sJ\nLVi+4lCF+jj2RTE7suF+n8lA26sx7OEMXVDKzlkAmrH7CUNKTvq4hZ1nZyd9Av1y\nY0TBBeQ2uGPYCnDBMf2yz51lmAf6A4kbvXjCOb3JfAnsLfcgyE3sfA\/1zlpD1j8W\nRwkGA0nnTv7l136iSq3xHrCr7HURY9TS5hM70LImPOFn3t2MstIav8ghkPB+MGT8\nQ7fXaMlO8IWeeNM1zwSOFpjhbl8nqwkGM2d2MmE4IZTwT0h+Noj9Jq\/ImmIJ66DW\nKTZ4+2R2da3TdKKwPj5DgZl6fgflpY3vklqVmt9Sr+YMoui4++tkaTvVwa1ygekG\n1TwD0l8Ak\/sem\/96ASoAs4aR38kMbM3hUYar7qVQcOEt3xwiCTNFBrZp1knTx8u1\nMU+nKOOsmgTzrMfG37c1W1UvkIkoneid8hkI+lgHvFMS4ZDB8g==\n=1KRA\n-----END PGP PUBLIC KEY BLOCK-----";
  var privateKey =
      "-----BEGIN PGP PRIVATE KEY BLOCK-----\nVersion: Keybase OpenPGP v2.0.76\nComment: https:\/\/keybase.io\/crypto\n\nxcMGBGW+bHQBCADlCkdoGghiYXWy59CkM\/6YtoDKuibOO3igONcDY1FfBcKv+jLh\nkvXhXeHQoSJhroDZ0ls\/8Gr3OAeoaoGrqwuCbrGBEvtWZAVyXr8e5oLBSvzSZafe\n54zeJDK26ZMJCFAlc8IEliavrPrK6KJ8A67ZZ2WwQ37zulY91d5GzIbCL6O6RFl5\nMihVjUzZ9726rcJrDtkWduTLjNieopWShu2aNpJouLw4KaoINurK30TO3F5ETD8R\ngOEI2n76RtXpqfIs3\/pQIhgeblVLaS5+0vyQVQ9g834w0HFdktpny2ALnmwitWO1\nd0RvFO5w6ykY9JNmgPT7tWoNVBZaxaBj9Wg9ABEBAAH+CQMIjIMxLnRdV4BgDCLd\nfCiZzmAGsWrSEv\/dNfSJtVcf77W2t39m3F33r4WhCEPg9ikFzLtXOZbJTcQweOQp\nmeyFbJI5wgXc+xAQyIFTWdaA6g2U2xl2xVKTw+5DWpS1N0y9IAIEtkqydmaOFd3h\nsPc\/zHNilV7RvwFi7cvqnwGSXAULu7oxmhbl5myreSBgJixH+i\/a4bH7XaJPAc4K\nRWibBQpN5tgSZ8LaQCY8SbAnWv7Pt2jyjTvq3whqZRY517BaDg1xzmJmLfMDoLsd\nLYz9NBTa6MSreynTO5o8ZwnBjQKbcmMZnfHwurMGQU5x2Ys5EoedQ5pvLTEE2DWq\nxuOn5zLNtCqOPOmhWDhmECgin0NvEQHSYHsC4wKWUYOpoZuO1QQcuAz\/3qk2zIg0\nMjyaWmfHYXFzK4rQpOPH+BfmZpdmpPTfXHY38skLShcOJFEJDZ6slaGGAZk\/qYT\/\nAn0vUUrtKL5XdKUC5rd9l3Zxm3cY3cOlc++fNxGh56WWNg1I+XuOhH3FX\/2SHAq\/\nEuRGc3FtSp3kZ1C5tMOzv3bULXHb7yvTH5RCCI9H6e9R1qaeo4Y+ilAChA2qFCKI\nRnlozvH85UuLifPS8fM+eXJ+aDtjKpKAHlHybGXdK8EFfrcp1DR3NpVmnSiIvGjK\nIE9kC5s3H5LBsBgXdmS1OyqRbZQcARNdRIvsy4tf94sSppqIsBKd3KgHba4vXHXe\n+bFa3Djn1HSzgY7rwz0ZVGgsf7ZAjZzell\/kp35BNdksablaxmFdZQXa\/Ckqo5Qj\nLXepCiG7k5dxJJj7Jd148JyjHJPVS1VFv1avDvlfLHQEeIZ78WeXmgCYoQF2b0z8\nm8NQHyfuVVQBgRPl8IflCP1rTjAaYFpQ37sAiXPdb8ncKoq5u7JHHowoLoCLaTel\n37TxmtBbOHdazShCYWJhdHVuZGUgPGFiZHVsbGFoaWppbW9oMy5qYUBnbWFpbC5j\nb20+wsB6BBMBCgAkBQJlvmx0AhsvAwsJBwMVCggCHgECF4ADFgIBAhkBBQkAAAAA\nAAoJEODJVJXhQpT6uW4H\/RnCNCJjIK4nx+hgohdsUi35kaX87qantKd9mFK+w8Ox\nsRQflQtXsmhouiWdR2ca+5oEGuGc6zikClc7iwbsnbnlASx92Q6mVKMa5eN8AbD3\nTWi6tQDWDnCzPpxKM3fYlIStYIGcx5d7uzcepS11fKt6reNvq68+a+y99yZ0lil6\nJAQRsx1CTSc6o1O\/4Vw+YBSIpqeKMx+LLun1abVPbv68JtAj4PegYhc1JvZ5871s\nQbrembZTJKWvKGE8+5T8H8DPr0SQwxptfDxJTyFTUtNpzlxvYA39iLUJnPkTVR92\nDrN\/NdqMoYqNmDY09UWL+bOUmCFbiXzSXTv\/bieVcRXHwwYEZb5sdAEIALUCuEKh\nhNXco0A4iOFQTGgiAfTvTjvbEB6tHpSBRfOT59oH4o8U5hhu0iR2ZXtPDHPzIEMY\n\/cgKhb7H3+1UuhhcW\/xAAXSf2DdcBHKO+rO6cPPo6WT0ISQWrLWYrUi71jtyllI+\nmHBXHO2J7Cd4eFWdRcjajDATmbxJjh67hjWNDFzpnsTH6BHsURGzb4gVrz5uum2l\ns\/cOLpI8SFpC7XryEHk1KpC+X84uEGRCHvil7sbdwnZXJY+hL3a6NuUJ27sXLHam\nFRuUeudrUoS0uhk1bYljcLtpbeeoJ8eiXz1iQvna2Bb9pYhq8czGz4qCnftCyKCy\nZYh9O5FjBy4YV2EAEQEAAf4JAwi0V3G\/e2IeMmDI90uEqTQQlVHMhfL+NZV1gWiX\nOiySJGT8VXw9axRU\/LVeTqIKGY+R8fWNfOmL\/8yJ7rt1nsdsc3WG\/UIXGcDfBukf\nyFl+ZtKKaZN3xKUmk69MYuMp12nViRGiwZc1FNG7\/olnmecF1S4LR7k6GL4rXapw\nk6boWFgVI1DpCJhIcG1GqH\/3\/wbBhRWei5XqovDqyXwgUYsy4x0Psus1DZuHe+9J\n8U0u7MZTLfIxCpNe16R\/JecKUYIAPedzUOU57+jwsIU80um7yaxonm5F2kFgQAeZ\nCBTEvvCtfzkpuDqPl6uNjbkhaFlm1mCu8dCXBMtAHgmivJv5YYIS32Laa1CRC90f\n07RSTBFBrIzGSMxx19U4aFPmyVZiIBYVAtLab7RcPeqT7Ah5jaif5+WwWAhudbGZ\nHAUT4xsUZrHjkY5WhbWQ+leBVRMxl1CNzqbBIUHd5trEDB9ltS7H8XwLB+Auvxwy\nd5zTRvmUx8cGXbLnpFbM7TL3pneixIzlVp3dyAO+eqUbP6\/FIou7cQkA85ftouno\nLdL8sa9b1nxkU39hL8LKpNG1+LPRTcw6YSCDHtYnnMFhTa2HGfbZFW0Bw8yhLRlf\nGCTADkVK\/aT02pRHGgBf0jgaUStjPw0z6v+uWhoXKubi6pn+kATbpy0rtZNxBk5M\nOJ4936yl9Bbu6BmQNLTwIYLe9QXyR4tsmC813XJg4ETBtwhuDMaLqPsl\/rq\/CEhb\nPhf0ZMeMoWWlnzPk7ax9UA1WjX84No6KzuC0CO7p8v5EqV2J86Me9JivCsEd5NbT\nR90eaKoLetb9k5vzI62A0sB\/HYzg4a3RiYfrp85oQ8z3EwGvXWIknM3kRCrvi2UJ\n1jGbVknBRgq7pGETHgZhuaVbyzugpLTaNTjtKuVRGmZ6yG4+tC\/8lA3CwYQEGAEK\nAA8FAmW+bHQFCQAAAAACGy4BKQkQ4MlUleFClPrAXSAEGQEKAAYFAmW+bHQACgkQ\nvBxvvnKzyzfpSwf9GjnYSeNiPwC8y4dXuyietbQUaV2BkU9mOTrfuYyt3sshFpI8\nPfqriUVfLp+KbwRqTkXnmrb\/CiP5+oj74g8Zhgqy2j1WVnYzwZBdO\/UQp9lahYhA\n7IcCfNYFIyVfAtR2NqYHpOya8ElnmCAbEL360oSgXXkAd35RfoHqN3R0\/P24AaGN\ndRVIGPro5iPaOTYDL\/sRRyA9rm5ZY1BEwRsPHTY+6hf93RWv+lTj+rSz4zDxBWJP\n5lCerMey8fc03T86xioEBy\/863JxLSh1oqd+iyQMw01uBRs8tFuqR9U8EhewL7W3\nPR8JYc\/wSye0KPnGM5SlGg+OWfkiywk8YVj1+5FzB\/9CuJFr+SNe9VqRT9qReNXA\nh+sOwBTgLMucYhv5PPQESJlRR2xaLpf76Mx3tPhlSco\/CtJ2MSlUS5fXAnphZ6ZD\nmdj8HZqxFMKEbBHjLO0kRI7a9io+OnILxvtUi9ZoCArDgjkarzAb62agEAFHUe6l\nkAGhfsOkeZdMf2aU\/C\/8IMIiMFW1IAQR2hZoWwyOPOLELmitvrTJZDZbtj0nFXkT\npPV3lXlc0tjpAYt\/2oBmvENaYkAN7hy592vPcgSshe6hnq8wHlfHjN+4h3P32UQ4\n71Ja98kpbRbQJElALka3ff17xwLDg8tVotD2UawVlfXr1\/\/vwFzu4YH7kCQPl8Rp\nx8MGBGW+bHQBCACcZhD25vLyiTMtzjSwsJsz3E6a8s9F7hu9Aa23X5WAs4RmQppc\nJv3k6KTJbUSrVPCXg1aDSmBJeo3hEDitpH5HKgC0WsuI5WeewNzlsM\/eZsr56WRC\nP\/QjLwvLtY9qYj27U24z7uBBE1Lj550tQ27\/6Fr+67S\/jFZW1SUX0vPzXo5\/Jzdz\nLsC1bBScypz3dj3tnWc\/5P+SCnWcuziYaEncSr4FTH34cfJcvwpOr0O29rc\/RcIk\nZwuGzWSxF8cjMXGcS0obSHMoC1ZgzsPZO3ZxKaDt3\/sdvsi5gABlUTUnLIJtJWtQ\nCFCoJ9HX1zccc8i2dfRfGsxl021cXHTQIcI5ABEBAAH+CQMIJ9zjl2uC3yNgX4wu\nxZ0hE+MI8LTuFJA9aSNYR+wR72y1YUFIoEwS1o73SQ6EK9RHijUwh4IJdWgM6Bdz\nD5XbqUXGKM+COmYzyC3o6Dg4rCqk4JnI0fWJVoC+fF\/XERZiy8eaaQ6ffZBodhh4\nrxkDGsEwhCL\/QKDrzkfZTiewFP27E2CovsJsOoO0IywRdUZMvPT3gNk0gbZaMQZ5\n1snnyLqPZCxYXNSSPAQo1ChUq2JgfG5MKHCYh6HOc0gHaV1LyWmg1p5l9A3atv\/G\nLTwBXZYiiavPaxoM6GIY1N2CpFFid8+cJlaoCXNPaMY+THTTAB6vXHAI804FcKLJ\nAZyyUif1Rg3JLU6GHAQx8uLD3fDvKtBt5C7wyYJosiBW\/fIV+sznAKPIo6++WXAW\ne9LXKbgzdamVFr1Fzw1RAch1gx5ZvdFRA0Gxs9IHmaycqQYeKt2glN75OyxhIX+c\n0W8JfvkFZjQMCjSMBSpTw7I8GtO5+QvvrryhZ1\/pAFY4wFhZMYRgw8R+kpazTpEM\nGCvtMs+knV7n8OaXRMFzNNIiwAMhZo\/w6aZkN5\/+J0xyOlLlmb4N3\/mT6AXuae0w\nmARm7NqZ\/Iz\/P14AimJQ2ZGjm8hWo9hPoFstjZ11pDv7bHydDIU4LEemxvDpgKpU\nIwEBgcd8UEjfQuyPSbiV3NZsgPm9vK1OzpUshpnEQp1\/FKol1ATsQ\/DDHpuM+8HW\nQqhNS30Dg8UjaUYkyAU22cu622lTjTuU4SMhduDOuXLx00ejGdD2Cx+KIELZ1q0L\nO31oiXSiyqdlrlBa3HFHfHEvHXHbNAHoDmF25F9wXDg0KGOp67rNekoosECd6RVs\nczdSQLFTC4fO\/40iVbbuUg8JX0TeH9Tmw\/5+AQLk0ELAYag9l97A3ArdWVeMn6Hx\nBoXkLmfJzCgewsGEBBgBCgAPBQJlvmx0BQkAAAAAAhsuASkJEODJVJXhQpT6wF0g\nBBkBCgAGBQJlvmx0AAoJEEuul7Yse7pm4NwH+gLdnvt23skooYMgobVnWw3nxW5O\ncQ0UKnYxUVhjRUZBL9pJAAErWO+ArLh8Kx66ld1iN4lP5DbLfjb2J6jNZ0NZk2rh\n7gw1kjKVYlJ9sPt9A++ZqmS03vaxO9IfJJYWMW5bRJQNcj7tCo+TvzZX7yrvs+i1\nK5v4EoVuNc6xD5y\/GKnNG9wvnrd6Sc80U5i4BQ3Kg+k++5D\/yH6Gb7Y5TUtVm9v8\n5sSaxh4Jupk2NcimQRV6tNwuyFt2oOfdG3sJLVi+4lCF+jj2RTE7suF+n8lA26sx\n7OEMXVDKzlkAmrH7CUNKTvq4hZ1nZyd9Av1yY0TBBeQ2uGPYCnDBMf2yz51lmAf6\nA4kbvXjCOb3JfAnsLfcgyE3sfA\/1zlpD1j8WRwkGA0nnTv7l136iSq3xHrCr7HUR\nY9TS5hM70LImPOFn3t2MstIav8ghkPB+MGT8Q7fXaMlO8IWeeNM1zwSOFpjhbl8n\nqwkGM2d2MmE4IZTwT0h+Noj9Jq\/ImmIJ66DWKTZ4+2R2da3TdKKwPj5DgZl6fgfl\npY3vklqVmt9Sr+YMoui4++tkaTvVwa1ygekG1TwD0l8Ak\/sem\/96ASoAs4aR38kM\nbM3hUYar7qVQcOEt3xwiCTNFBrZp1knTx8u1MU+nKOOsmgTzrMfG37c1W1UvkIko\nneid8hkI+lgHvFMS4ZDB8g==\n=QwEB\n-----END PGP PRIVATE KEY BLOCK-----";
  var passPhrase = 'pgptool77@@';
  var username = 'talk2phasahsyyahoocom';
  var password = 'f0bedbea93df09264a4f09a6b38de6e9b924b6cb92bf4a0c07ce46f26f85';

  // Authorisation: Basic Auth
  final plugin = RexpayPlugin();

  @override
  void initState() {
    super.initState();

    plugin.initialize(
      authKeys: AuthKeys(
        publicKey: publicKey,
        privateKey: privateKey,
        username: username,
        password: password,
        passPhrase: passPhrase,
        rexPayPublicKey: rexpayPublicKey,
        mode: Mode.test,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF25B61),
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: pullCharge,
          child: Text(
            "Pay",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFF25B61))),
        ),
      ),
    );
  }

  void pullCharge() async {
    String ref = RandomString().getRandomString(
      uppersCount: 10,
      lowersCount: 10,
      numbersCount: 10,
      specialsCount: 2,
      specials: 'a',
    );
    print("here");

    Charge charge = Charge()
      ..amount = 10000
      ..reference = ref
      ..email = 'customer@email.com';
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.selectable, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );

    print(response.serverResponse);
  }
}
