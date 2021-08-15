
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressDialogFullScreen extends StatefulWidget {
  final Color? backgroundColor;
  final Color? color;
  final Color? containerColor;
  final double? borderRadius;
  final String? text;
  final bool? loading;

  ProgressDialogFullScreen(
      {Key? key,
        this.backgroundColor = Colors.black54,
        this.color : const Color(0xfffbb448),
        this.containerColor = Colors.white,
        this.borderRadius = 10.0,
        this.text,
        this.loading = true})
      : super(key: key);

  @override
  _ProgressDialogFullScreenState createState() {
    return _ProgressDialogFullScreenState();
  }
}

class _ProgressDialogFullScreenState extends State<ProgressDialogFullScreen> {
  bool? _visible=true;


  @override
  Widget build(BuildContext context) {
    if (_visible!) {
      return  WillPopScope(
          onWillPop: () {
            return  Future(() => false);
          },
          child: Scaffold(
            backgroundColor: widget.backgroundColor,

             body:  Stack(
               children: <Widget>[
                  Center(
                   child: Container(
                     width: 100,
                     height: 100,

                     decoration:  BoxDecoration(
                         color: widget.containerColor,
                         borderRadius:  BorderRadius.all(
                              Radius.circular(widget.borderRadius!))),
                   ),
                 ),
                  Center(
                   child: _getCenterContent(),
                 )
               ],
             )
          ));
    } else {
      return  Container();
    }
  }

  Widget _getCenterContent() {
    if (widget.text == null || widget.text!.isEmpty) {
      return _getCircularProgress();
    }

    return  Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
           Container(
            margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child:  Text(
              widget.text!,
              style:  TextStyle(
                  color: widget.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor:  AlwaysStoppedAnimation(widget.color),
          strokeWidth: 2,
        ));
  }
}