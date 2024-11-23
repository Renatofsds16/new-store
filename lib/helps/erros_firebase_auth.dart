String getErrorString(String code){
  switch (code) {
    case 'invalid-credential':
      return 'credenciais invalidas verifique email e senha';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}