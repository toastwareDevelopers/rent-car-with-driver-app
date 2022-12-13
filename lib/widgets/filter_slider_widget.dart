import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';

class FilterSlider extends StatefulWidget {
  final String title;
  final Function editValue;
  double min = 0, max = 0;
  double startValue = 0;
  double endValue = 0;

  FilterSlider(this.title, this.editValue,this.min,this.max,this.startValue,this.endValue);
  @override
  _FilterSliderState createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 0),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: FlutterSlider(
                values: [widget.startValue, widget.endValue],
                min: widget.min,
                max: widget.max,
                rangeSlider: true,
                trackBar: FlutterSliderTrackBar(
                  activeTrackBar: BoxDecoration(color: Colors.white),
                  inactiveTrackBar: BoxDecoration(color: Colors.grey[600]),
                ),
                handler: FlutterSliderHandler(
                  child: SizedBox(),
                ),
                rightHandler: FlutterSliderHandler(child: SizedBox()),
                handlerAnimation: FlutterSliderHandlerAnimation(
                    scale: 1.1, duration: Duration(milliseconds: 200)),
                handlerHeight: 15,
                handlerWidth: 15,
                tooltip: FlutterSliderTooltip(
                  format: (val) {
                    switch (widget.title) {
                      case "Price":
                        {
                          return val.split(".")[0];
                        }
                      case "Rating":
                        {
                          return val;
                        }
                      case "Age":
                        {
                          return val.split(".")[0];
                        }
                      case "Car Year":
                        {
                          return val.split(".")[0];
                        }
                      default:
                        {
                          return val;
                        }
                    }
                  },
                  alwaysShowTooltip: true,
                  textStyle: TextStyle(color: Colors.black, fontSize: 12),
                  boxStyle: FlutterSliderTooltipBox(
                    decoration: BoxDecoration(
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
                  widget.startValue = x;
                  widget.endValue = y;
                  widget.editValue(widget.startValue, widget.endValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
