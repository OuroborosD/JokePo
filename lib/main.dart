import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Jogo() ,
  ));
}




class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
    String _imaIa = 'images/padrao.png';
    String res = 'Escolha uma opção';

  String _resultado = '';
   void jogo(String escolha){
     List _ia = ['pedra','papel','tesoura'];
     var resultadoIa = Random().nextInt(3);

     print('------------------------------------');
     print('você escolheu $escolha  e o inimigo ${_ia[resultadoIa]}');
     switch(_ia[resultadoIa]){
       case 'pedra':
         _imaIa  = 'images/pedra.png';
         break;
       case 'tesoura':
         _imaIa = 'images/tesoura.png';
         break;
       case 'papel':
         _imaIa = 'images/papel.png';
     }
     if( escolha == _ia[resultadoIa]){
       setState(() {
          res = 'Empate!';
       });
     }else if(escolha == 'papel' && _ia[resultadoIa] == 'tesoura' ){

       setState(() {
         res =' você perdeu!';
       });
     }
     else if(escolha == 'papel' && _ia[resultadoIa] == 'pedra' ){
       setState(() {
         res = 'ganhou!';
       });
     }
     else if(escolha == 'pedra' && _ia[resultadoIa] == 'tesoura' ){
       setState(() {
         res = 'ganhou!';
       });
     }
     else if(escolha == 'pedra' && _ia[resultadoIa] == 'papel' ){
       setState(() {
         res = 'perdeu!';
       });
     }
     else if(escolha == 'tesoura' && _ia[resultadoIa] == 'padra' ){
       setState(() {
         res = 'perdeu!';
       });
     }
     else if(escolha == 'tesoura' && _ia[resultadoIa] == 'papel' ){
       setState(() {
         res = 'ganhou!';
       });
     }




   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('vamos jogar jokenPO'),
      ),
      body: Container(
         width: double.infinity,
         child: Column(
           children: <Widget>[
             Padding( padding: EdgeInsets.fromLTRB(10, 30,10,10),
              child: Text('escolha do app:',
                      style: TextStyle( // para editar o fonte
                          fontSize: 22,
                          fontWeight: FontWeight.bold
              ) ,),),
             Image.asset('$_imaIa',
             width: 90,
             ),
             Padding(padding: EdgeInsets.fromLTRB(10, 20,10 ,20),
              child: Text(res,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),),),
             Padding(padding: EdgeInsets.all(10),
                     child: Row(
                       children: <Widget>[
                         FlatButton(onPressed: (){
                           jogo('papel');
                         },// end of onPressed
                         child: Image.asset('images/papel.png',
                                width: 80 ,
                         ),),
                        FlatButton(onPressed: (){
                          jogo('pedra');
                        },//ond of onPressed
                        child: Image.asset('images/pedra.png',
                          width: 80,
                        ),),
                         FlatButton(onPressed: (){
                           jogo('tesoura');
                         },// end onPressed
                             child:Image.asset('images/tesoura.png',
                                   width: 80,
                                 )

                         ),

                       ],),),
           ],
         ),
      ),
    );
  }
}
