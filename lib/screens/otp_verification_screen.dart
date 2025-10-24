import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _nodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final n in _nodes) n.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(Icons.verified, size: 18, color: Color(0xFF5A54D2)),
                      SizedBox(width: 6),
                      Text('HANDICRAFTS', style: TextStyle(color: Color(0xFF5A54D2), fontSize: 11, letterSpacing: 0.5)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Icon(Icons.phone_iphone, size: 64, color: Colors.black54),
            const SizedBox(height: 12),
            Text('Verification', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(
              'We will send you a One Time\nOTP on your email',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) => _otpBox(i)),
              ),
            ),
            const Spacer(),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 44,
      child: TextField(
        controller: _controllers[index],
        focusNode: _nodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFFFF3EC),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFF5E7DE)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE7D5CA)),
          ),
        ),
        onChanged: (v) {
          if (v.isNotEmpty && index < 5) {
            _nodes[index + 1].requestFocus();
          } else if (v.isEmpty && index > 0) {
            _nodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
