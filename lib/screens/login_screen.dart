import 'package:flutter/material.dart';
import '../state/app_state.dart';
import '../state/auth_state.dart';
import '../widgets/primary_button.dart';
import '../utils/validators.dart';
import '../routes.dart';
import '../error/error_mapper.dart';

class LoginScreen extends StatefulWidget {
  final AppState appState;

  const LoginScreen({super.key, required this.appState});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await widget.appState.authState.login(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );

      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } catch (e) {
      final mapped = ErrorMapper.map(e);
      setState(() {
        _error = mapped.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthState auth = widget.appState.authState;

    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: '이메일'),
                validator: Validators.email,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: '비밀번호'),
                obscureText: true,
                validator: Validators.password,
              ),
              const SizedBox(height: 20),
              if (_error != null)
                Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 12),
              PrimaryButton(
                text: _loading ? '로그인 중...' : '로그인',
                onPressed: _loading ? null : _login,
              ),
              const SizedBox(height: 12),
              Text(
                auth.isAuthenticated ? '로그인됨' : '로그인 필요',
              ),
            ],
          ),
        ),
      ),
    );
  }
}