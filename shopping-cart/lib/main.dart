import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int itemCount = 0;
  double unitPrice = 10.0;

  void incrementItem() {
    setState(() {
      itemCount++;
      if (itemCount % 5 == 0) {
        showItemAddedDialog();
      }
    });
  }

  void decrementItem() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  void showItemAddedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Added'),
          content: Text('You have added 5 items on your bag!'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Checked out successfully.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Item Count: $itemCount'),
            Text('Total Amount: \$${itemCount * unitPrice}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementItem,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementItem,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showSnackBar();
              },
              child: Text('CHECK OUT'),
            ),
          ],
        ),
      ),
    );
  }
}
