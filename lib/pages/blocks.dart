import 'package:explorer/utils/get_blocks.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../m_y_card/block_card.dart';

class BlocksPage extends StatefulWidget {
  const BlocksPage({super.key});

  @override
  State<BlocksPage> createState() => _BlocksPageState();
}

class _BlocksPageState extends State<BlocksPage> {
  Future<List> _blockData = getLatestBlocks();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        children: [
          const Text(
            
            "Blocks",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Blocks',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: FlutterFlowTheme.of(context).bodyText2.color,
                          size: 22,
                        ),
                        onPressed: () {
                          setState(() {
                            _blockData = getLatestBlocks();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                ),
                FutureBuilder<List>(
                  future: _blockData,
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
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
                                child: Text(' Fetching Latest Blocks *_^'),
                              ),
                            ],
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Column(
                            children: [
                              const Icon(Icons.error),
                              const Text('Failed to fetch data.'),
                              IconButton(
                                icon: const Icon(Icons.restart_alt_rounded),
                                onPressed: () {
                                  setState(() {
                                    _blockData = getLatestBlocks();
                                  });
                                },
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: snapshot.data!.map((ele) {
                                return blockCard(context, ele);
                              }).toList(),
                            ),
                          );
                        }
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
