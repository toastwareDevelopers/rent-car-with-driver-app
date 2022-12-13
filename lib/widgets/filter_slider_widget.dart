import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';

class FilterSlider extends StatefulWidget {
  final String title;
  final Function editValue;

  FilterSlider(this.title, this.editValue);
  @override
  _FilterSliderState createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  double min = 0, max = 0;
  double startValue = 0;
  double endValue = 0;

  @override
  void initState() {
    if (widget.title == "Price") {
      min = 0;
      startValue = 0;
      max = 10000;
      endValue = 10000;
    } else if (widget.title == "Rating") {
      min = 0;
      startValue = 0;
      max = 10;
      endValue = 10;
    } else if (widget.title == "Age") {
      min = 18;
      startValue = 18;
      max = 70;
      endValue = 70;
    }else{
      min = 1990;
      startValue = 1990;
      max = DateTime.now().year.toDouble();
      endValue = DateTime.now().year.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: FlutterSlider(
                          values: [startValue, endValue],
                          min: min,
                          max: max,
                          rangeSlider: true,
                          decoration: BoxDecoration(),
                          foregroundDecoration: BoxDecoration(),
                          trackBar: FlutterSliderTrackBar(
                            activeTrackBar: BoxDecoration(color: Colors.white),
                            inactiveTrackBar:
                                BoxDecoration(color: Colors.grey[600]),
                          ),
                          handler: FlutterSliderHandler(
                            child: SizedBox(),
                          ),
                          rightHandler: FlutterSliderHandler(child: SizedBox()),
                          handlerAnimation: FlutterSliderHandlerAnimation(
                              scale: 1.1,
                              duration: Duration(milliseconds: 200)),
                          handlerHeight: 25,
                          handlerWidth: 25,
                          tooltip: FlutterSliderTooltip(
                            format: (val) {
                              if(widget.title == "Price"){
                                return val.split(".")[0];
                              }else{
                                return val;
                              }
                            },
                            alwaysShowTooltip: true,
                            textStyle: TextStyle(color: Colors.black),
                            boxStyle: FlutterSliderTooltipBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          onDragCompleted: (val, x, y) {
                            startValue = x;
                            endValue = y;
                            widget.editValue(startValue, endValue);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
