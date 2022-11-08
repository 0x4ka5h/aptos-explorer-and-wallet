import 'package:explorer/m_y_card/validator_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ValidatorPage extends StatefulWidget {
  const ValidatorPage({super.key});

  @override
  State<ValidatorPage> createState() => _ValidatorPageState();
}

class _ValidatorPageState extends State<ValidatorPage> {
  Map data = {
    "Address": "djsusdijdfjjdfjdsf",
    "Consensus": "djsusdijdfjjdfjdsf",
    "Fullnode": "djsusdijdfjjdfjdsf",
    "Netwrok": "djsusdijdfjjdfjdsf",
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Validators",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.97,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x3F14181B),
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                validatorCard(context, data, 47238748.48),
                validatorCard(context, data, 1273984.847),
                validatorCard(context, data, 5843843.234),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
