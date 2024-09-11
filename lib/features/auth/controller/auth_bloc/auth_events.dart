abstract class AuthenticationEvents {}

class AppStarted extends AuthenticationEvents {}

class SignInWithEmailEvent extends AuthenticationEvents {}

class SignOutEvent extends AuthenticationEvents {}

class SignInWithGoogleEvent extends AuthenticationEvents {}

class SignInWithFacebookEvent extends AuthenticationEvents {}

class SendEmailVerficationEvent extends AuthenticationEvents {}

class ForgetPasswordEvent extends AuthenticationEvents {}

class SignUpEvent extends AuthenticationEvents {}
