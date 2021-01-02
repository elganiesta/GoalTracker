class FirebaseAuthServices {
  String handleExceptions(String error) {
    String message;
    switch (error) {
      case "The email address is badly formatted.":
        message = "The email address is badly formatted.";
        break;
      case "The password is invalid or the user does not have a password.":
        message = "Your password is wrong.";
        break;
      case "There is no user record corresponding to this identifier. The user may have been deleted.":
        message = "User with this email doesn't exist.";
        break;
      case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
        message = "You have problems with the internet.";
        break;
      case "null":
        message = "Fill the fields to continue.";
        break;
      default:
        message = error;
    }
    return message;
  }
}
