import "package:arosa_je/core/core.dart";
import "package:arosa_je/modules/auth/register/notifier.dart";
import "package:arosa_je/router/router.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class CGU extends ConsumerStatefulWidget {
  const CGU({
    super.key,
    required this.username,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.email,
  });

  final String username;
  final String password;
  final String lastName;
  final String firstName;
  final String email;

  @override
  ConsumerState<CGU> createState() => _CGUState();
}

class _CGUState extends ConsumerState<CGU> {
  @override
  Widget build(BuildContext context) {
    final coreL10n = context.coreL10n;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Conditions Générales d'Utilisation",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.tiny),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date: 12/04/2024",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Collecte et Utilisation des Données Personnelles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                AppGap.xxs(),
                Text("Données des Utilisateurs :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Lors de la création de votre compte, vous nous fournissez un identifiant unique et un nom d'utilisateur. Ces informations nous permettent de gérer votre compte et de personnaliser votre expérience sur l'application.",
                  ),
                ),
                AppGap.xxs(),
                Text("Conseils sur les Plantes :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Vous pouvez partager des conseils sur les plantes au sein de l'application. Pour cela, vous saisissez le nom de la plante et le conseil associé. Ces informations contribuent à une base de connaissances partagée pour aider les autres utilisateurs.",
                  ),
                ),
                AppGap.xxs(),
                Text("Gestion des Plantes :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Lorsque vous ajoutez une plante à l'application, vous indiquez son nom, une description, une image, ainsi que la localisation géographique de la plante. Ces données permettent de faciliter le partage de conseils spécifiques à la plante, d'organiser sa garde, et de recevoir des recommandations personnalisées de la part de botanistes au sein de l'application.",
                  ),
                ),
                AppGap.xxs(),
                Text(
                  "Sécurité et Confidentialité :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Nous prenons la sécurité de vos données très au sérieux. Les mots de passe sont sécurisés à l'aide d'un hachage, garantissant ainsi la protection de votre compte. Aucune partie externe n'a accès à vos données personnelles.",
                  ),
                ),
                AppGap.xxs(),
                Text(
                  "Durée de Conservation des Données :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Vos données sont conservées pour la durée d'un projet de cours, et ne seront pas conservées au-delà de la fin de l'année 2024.",
                  ),
                ),
                AppGap.xxs(),
                Text(
                  "Droits des Utilisateurs :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "En acceptant ces CGU lors de votre inscription, vous consentez à la collecte et à l'utilisation de vos données comme décrit ci-dessus. Vous avez le droit de nous contacter par mail pour toute demande de rétractation ou pour exercer vos droits d'accès, de rectification, et de suppression de vos données.",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimensions.small),
                  child: Text(
                    "Aucune donnée ne sera transmise à des tiers sans votre consentement préalable.",
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppDimensions.xLarge),
          child: SizedBox(
              child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.small)),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    child: Text(coreL10n.refuse,
                        style: const TextStyle(color: Colors.black))),
              ),
              const AppGap.medium(),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(registerProvider.notifier).register(
                            widget.username,
                            widget.password,
                            widget.lastName,
                            widget.firstName,
                            widget.email,
                          );
                          context.goNamed(AppRoute.login.name);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.small)),
                    ),
                    child: Text(coreL10n.accept,
                        style: const TextStyle(color: Colors.white))),
              ),
            ],
          )),
        ));
  }
}
