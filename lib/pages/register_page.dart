import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_setup/pages/chat_page.dart';
import 'package:scholar_chat_setup/widgets/custom_button.dart';
import 'package:scholar_chat_setup/widgets/custom_text_field.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/const.dart';


class RegisterPage extends StatefulWidget {
   RegisterPage({Key? key}) : super(key: key);

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey  =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 75,),
                Image.asset('assets/images/scholar.png' , height: 100,),
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
                      'REGISTER',
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
                  onChange: (data)
                  {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(height: 10,),
                CustomFormTextFiled(
                  obscureText: true,
                  onChange: (data)
                  {
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
                    try {
                     await regsertUser();
                     showSnackBar(context, 'Success');
                     Navigator.pushNamed(context, ChatPage.id);
                    }on FirebaseAuthException catch (ex){
                      if (ex.code == 'weak-password') {
                        showSnackBar(context , 'weak-password');
                      } else if (ex.code == 'email-already-in-use') {
                        showSnackBar(context, 'email-already-in-use');
                      }
                    }catch (ex) {
                      showSnackBar(context, 'there was an error ');
                    }
                    isLoading = false;
                      setState(() {

                      });
                    }else
                      {

                      }
                  },

                  text : 'REGISTER',
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' LOGIN',
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


   Future<void> regsertUser() async{
     UserCredential user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
     print(user.user!.displayName);
   }
}


