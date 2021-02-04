import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetupPaymentPage extends StatefulWidget {
  @override
  _SetupPaymentPageState createState() => _SetupPaymentPageState();
}

class _SetupPaymentPageState extends State<SetupPaymentPage> {
  FocusNode _month = FocusNode();
  FocusNode _year = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: Navigator.of(context).pop,
        ),
        elevation: 0,
        title: Text(
          "Setup Payment",
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff5C6BF3),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff8792F0),
                    width: 1.3,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff4455EA),
                      Color(0xff8792F0),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      offset: Offset(-15, 15),
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Image.asset("assets/images/visa_logo.png"),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      "4276 5842 1111 8014",
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(blurRadius: 3),
                        ],
                        fontSize: 23,
                        wordSpacing: 13,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CARD HOLDER",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Jhon Doe",
                              style: TextStyle(
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 3),
                                ],
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "EXPIRES",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "08/21",
                              style: TextStyle(
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 3),
                                ],
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 500,
          color: Color(0xFFF5F5F5),
          child: Column(
            children: [
              _buildField(
                string: "Your card number",
                child: _buildTextFieldCreditCard(),
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiration date",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  maxLength: 2,
                                  focusNode: _month,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  inputFormatters: [
                                    ExpirationFormatter(
                                      focusNodeNext: _year,
                                      focusNodePrev: _month,
                                      context: context,
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              flex: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  maxLength: 2,
                                  inputFormatters: [
                                    ExpirationFormatter(
                                      context: context,
                                      focusNodeNext: new FocusNode(),
                                      focusNodePrev: _month,
                                    )
                                  ],
                                  focusNode: _year,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CVV",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            maxLength: 3,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              _buildField(
                string: "Card Holder Name",
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Color(0xff5C6BF3),
                  isExtended: true,
                  onPressed: () {},
                  child: Text(
                    "Save Card",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildField({String string, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          string,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldCreditCard() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/visa_logo_blue.png",
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(
                  r"[0-9]|\s",
                ),
                replacementString: "",
              ),
              MaskedTextInputFormatter(
                mask: "0000 0000 0000 0000",
                separator: " ",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpirationFormatter extends TextInputFormatter {
  final FocusNode focusNodeNext;
  final FocusNode focusNodePrev;
  final BuildContext context;

  ExpirationFormatter({
    @required this.context,
    @required this.focusNodeNext,
    @required this.focusNodePrev,
  }) {
    assert(context != null);

    assert(focusNodeNext != null);
    assert(focusNodePrev != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.length == 1 && newValue.text.length == 2) {
      FocusScope.of(context).requestFocus(focusNodeNext);
    } else if (oldValue.text.length == 1 && newValue.text.length == 0) {
      FocusScope.of(context).requestFocus(focusNodePrev);
    }
    return newValue;
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
