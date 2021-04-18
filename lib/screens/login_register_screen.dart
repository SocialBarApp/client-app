import 'package:bar_social_app/controllers/backend_controller.dart';
import 'package:bar_social_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//pageController
PageController _pageController = PageController();

//Login
final loginUsernameController = TextEditingController();
final loginPasswordController = TextEditingController();

String loginUsername = "";
String loginPassword = "";

//Register
final registerUsernameController = TextEditingController();
final registerPasswordController = TextEditingController();
final registerEmailController = TextEditingController();
final registerNameController = TextEditingController();
final registerLastNameController = TextEditingController();
final registerPhotoController = TextEditingController();
final registerAgeController = TextEditingController();

String registerUsername = "";
String registerPassword = "";
String registerEmail = "";
String registerName = "";
String registerLastName = "";
String registerPhoto = "Vacío por ahora";
int registerAge;

class LoginRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          /*SizedBox.expand(
            child: Image.asset(
              "assets/welcome_screen/bar-background.jpg",
              fit: BoxFit.cover,
            ),
          ),*/
          Positioned(
            top: 20,
            left: 0,
            child: BackButton(),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: _pageController,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: LoginTitle(),
                      ),
                      Expanded(
                        flex: 2,
                        child: LoginCard(),
                      ),
                      LoginButton(),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: RegisterTitle(),
                      ),
                      Expanded(
                        flex: 3,
                        child: RegisterCard(),
                      ),
                      RegisterButton(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registráte",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Serás parte de la red social más importante para bares",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Inicia sesión para jugar",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "sé parte de la diversión",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        children: [
          TextField(
            controller: loginUsernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.verified_user),
              labelText: 'Usuario',
            ),
            onChanged: (text) {
              setState(() {
                loginUsername = text;
              });
            },
          ),
          const SizedBox(height: 20),
          TextField(
            controller: loginPasswordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.security),
              labelText: 'Contraseña',
            ),
            onChanged: (text) {
              setState(() {
                loginPassword = text;
              });
            },
          ),
        ],
      ),
    );
  }
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
var confirmPass;

class RegisterCard extends StatefulWidget {
  @override
  _RegisterCardState createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: registerNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
                labelText: 'Mi nombre',
              ),
              onChanged: (text) {
                setState(() {
                  registerUsername = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: registerLastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person_pin_rounded),
                labelText: 'Mi segundo nombre',
              ),
              onChanged: (text) {
                setState(() {
                  registerLastName = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: registerUsernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.verified_user),
                labelText: 'Usuario',
              ),
              onChanged: (text) {
                setState(() {
                  registerUsername = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: registerPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.security),
                  labelText: 'Contraseña',
                ),
                onChanged: (text) {
                  setState(() {
                    registerPassword = text;
                  });
                },
                validator: (val) {
                  if (val.isEmpty) return 'Debe ingresar una contraseña';
                  return null;
                }),
            const SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.security),
                  labelText: 'Confirmar Contraseña',
                ),
                validator: (val) {
                  if (val.isEmpty) return 'Por favor confirme la contraseña';
                  if (val != registerPasswordController.text)
                    return 'Las contraseñas no coinciden';
                  return null;
                }),
            const SizedBox(height: 20),
            TextFormField(
              controller: registerEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.email_rounded),
                labelText: 'Mi Correo',
              ),
              onChanged: (text) {
                setState(() {
                  registerEmail = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: registerAgeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.verified_user),
                labelText: 'Mi edad',
              ),
              onChanged: (text) {
                setState(() {
                  registerAge = int.tryParse(text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 55,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          onPressed: () async {
            var response = await login(loginUsername, loginPassword);
            print("Respuesta desde login:$response");
          },
          color: secondaryColor,
          child: Text(
            "Iniciar sesión",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          },
          child: Text(
            "No estás registrado?",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          var response = await register(
              registerName,
              registerLastName,
              registerEmail,
              registerAge,
              registerPhoto,
              registerUsername,
              registerPassword);
          print("Respuesta desde register:$response");
        } else {
          print("No se validó bien");
        }
      },
      color: secondaryColor,
      child: Text(
        "Registrarme",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
