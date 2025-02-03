import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _controller = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < 3) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          // Page 1 avec gradient
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/images/Splash.png',
                  )),
                  gradient: LinearGradient(
                    colors: [Color(0xFF46DAFE), Color(0xFF0E87F2)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explorez L'Afrique",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Africa Travel car",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: Text("Continuer",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFF072D47))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Pages 2 à 4
          buildOnboardingPage(
              "assets/images/Group.png",
              "Réservez Votre Voyage\n en Toute Simplicité",
              "Accédez à une large gamme de compagnies de transport en Côte d’Ivoire et dans la sous-région.",
              _nextPage),
          buildOnboardingPage(
              "assets/images/Hiking.png",
              "Payez en Toute\n Sécurité",
              "Profitez de plusieurs méthodes de paiement sécurisées (Mobile Money, carte bancaire, etc.).\n\nRecevez une confirmation instantanée après chaque transaction.",
              _nextPage),
          buildOnboardingPage(
              "assets/images/Traveller.png",
              "Voyagez avec Confiance et Tranquillité",
              "Gagnez du temps en évitant les files d’attente à la gare.\n\nModifiez ou annulez vos réservations en cas d’imprévu, selon les politiques des transporteurs.",
              () {
            // Action finale après l'onboarding
          }),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(
      String logo, String title, String detail, VoidCallback onNext) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Color(0xFF46D9FD),
            child: Center(
              child: Image.asset(
                logo,
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Color(0xFF46D9FD),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 255, 254, 254)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              // 👈 Ajout pour respecter le borderRadius
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF072D47),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Text(
                      detail,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1088F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child:
                              Text("Suivant", style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
