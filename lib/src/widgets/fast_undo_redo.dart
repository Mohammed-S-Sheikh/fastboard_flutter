import 'package:flutter/material.dart';

import '../types/fast_redo_undo_count.dart';
import 'widgets.dart';

class FastRedoUndoView extends FastRoomControllerWidget {
  const FastRedoUndoView(
    super.controller, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return FastRedoUndoState();
  }
}

class FastRedoUndoState extends FastRoomControllerState<FastRedoUndoView> {
  late FastRedoUndoCount redoUndoCount;

  @override
  void initState() {
    super.initState();
    redoUndoCount = widget.controller.value.redoUndoCount;
  }

  @override
  Widget build(BuildContext context) {
    return FastContainer(
        child: Row(
      children: [
        InkWell(
          child: FastIcon(FastIcons.undo),
          onTap: redoUndoCount.undo != 0 ? _onUndoTap : null,
        ),
        SizedBox(width: FastGap.gap_1),
        InkWell(
          child: FastIcon(FastIcons.redo),
          onTap: redoUndoCount.redo != 0 ? _onRedoTap : null,
        ),
      ],
    ));
  }

  void _onUndoTap() {
    widget.controller.undo();
  }

  void _onRedoTap() {
    widget.controller.redo();
  }

  @override
  void calculateState() {
    redoUndoCount = widget.controller.value.redoUndoCount;
  }
}
