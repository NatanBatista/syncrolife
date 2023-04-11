class ValidationService {
  static bool isValidCPF(String cpf) {
    if (cpf == null || cpf.isEmpty) {
      return false;
    }

    cpf =
        cpf.replaceAll(RegExp(r'[^\d]'), ''); // remove caracteres não numéricos
    if (cpf.length != 11) {
      return false;
    }

    // verifica se todos os dígitos são iguais
    bool allEqual = true;
    for (int i = 1; i < cpf.length; i++) {
      if (cpf[i] != cpf[0]) {
        allEqual = false;
        break;
      }
    }
    if (allEqual) {
      return false;
    }

    // verifica o primeiro dígito verificador
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int digit1 = (sum * 10) % 11;
    if (digit1 == 10) {
      digit1 = 0;
    }
    if (digit1 != int.parse(cpf[9])) {
      return false;
    }

    // verifica o segundo dígito verificador
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    int digit2 = (sum * 10) % 11;
    if (digit2 == 10) {
      digit2 = 0;
    }
    if (digit2 != int.parse(cpf[10])) {
      return false;
    }

    return true;
  }

  static bool isValidEmail(String email) {
    String regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(regex).hasMatch(email);
  }
}
