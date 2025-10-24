import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static const Color primary = Color(0xFF5A54D2);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: _HeaderClipper(),
                    child: Container(
                      color: primary.withOpacity(0.85),
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Positioned(
                    right: 18,
                    top: 12,
                    child: Row(
                      children: const [
                        Icon(Icons.verified, size: 18, color: Colors.white),
                        SizedBox(width: 6),
                        Text('HANDICRAFTS', style: TextStyle(color: Colors.white, fontSize: 11, letterSpacing: 0.5)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.3),
                    child: Text(
                      'Set New Password',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your email number\nWe will send you OTP',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _LabeledField(
                      hint: 'Password',
                      obscure: true,
                    ),
                    SizedBox(height: 12),
                    _LabeledField(
                      hint: 'Confirm Password',
                      obscure: true,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20 + 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.85);
    final c = Offset(size.width * 0.55, size.height * 1.05);
    final p = Offset(size.width, size.height * 0.70);
    path.quadraticBezierTo(c.dx, c.dy, p.dx, p.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _LabeledField extends StatelessWidget {
  final String hint;
  final bool obscure;
  const _LabeledField({required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFFFF3EC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFF5E7DE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE7D5CA)),
        ),
      ),
    );
  }
}
