import 'package:flutter/material.dart';

import '../../styles.dart';
import '../../widgets/elevated_button_icon_widget.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text("Marcar consulta com",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/medico.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hugo Oliveira', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                        Text('Especialidade'),
                        Text('CRM'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Data', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      IconButton(onPressed: () {}, icon: Icon(Icons.mp_sharp))
                    ],
                  ), 
                  Column(
                    children: [
                      Text('Hora',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      IconButton(onPressed: () {}, icon: Icon(Icons.mp_sharp))
                    ],
                  )],
                ),
            ),
            Container(
              color: Color.fromRGBO(240, 230, 239, 1),
              height: 145,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    
                    child: Text('Forma de Pagamento', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Cartão de Crédito', style: TextStyle(
                        color: Color.fromRGBO(122, 135, 251, 1)
                        ),
                      ),
                      Text('Editar', style: TextStyle(
                        color: Color.fromRGBO(122, 135, 251, 1)
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox( height: 230,),
            CustomButtonIcon(
                  buttonText: "Agendar",
                  buttonColor: cornflowerBlue,
                  textColor: lavenderBlush,
                  onPressed: () {},
                  icone: const Icon(Icons.login),
                ),
          ],
        ),
      ),
    );
  }
}
