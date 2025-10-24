import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            // Curved header with title
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: _RegisterHeaderClipper(),
                    child: Container(
                      color: primary.withOpacity(0.85),
                      width: double.infinity,
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
                      'Create account',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create an account  so you can\nexplore all',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),

            // Scrollable form region
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    _LabeledField(hint: 'Email', keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 12),
                    _LabeledField(hint: 'Password', obscure: true),
                    SizedBox(height: 12),
                    _LabeledField(hint: 'Confirm Password', obscure: true),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom fixed area: Sign up, already have, social
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20 + 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
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
                        onPressed: () {},
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Already have an account',
                        style: TextStyle(
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Or continue with',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _SocialIcon(label: 'G'),
                        SizedBox(width: 12),
                        _SocialIcon(icon: Icons.facebook),
                        SizedBox(width: 12),
                        _SocialIcon(icon: Icons.apple),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RegisterHeaderClipper extends CustomClipper<Path> {
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
  final TextInputType? keyboardType;
  const _LabeledField({required this.hint, this.obscure = false, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      keyboardType: keyboardType,
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

class _SocialIcon extends StatelessWidget {
  final IconData? icon;
  final String? label;
  const _SocialIcon({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E8E8)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      alignment: Alignment.center,
      child: icon != null
          ? Icon(icon, color: Colors.black87)
          : Text(
        label ?? '',
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
    );
  }
}
