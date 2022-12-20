import 'package:flutter/material.dart';


class iconn extends StatelessWidget {

  final Widget iconl;

  iconn(this.iconl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: iconl,
      decoration: BoxDecoration(

          color: Colors.purple,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25) )
      ),
    );
  }
}

class textformfield extends StatefulWidget {


  late String label_name;
  late String hint_name;
  late String name;
  bool is_password;
  final Function takethatvalue;




  textformfield(this.name, this.label_name, this.hint_name, this.is_password, this.takethatvalue);

  @override
  State<textformfield> createState() => _textformfieldState();
}

class _textformfieldState extends State<textformfield> {

  bool _passwordVisible=false;

  // get is_password => false;

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible= false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value){

        var email = widget.name == 'email' ? widget.name: '';
        bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);

        if (value==null || value.isEmpty  ) {
          return 'Dont leave it empty';
        }

      },

      onSaved: (value)=>widget.takethatvalue(value),


    onTap: widget.is_password ?  ()=> setState(() {
      widget.is_password = true;
    }) : null,
      obscureText: widget.is_password ? _passwordVisible: false,
      decoration: InputDecoration(

          suffixIcon: widget.is_password ? IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ) :null,


          labelText: widget.label_name,
          hintText:  widget.hint_name ,

          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25),
              )
          ),
          filled: true,
          fillColor: Colors.white
      ),
    );
  }
}
