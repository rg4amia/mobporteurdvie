import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/suivi-evaluation/reglement_interieur/reglement_interieur.dart';
import 'helpers/shared_service.dart';
import 'views/academie/cours_direct.dart';
import 'views/administrateur/administrateur.dart';
import 'views/administrateur/administrateur_binding.dart';
import 'views/dashboard/dashboard.dart';
import 'views/dashboard/dashboard_binding.dart';
import 'views/academie/modules_cours/module_cours.dart';
import 'views/academie/modules_cours/module_cours_binding.dart';
import 'views/obed-edom/meditation/meditation_binding.dart';
import 'views/obed-edom/permission/permission_binding.dart';
import 'views/obed-edom/vertumetre/vertumetre_binding.dart';
import 'views/obed-edom/meditation/meditation.dart';
import 'views/obed-edom/permission/permission.dart';
import 'views/obed-edom/vertumetre/vertumetre.dart';
import 'views/login/login.dart';    
import 'views/login/login_binding.dart';
import 'views/session/preinscription/formulaire.dart';
import 'views/session/preinscription/formulaire_binding.dart';
import 'views/session/preinscription/sucess_inscription.dart';
import 'views/session/reinscription/index.dart';
import 'views/session/reinscription/reinscription _etape_2.dart';
import 'views/session/reinscription/reinscription_bindinng.dart';
import 'views/session/session.dart';
import 'views/splash/launcher.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Widget _defaultHome = LoginPage(title: 'Porteurs de vie Connexion');

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggeIn();
  if (_result) {
    _defaultHome = const DashboardPage();
  }

  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://d8b7f1a082194f8ea1563df20ce67cfd@o464942.ingest.sentry.io/5987713';
    },
    appRunner: () => runApp(MyApp(defaultHome: _defaultHome)),
  );
}

class MyApp extends StatelessWidget {
  Widget? defaultHome;
  MyApp({Key? key, this.defaultHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerUp: (_) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        currentFocus.focusedChild!.unfocus();
      }
    },
    child: GetMaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      title: 'PDVIE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: MySplash(defaultPage: defaultHome),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => LoginPage(title: 'Porteurs de vie Connexion'),
            transition: Transition.cupertino,
            binding: LoginBinding()),
        GetPage(
            name: '/administrateur/detail',
            page: () => const AdministrateurDetail(),
            transition: Transition.cupertino,
            binding: AdministrateurDetailBinding()),
        GetPage(
            name: '/reinscription/etape/2',
            page: () => ReinscriptionEtape2(),
            transition: Transition.zoom,
            binding: ReinscriptionBinding()), 
        GetPage(
            name: '/cours/direct',
            page: () => coursDirect(),
            transition: Transition.native
        ),
        GetPage(
            name: '/session',
            page: () => SessionPage(),
            transition: Transition.native),
        GetPage(
            name: '/session/success',
            page: () => SuccessInscription(),
            transition: Transition.native,
            binding: FormulaireBinding()),
        GetPage(
            name: '/session/reinscription',
            page: () => Reinscription(),
            transition: Transition.native,
            binding: ReinscriptionBinding()
        ),
        GetPage(
            name: '/modules/cours',
            page: () => const ModuleCoursPage(),
            transition: Transition.native,
            binding: ModuleCoursBinding()),
        GetPage(
            name: '/dashboard',
            page: () => const DashboardPage(),
            transition: Transition.native,
            binding: DashboardBinding()),
        GetPage(
            name: '/obed-edom/vertumetre',
            page: () => VertumetrePage(),
            transition: Transition.downToUp,
            binding: VertumetreBinding()),
        GetPage(
            name: '/obed-edom/meditation',
            page: () => MeditationPage(),
            transition: Transition.native,
            binding: MeditationBinding()),
        GetPage(
            name: '/obed-edom/permission',
            page: () => PermissionPage(),
            transition: Transition.native,
            binding: PermissionBinding()),
        GetPage(
            name: '/session/preinscription/formulaire',
            page: () => FormulairePreinscription(),
            transition: Transition.upToDown,
            binding: FormulaireBinding()),
        GetPage(
          name: '/suivi/reglementinterieur',
          page: () => reglementInterieur(),
          transition: Transition.upToDown,
        ),
      ],
    ));
  }
}
