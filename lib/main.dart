import 'package:amitians/config/colors.dart';
import 'package:amitians/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amitians',
      debugShowCheckedModeBanner: false,
      theme: kAppThemeData,
      home: OnboardingScreen(),
    );
  }
}

final ThemeData kAppThemeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final base = ThemeData.light();
  final baseTextTheme = GoogleFonts.poppinsTextTheme(base.textTheme);
  return base.copyWith(
    //Title
    textTheme: baseTextTheme.copyWith(
      //Heading
      displayLarge: baseTextTheme.displayLarge!.copyWith(
          height: 58.5 / 39,
          fontWeight: FontWeight.w700,
          fontSize: 39.0,
          color: kBlack),
      //H1
      displayMedium: baseTextTheme.displayMedium!.copyWith(
          height: 46.88 / 31.25,
          fontWeight: FontWeight.w700,
          fontSize: 31.25,
          color: kBlack),
      //H2
      displaySmall: baseTextTheme.displaySmall!.copyWith(
        height: 37.5 / 25.0,
        fontWeight: FontWeight.w400,
        fontSize: 25.0,
        color: kBlack,
      ),
      // H3, Button Large
      headlineSmall: baseTextTheme.headlineSmall!.copyWith(
        height: 30.0 / 20.0,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
        color: kBlack,
      ),
      //Body Regular (Body Copy), Button Regular
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
        color: kBlack,
        fontWeight: FontWeight.w400,
      ),
      // Body Small
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        height: 21.0 / 14.0,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: kBlack,
      ),
      // Caption
      labelSmall: baseTextTheme.labelSmall!.copyWith(
        height: 19.2 / 12.8,
        fontSize: 12.8,
        color: kCaption,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

_initFirebase() async {}
