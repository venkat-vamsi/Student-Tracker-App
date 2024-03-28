import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class iot_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothScanner(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class BluetoothScanner extends StatefulWidget {
  @override
  _BluetoothScannerState createState() => _BluetoothScannerState();
}

class _BluetoothScannerState extends State<BluetoothScanner> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;
  List<BluetoothService> services = [];
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    startScan();
  }

  void startScan() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.name == 'Nothing phone (1)') {
          connectToDevice(result.device);
          break;
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    List<BluetoothService> bluetoothServices = await device.discoverServices();
    setState(() {
      connectedDevice = device;
      services = bluetoothServices;
    });
    listenForMessages();
  }

  void listenForMessages() async {
    if (connectedDevice != null) {
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.isNotifying) {
            characteristic.value.listen((value) {
              setState(() {
                messages.add(String.fromCharCodes(value));
              });
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Scanner'),
        backgroundColor: Color.fromARGB(255, 159, 76, 31),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Scan for Device'),
            onPressed: startScan,
          ),
          if (connectedDevice != null) ...[
            Text('Connected Device: ${connectedDevice!.name}'),
            ElevatedButton(
              child: Text('Disconnect'),
              onPressed: () {
                connectedDevice!.disconnect();
                setState(() {
                  connectedDevice = null;
                  services = [];
                  messages = [];
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
