class ValidationService {
  static String _getNumbersOnly(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static bool isValidCPF(String cpf) {
    if (cpf == null || cpf.isEmpty) {
      return false;
    }

    cpf = _getNumbersOnly(cpf); // remove caracteres não numéricos
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

  static String cpfFormatter(String value) {
    if (value.isEmpty) {
      return '';
    }

    String cpf = _getNumbersOnly(value);

    if (cpf.length > 11) {
      cpf = cpf.substring(0, 11);
    }

    if (cpf.length < 4) {
      return cpf;
    } else if (cpf.length < 7) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3)}';
    } else if (cpf.length < 10) {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6)}';
    } else {
      return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
    }
  }

  static String telefoneFormatter(String value) {
    String numbers = _getNumbersOnly(value);
    if (numbers.length > 11) {
      numbers = numbers.substring(0, 11);
    }

    if (numbers.length < 3) {
      return numbers;
    } else if (numbers.length < 8) {
      return '(${numbers.substring(0, 2)}) ${numbers.substring(2)}';
    } else {
      return '(${numbers.substring(0, 2)}) ${numbers.substring(2, 7)}-${numbers.substring(7)}';
    }
  }
}
