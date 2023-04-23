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
    String formattedCRM = crm.replaceAll(RegExp(r'[^a-zA-Z0-9]'),
        ''); // remove tudo que não for letra nem número
    formattedCRM = formattedCRM.toUpperCase();
    if (formattedCRM.length > 11) {
      return '${formattedCRM.substring(0, 8)}-${formattedCRM.substring(8, 9)}/${formattedCRM.substring(9, 11)}';
    } else if (formattedCRM.length > 9) {
      return '${formattedCRM.substring(0, 8)}-${formattedCRM.substring(8, 9)}/${formattedCRM.substring(9)}';
    } else if (formattedCRM.length > 8) {
      return '${formattedCRM.substring(0, 8)}-${formattedCRM.substring(8)}';
    }

    return formattedCRM;
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
