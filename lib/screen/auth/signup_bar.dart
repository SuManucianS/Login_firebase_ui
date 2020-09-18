import 'package:flutter/material.dart';
import 'package:flutter_loginui/config/Palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignUpBar extends StatelessWidget {
  const SignUpBar ({Key key,@required this.label,@required this.onPressed,@required this.isLoading}) : super(key : key);
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight:  FontWeight.w800,
              color: Palette.darkBlue,
              fontSize: 25
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading : isLoading),
            ),
          ),
          _RoundCountineButton(
            onPressed : onPressed
          )
        ],
      ),
    );
  }
}
class SignInBar extends StatelessWidget{
  const SignInBar({Key key,
  @required this.label,
  @required this.isLoading,
  @required this.onPressed} ) : super(key : key);
  final String label;
  final bool isLoading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.darkBlue,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundCountineButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

/*class SignInBar extends StatelessWidget {
  const SignInBar({
    Key key,
    @required this.label,
    @required this.isLoading,
    @required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.darkBlue,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundCountineButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}*/
class _LoadingIndicator extends StatelessWidget{
  const _LoadingIndicator ({Key key,@required this.isLoading}) : super(key : key);
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Palette.darkBlue,
        ),
      ),
    );
  }
}
class _RoundCountineButton extends StatelessWidget{
  const _RoundCountineButton({Key key, @required this.onPressed}) : super (key : key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Palette.darkBlue,
      splashColor: Palette.darkOrange,
      padding: EdgeInsets.all(20.0),
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.longArrowAltRight,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }
  
}

