import 'package:flutter/material.dart';
import 'package:navigation_drawer/screens/account.dart';
import 'package:navigation_drawer/screens/settings.dart';
import 'package:navigation_drawer/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('SAKURA App'),
        ),*/
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //new Image.asset('../assets/images/logo-sakura.jpg', width: 100.0, height: 100.0),
                        const Image(image: AssetImage('images/logo-sakura.jpg'))
                      ],
                    )),
                /*Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SAKURA',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),*/
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}