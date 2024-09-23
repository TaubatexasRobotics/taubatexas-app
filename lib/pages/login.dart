import 'package:flutter/material.dart';

class Login extends StatelessWidget {
	const Login({ super.key });
	
	@override
	Widget build(BuildContext context) {
		final dimensions = MediaQuery.of(context).size;
		return Scaffold(
			body: SafeArea(
				child: Form(
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
										keyboardType: TextInputType.emailAddress,
										decoration: const InputDecoration(
											icon: Icon(Icons.email_rounded),
											border: OutlineInputBorder(
												borderRadius: const BorderRadius.all(Radius.circular(20)),
											),
											hintText: 'exemplo@email.com',
											labelText: 'E-mail',
											helperText: '',
										),
									),
								),
								SizedBox(
									width: dimensions.width * 0.8,
									child: TextFormField(
										obscureText: true,
										decoration: const InputDecoration(
											icon: Icon(Icons.password_rounded),
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
									onPressed: () => print('Teste'),
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
									onPressed: () => print('Teste'),
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
							],
						),
					),
				),
			),
		);
	}
}
