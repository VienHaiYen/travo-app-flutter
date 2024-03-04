import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class W1D1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Expanded and Flexible Widgets",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
            "Có điểm tương đồng là cả 2 cùng được sử dụng để mở rộng không gian của con của nó để lấp đầy không gian còn trống của mainAxis, tuy nhiên là với Flexible thì lại có thêm thuộc tính fit hỗ trợ hiển thị phần tử con trong nó"),
        ExpandednFlexible1(),
        ExpandednFlexible2(),
        const SizedBox(height: 5),
        ExpandednFlexible3(),
        ExpandednFlexible4(),
        ExpandednFlexible5(),
        const SizedBox(height: 10),
        Text("Row Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
            "Có phép hiển thị các widget con của nó theo chiều ngang, hỗ trợ các thuộc tính để căn chỉnh vị trí của các widget con"),
        Row(
          children: [
            Expanded(child: RowExaple1()),
            Expanded(child: RowExaple2()),
          ],
        ),
        Row(
          children: [
            Expanded(child: RowExaple3()),
            Expanded(child: RowExaple4()),
          ],
        ),
        const SizedBox(height: 10),
        Text("Column Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Tương tự Row nhưng là hiển thị theo chiều dọc"),
        SizedBox(
          height: 400,
          child: Row(
            children: [
              Expanded(child: ColumnExaple1()),
              Expanded(child: ColumnExaple2()),
              Expanded(child: ColumnExaple3()),
              Expanded(child: ColumnExaple4()),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Wrap Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
            "Cho phép các phần tử con khi không đủ chỗ trên dòng có thể xuống dòng"),
        WrapExample(),
        const SizedBox(height: 10),
        Text("Container Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
            "Là một widget dùng để bao bọc phần tử bên trong, có các thuộc tính giúp trang trí, căn chỉnh, đổi background"),
        ContainerExample(),
        const SizedBox(height: 10),
        Text("Stack Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Cho phép chồng các widget con lên nhau"),
        StackExample(),
        const SizedBox(height: 10),
        Text("ListView Example",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
            "Cho phép hiển thị danh sách các phần tử con của nó theo chiều dọc và có thể scroll được"),
        ListViewExample(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ExpandednFlexible1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(children: <Widget>[
        Container(
          width: 50,
          color: Colors.yellow,
          child: Text('Container'),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text('Expanded'),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            color: Colors.blue,
            child: Text('Flexible, FlexFit.loose'),
          ),
        ),
      ]),
    );
  }
}

class ExpandednFlexible2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(children: <Widget>[
        Container(
          width: 50,
          color: Colors.yellow,
          child: Text('Container'),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text('Expanded'),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            color: Colors.blue,
            child: Text('Flexible, FlexFit.loose'),
          ),
        ),
      ]),
    );
  }
}

class ExpandednFlexible3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Container 1'),
            ),
          ),
          Container(
            width: 100,
            color: Colors.red,
            child: Center(
              child: Text('Container 2'),
            ),
          ),
          Expanded(
            // Expanded Widget
            child: Container(
              color: Colors.green,
              width: 100,
              child: Center(
                child: Text(
                    'Expanded Widget: Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandednFlexible4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Container 1'),
            ),
          ),
          Container(
            width: 100,
            color: Colors.red,
            child: Center(
              child: Text('Container 2'),
            ),
          ),
          Flexible(
            // Expanded Widget
            fit: FlexFit.tight,
            child: Container(
              color: Colors.green,
              width: 100,
              child: Center(
                child: Text(
                    'Flexible Widget, FlexFit.tight,: Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandednFlexible5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Container 1'),
            ),
          ),
          Container(
            width: 100,
            color: Colors.red,
            child: Center(
              child: Text('Container 2'),
            ),
          ),
          Flexible(
            // Expanded Widget
            fit: FlexFit.loose,
            child: Container(
              color: Colors.green,
              width: 100,
              child: Center(
                child: Text(
                    'Flexible Widget FlexFit.loose,: Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowExaple1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            width: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class RowExaple2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            width: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class RowExaple3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            width: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class RowExaple4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            width: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class ColumnExaple1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class ColumnExaple2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class ColumnExaple3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class ColumnExaple4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class WrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: <Widget>[
          Container(
            width: 150,
            color: Colors.yellow,
            child: Text('Container 1'),
          ),
          Container(
            width: 150,
            color: Colors.red,
            child: Text('Container 2'),
          ),
          Container(
            width: 150,
            color: Colors.blue,
            child: Text('Container 3'),
          ),
          Container(
            width: 150,
            color: Colors.orange,
            child: Text('Container 4'),
          ),
          Container(
            width: 150,
            color: Colors.purple,
            child: Text('Container 5'),
          ),
          Container(
            width: 150,
            color: Colors.black,
            child: Text('Container 6'),
          ),
          Container(
            width: 150,
            color: Colors.grey,
            child: Text('Container 7'),
          ),
          Container(
            width: 150,
            color: Colors.pink,
            child: Text('Container 8'),
          ),
        ],
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Text(
            'Container with margin, border, borderRadius, width and height'),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 90,
          color: Colors.green,
        ),
        Container(
          width: 100,
          height: 80,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: <Widget>[
          Container(
            height: 250,
            color: Colors.yellow,
            child: const Center(child: Text('Container 1')),
          ),
          Container(
            height: 250,
            color: Colors.red,
            child: const Center(child: Text('Container 2')),
          ),
          Container(
            height: 250,
            color: Colors.blue,
            child: const Center(child: Text('Container 3')),
          ),
        ],
      ),
    );
  }
}
