import 'package:explorer/flutter_flow/flutter_flow_animations.dart';
import 'package:explorer/m_y_card/transactionCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../utils/getRecentTransactions.dart';

class TransactionsContainer extends StatefulWidget {
  final bool isBlock;
  final List? data;
  const TransactionsContainer({super.key, required this.isBlock, this.data});

  @override
  State<TransactionsContainer> createState() => _TransactionsContainerState();
}

class _TransactionsContainerState extends State<TransactionsContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.isBlock && widget.data!.isEmpty
        ? Container()
        : SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                widget.isBlock
                    ? const SizedBox(
                        height: 1,
                      )
                    : const Text(
                        "Transactions",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.97,
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.isBlock
                                  ? 'Transactions'
                                  : 'Recent Transactions',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.87,
                        child: const Divider(
                          color: Colors.black,
                          thickness: 2.5,
                        ),
                      ),
                      FutureBuilder<List>(
                        future: widget.isBlock
                            ? getTransactions(dataBlock: widget.data)
                            : getRecentTransactions(),
                        builder: (BuildContext context, snapshot) {
                          // List<Widget> children;
                          if (snapshot.hasData) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: snapshot.data!.reversed.map((ele) {
                                  return transactionsCard(context, ele);
                                }).toList(),
                              ),
                            );
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                        ' Fetching resent Transactions *_^'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
