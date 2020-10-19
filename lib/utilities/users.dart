import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name,email,imageURL;

Future<String> signInWithGoogle() async
{
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(user.email!=null);
  assert(user.displayName!=null);
  assert(user.photoUrl!=null);

  email = user.email;
  name = user.displayName;
  imageURL = user.photoUrl;
  print("Name Here : "+name);
  final FirebaseUser currentuser = await _auth.currentUser();
  assert(user.uid == currentuser.uid);
  SharedPreferences preferences1 = await SharedPreferences.getInstance();
  SharedPreferences preferences2 = await SharedPreferences.getInstance();
  SharedPreferences preferences3 = await SharedPreferences.getInstance();
  preferences1.setString('email', email);
  preferences2.setString('name', name);
  preferences3.setString('image', imageURL);
//  print("Name Here"+name);
  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle()async
{
  SharedPreferences preferences1 = await SharedPreferences.getInstance();
  SharedPreferences preferences2 = await SharedPreferences.getInstance();
  SharedPreferences preferences3 = await SharedPreferences.getInstance();
  preferences1.remove('email');
  preferences2.remove('name');
  preferences3.remove('image');
  await googleSignIn.signOut();
  print("user signed out");
}
