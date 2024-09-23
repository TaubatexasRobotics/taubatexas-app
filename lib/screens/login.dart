import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/login_validation_model.dart';
import '../controllers/auth.dart';

class Login extends StatelessWidget {
	Login({ super.key });

	TextEditingController emailController = TextEditingController();
	TextEditingController passwordController = TextEditingController();
	
	@override
	Widget build(BuildContext context) {
		final loginValidationModel = Provider.of<LoginValidationModel>(context);
		final dimensions = MediaQuery.of(context).size;
		return Scaffold(
			body: SafeArea(
				child: Center( 
					child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 10),
								child: Text(
									'Login',
									style: Theme.of(context).textTheme.titleLarge,
								),
							),
							SizedBox(
								width: dimensions.width * 0.8,
								child: TextFormField(
									controller: emailController,
									keyboardType: TextInputType.emailAddress,
									decoration: InputDecoration(
										icon: Icon(Icons.email_rounded),
										border: OutlineInputBorder(
											borderRadius: const BorderRadius.all(Radius.circular(20)),
										),
										hintText: 'exemplo@email.com',
										labelText: 'E-mail',
										helperText: '',
										errorText: loginValidationModel.emailError,
									),
									onChanged: (value) => loginValidationModel.setEmail(value),
								),
							),
							SizedBox(
								width: dimensions.width * 0.8,
								child: TextFormField(
									controller: passwordController,
									obscureText: !loginValidationModel.isPasswordVisible,
									decoration: InputDecoration(
										icon: Icon(Icons.password_rounded),
										suffixIcon: IconButton(
											icon: Icon(loginValidationModel.isPasswordVisible
											? Icons.visibility : Icons.visibility_off),
											onPressed: () => loginValidationModel.togglePasswordVisibility(),
										),
										border: OutlineInputBorder(
											borderRadius: const BorderRadius.all(Radius.circular(20)),
										),
										hintText: 'Digite a sua senha',
										labelText: 'Senha',
										helperText: '',
									),
								),
							),
							TextButton(
								onPressed: () async {
									String message = 'Login realizado com sucesso';
									if(loginValidationModel.validateForm()) {
										final login = await Auth.login(
											email: emailController.text,
											password: passwordController.text
										);
										
										switch(login) {
											case 'invalid-email':
												message = 'E-mail ou senha inválidos!';
												break;
											default:
												message = 'E-mail ou senha inválidos!';
												break;
										}
									} else message = 'E-mail ou senha inválidos!';

									Fluttertoast.showToast(
										msg: message,
										toastLength: Toast.LENGTH_SHORT,
										gravity: ToastGravity.CENTER,
										fontSize: 16
									);
								},
								child: SizedBox(
									width: dimensions.width * 0.8,
									height: 50,
									child: Container(
										alignment: Alignment.center,
										decoration: BoxDecoration(
											borderRadius: const BorderRadius.all(Radius.circular(20)),
											color: Theme.of(context).colorScheme.primary,
										),
										child: Text(
											'Fazer Login',
											style: Theme.of(context).textTheme.labelMedium,
										),
									),
								),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pushNamed('/register'),
								child: SizedBox(
									width: dimensions.width * 0.8,
									height: 50,
									child: Container(
										alignment: Alignment.center,
										decoration: BoxDecoration(
											borderRadius: const BorderRadius.all(Radius.circular(20)),
											color: Theme.of(context).colorScheme.primary,
										),
										child: Text(
											'Criar Conta',
											style: Theme.of(context).textTheme.labelMedium,
										),
									),
								),
							),
							TextButton(
								onPressed: () => print('Teste'),
								child: Text(
									'Esqueceu a senha?',
									style: Theme.of(context).textTheme.labelSmall,
								),
							),
						],
					),
				),
			),
		);
	}
}
