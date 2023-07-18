import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_setup/pages/register_page.dart';
import 'package:scholar_chat_setup/widgets/custom_button.dart';
import 'package:scholar_chat_setup/widgets/custom_text_field.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/const.dart';
import 'chat_page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String? email;

   String? password;

   bool isLoading = false;

   GlobalKey<FormState> formKey  =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                SizedBox(height: 75,),
                Image.asset('assets/images/scholar.png', height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 75,),
                Row(
                  children: [

                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                CustomFormTextFiled(
                  obscureText: false,
                  onChange: (data){
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(height: 10,),
                CustomFormTextFiled(
                  obscureText: true,
                  onChange: (data){
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(height: 20,),
                CustomButton(
                  onTap: () async{
                    if(formKey.currentState!.validate()){
                      isLoading = true;
                      setState(() {

                      });
                      try{
                        await logintUser();
                        showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, ChatPage.id  , arguments: email,);
                      }on FirebaseAuthException catch(ex){
                        if (ex.code == 'user-not-found') {
                          showSnackBar(context , 'user-not-found');
                        } else if (ex.code == 'wrong password') {
                          showSnackBar(context, 'wrong password');
                        }
                      }catch(ex){
                        showSnackBar(context, 'there was an error ');
                      }
                      isLoading = false;
                      setState(() {

                      });
                    }else{}
                  },
                  text : 'LOGIN',
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: Text(
                        ' REGISTER',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }



   Future<void> logintUser() async{
     UserCredential user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
     print(user.user!.displayName);
   }
}
