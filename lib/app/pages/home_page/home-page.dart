import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: ClipPath(
          clipper: AppBarCustom(),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _createAppBarButton(
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.grey[200],
                  ),
                  _createAppBarButton(
                    icon: Icon(Icons.swap_vert, color: Colors.grey),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  _createAppBarButton(
                    icon: Icon(Icons.notifications, color: Colors.grey),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  _createAppBarButton(
                    icon: Icon(Icons.person, color: Colors.grey),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black.withOpacity(.5),
                backgroundImage: AssetImage("assets/images/userbank.jpg"),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(45, 12, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Jhon Doe",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage("assets/images/uk.jpeg"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixText: "USD",
                        suffixStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        prefixText: "\$",
                        prefixStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      string: "Send",
                      color: Color(0xff5C6CF3),
                      fontColor: Colors.white,
                      onTap: () => Navigator.pushNamed(context, "/payment"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: _buildButton(
                      color: Colors.white,
                      fontColor: Colors.black,
                      string: "Request",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipPath(
        clipper: ClipedBottom(),
        child: Container(
          height: 350,
          color: Color(0xff5C6CF3),
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            childAspectRatio: 2,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: [
              _buildItemGrid("1", () {}),
              _buildItemGrid("2", () {}),
              _buildItemGrid("3", () {}),
              _buildItemGrid("4", () {}),
              _buildItemGrid("5", () {}),
              _buildItemGrid("6", () {}),
              _buildItemGrid("7", () {}),
              _buildItemGrid("8", () {}),
              _buildItemGrid("9", () {}),
              _buildItemGrid(".", () {}),
              _buildItemGrid("0", () {}),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Container(
                    child: Icon(
                      Icons.backspace_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemGrid(String value, void Function() onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            "$value",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    String string,
    Color color,
    Color fontColor,
    void Function() onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  color: fontColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    string,
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _createAppBarButton({
  @required Widget icon,
  @required void Function() onPressed,
  Color color,
}) {
  return FloatingActionButton(
    heroTag: icon,
    backgroundColor: color ?? Color(0xff5C6CF3),
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: BorderSide(
        color: Colors.grey.shade300,
      ),
    ),
    elevation: 0,
    child: icon,
    highlightElevation: 4,
  );
}

class AppBarCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.60);
    path.quadraticBezierTo(
      0,
      size.height * 0.8,
      size.width * 0.1,
      size.height * 0.8,
    );

    path.lineTo(size.width * 0.9, size.height * 0.8);

    path.quadraticBezierTo(
      size.width,
      size.height * 0.8,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ClipedBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.quadraticBezierTo(
      0,
      size.height * .1,
      size.width * 0.1,
      size.height * .1,
    );
    path.lineTo(size.width * 0.9, size.height * .1);
    path.quadraticBezierTo(
      size.width,
      size.height * .1,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
