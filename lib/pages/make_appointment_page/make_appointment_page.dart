import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/make_appointment_page_controller.dart';
import '../../styles.dart';
import '../../widgets/elevated_button_icon_widget.dart';

class MakeAppointmentPage extends StatefulWidget {
  String idDoctor;
  String name;
  String speciality;
  String crm;
  String image;
  MakeAppointmentPage({
    Key? key,
    required this.idDoctor,
    required this.name,
    required this.speciality,
    required this.crm,
    required this.image,
  }) : super(key: key);

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<MakeAppointmentPageController>(
      init: MakeAppointmentPageController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Marcar consulta com",
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
                    Container(
                      width: 90,
                      height: 124.62,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            //Imagem do médico
                            child: widget.image == ''
                                ? SizedBox()
                                : Image.network(
                                    widget.image,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 130,
                              height: 180,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black54,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(widget.speciality),
                          Text(widget.crm),
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
                        Text('Data',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          child: Text(
                              '${date.day} / ${date.month} / ${date.year}'),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(122, 135, 251, 1)),
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2030));

                            // if 'CANCEL' => null
                            if (newDate == null) return;

                            // If 'OK' => DateTime
                            setState(() => date = newDate);
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Hora',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          child: Text('${time.hour} : ${time.minute}'),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(122, 135, 251, 1)),
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context, initialTime: time);
                            // if 'CANCEL' => null
                            if (newTime == null) return;

                            // If 'OK' => DateTime
                            setState(() => time = newTime);
                          },
                        )
                      ],
                    )
                  ],
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
                      child: Text(
                        'Forma de Pagamento',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Cartão de Crédito',
                          style: TextStyle(
                              color: Color.fromRGBO(122, 135, 251, 1)),
                        ),
                        Text(
                          'Editar',
                          style: TextStyle(
                              color: Color.fromRGBO(122, 135, 251, 1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              CustomButtonIcon(
                buttonText: "Agendar",
                buttonColor: cornflowerBlue,
                textColor: lavenderBlush,
                onPressed: () {
                  _.showAlert(context, widget.idDoctor, date, time);
                },
                icone: const Icon(Icons.assignment_add),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
