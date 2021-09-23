import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:signup/components/BaseAppBar.dart';
import 'package:signup/models/UserModel.dart';
import 'package:signup/screens/HomeScreen.dart';
import 'package:signup/services/UserService.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/signup';
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    void _onSubmit() {
      if (!_formKey.currentState.saveAndValidate()) return;
      final formValue = _formKey.currentState.value;

      final user = UserModel(
        fullName: formValue['fullName'],
        email: formValue['email'],
        birthdate: formValue['birthdate'].toString(),
        password: formValue['password'],
      );

      userService.setCurrentUser(user);

      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        (route) => false,
      );
    }

    return Scaffold(
      appBar: BaseAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 32,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),
                    FormBuilderTextField(
                      name: 'fullName',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Nome completo',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      name: 'email',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    SizedBox(height: 15),
                    FormBuilderDateTimePicker(
                      name: "birthdate",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Data de nascimento',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      textInputAction: TextInputAction.next,
                      inputType: InputType.date,
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      name: 'password',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: _hiddenPassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _hiddenPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onTap: () => setState(
                            () => _hiddenPassword = !_hiddenPassword,
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 8),
                      ]),
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      child: Text(
                        'Criar conta!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: _onSubmit,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
