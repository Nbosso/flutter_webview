import 'package:app/app/home/widgets/web_view_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool showWebView = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('App da Vovó'),
          actions: [
            showWebView ? Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                splashRadius: 15,
                onPressed: (){
                setState(() {
                  showWebView = !showWebView;
                });
              }, icon: const Icon(Icons.chevron_left_rounded)),
            ) : const SizedBox.shrink(),
          ],
        ),
        body: Builder(
          builder: (_) {
            if(showWebView){
              return const CustomWebViewWidget();
            }
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network("https://img.freepik.com/vetores-premium/ilustracao-de-desenho-vetorial-de-avo-fofa-esta-mostrando-algo-no-celular_194552-906.jpg?w=826"),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Nosso aplicativo esta em construção.\nClique no botão abaixo para acessar nosso site e ficar por dentro das novidades.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                    setState(() {
                      showWebView = !showWebView;
                    });
                  },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Text('Acessar site', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  )
                ],
              )),
            );
          }
        ),
      ),
    );
  }
}
