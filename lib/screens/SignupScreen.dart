import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:signup/components/BaseAppBar.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hiddenPassword = true;
  void _onSubmit() {
    if (!_formKey.currentState.validate()) return;
  }

  @override
  Widget build(BuildContext context) {
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
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      name: 'password',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: _hiddenPassword,
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
