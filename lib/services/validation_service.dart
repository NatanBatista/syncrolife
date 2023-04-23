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

  static String crmFormatter(String crm) {
    String formattedCRM = crm.replaceAll(
        RegExp('^0+|[^a-zA-Z0-9]+'), ''); // remove simbolos e zeros a esquerdas
    formattedCRM = formattedCRM.toUpperCase();
    switch (formattedCRM.length) {
      case 1:
        return '00000000-0/0${formattedCRM.substring(1)}';
      case 2:
        return '00000000-0/${formattedCRM.substring(0, 2)}';
      case 3:
        return '00000000-${formattedCRM.substring(0, 1)}/${formattedCRM.substring(1, 3)}';
      case 4:
        return '0000000${formattedCRM.substring(0, 1)}-${formattedCRM.substring(1, 2)}/${formattedCRM.substring(2, 4)}';
      case 5:
        return '000000${formattedCRM.substring(0, 2)}-${formattedCRM.substring(2, 3)}/${formattedCRM.substring(3, 5)}';
      case 6:
        return '00000${formattedCRM.substring(0, 3)}-${formattedCRM.substring(3, 4)}/${formattedCRM.substring(4, 6)}';
      case 7:
        return '0000${formattedCRM.substring(0, 4)}-${formattedCRM.substring(4, 5)}/${formattedCRM.substring(5, 7)}';
      case 8:
        return '000${formattedCRM.substring(0, 5)}-${formattedCRM.substring(5, 6)}/${formattedCRM.substring(6, 8)}';
      case 9:
        return '00${formattedCRM.substring(0, 6)}-${formattedCRM.substring(6, 7)}/${formattedCRM.substring(7, 9)}';
      case 10:
        return '0${formattedCRM.substring(0, 7)}-${formattedCRM.substring(7, 8)}/${formattedCRM.substring(8, 10)}';
      default:
        return '${formattedCRM.substring(0, 8)}-${formattedCRM.substring(8, 9)}/${formattedCRM.substring(9, 11)}';
    }
  }

  static isValidCrm(String crm) {
    List<String> ufList = [
      'AC',
      'AL',
      'AP',
      'AM',
      'BA',
      'CE',
      'DF',
      'ES',
      'GO',
      'MA',
      'MT',
      'MS',
      'MG',
      'PA',
      'PB',
      'PR',
      'PE',
      'PI',
      'RJ',
      'RN',
      'RS',
      'RO',
      'RR',
      'SC',
      'SP',
      'SE',
      'TO'
    ];

    String formattedCRM = crm.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    if (formattedCRM.length > 10) {
      String uf = formattedCRM.substring(9, 11);
      try {
        // Converte os 9 primeiros digitos em num
        int num =
            int.parse(formattedCRM.substring(0, 9)); // Se falhar, CRM inválido
        if (num != 0 && ufList.contains(uf)) {
          //Testa se os 9 primeiros digitos sao diferentes de 0
          // e se os dois ultimos (UF) estão contitos na lista ufList
          return true; // Se tudo isso acontecer, retorna true
        } else {
          return false;
        }
      } catch (e) {
        return false; //Se o try falhar, retorna false
      }
    } else {
      return false;
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
