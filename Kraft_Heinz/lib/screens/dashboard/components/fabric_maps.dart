import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

// void main() {
//   return runApp(MapsApp());
// }
//
// /// This widget will be the root of application.
// class MapsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Maps Demo',
//       home: MyHomePage(),
//     );
//   }
// }

/// This widget is the home page of the application.
class MapsApp extends StatefulWidget {
  /// Initialize the instance of the [MyHomePage] class.
  const MapsApp({Key? key}) : super(key: key);



  @override
  State<MapsApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapsApp> {
  _MyHomePageState();

  late List<Model> _data;
  late MapShapeSource _shapeSource;

  @override
  void initState() {
    _data = const <Model>[
      Model('United States of America', 200),
      Model('Australia', 54),
      Model('Costa Rica', 300),
      Model('Belgium', 51),
      Model('Brazil', 400),
      Model('Canada', 12),
      Model('China', 201),
      Model('Czech Republic', 14),
      Model('Denmark', 14),
      Model('Finland', 400),
      Model('France', 14),
      Model('Germany', 14),
      Model('Ireland', 200),
      Model('India', 14),
      Model('Indonesia', 14),
      Model('Italy', 14),
      Model('Japan', 14),
      Model('Korea', 14),
      Model('Mexico', 14),
      Model('Egypt', 14),
      Model('United Arab Emirates', 200),
      Model('Netherlands', 14),
      Model('New Zealand', 14),
      Model('Norway', 14),
      Model('Poland', 14),
      Model('Philippines', 201),
      Model('Russia', 200),
      Model('Spain', 14),
      Model('Sweden', 14),
      Model('United Kingdom', 14),
      Model('Venezuela', 14),

    ];


    _shapeSource = MapShapeSource.asset(
      "assets/world_map.json",
      shapeDataField: "name",
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].country,
      shapeColorValueMapper: (int index) => _data[index].density,
      shapeColorMappers: [
        MapColorMapper(from: 0, to: 100, color: Colors.greenAccent, text: '< 100/km'),
        MapColorMapper(
          from: 101, to: 200, color: Colors.blueAccent, text: '100 - 200/km'),
        MapColorMapper(
          from: 201, to: 300, color: Colors.pink, text: '200 - 300/km'),
        MapColorMapper(
          from: 301, to: 400, color: Colors.red, text: '300 - 400/km'),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          "Fabric Maps",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          height: 580,
          child: Center(
            child: SfMaps(
              layers: <MapShapeLayer>[
                MapShapeLayer(
                  source: _shapeSource,
                  showDataLabels: false,
                  legend: const MapLegend(MapElement.shape),
                  tooltipSettings: MapTooltipSettings(
                      color: Colors.cyan[700],
                      strokeColor: Colors.white,
                      strokeWidth: 2),
                  strokeColor: Colors.white,
                  strokeWidth: 0.5,
                  shapeTooltipBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _data[index].country,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  dataLabelSettings: MapDataLabelSettings(
                    textStyle: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize:
                        Theme.of(context).textTheme.bodySmall!.fontSize),
                  ),
                ),
            ],
          ),
         ),
        ),
      ],
     ),
   );
  }
}

/// Collection of Australia state code data.
class Model {
  const Model(this.country, this.density);

  final String country;
  final double density;
}