/*This code is personal property of np_group.*/
/*Made by Niraj Phutane a developer*/
/*https://github.com/nirajphutane*/

import 'package:flutter/material.dart';
import 'package:web_tool/API.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String url = 'http://numbersapi.com/random/year';
  bool isLoading = false;
  String response, error;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = url;
    fetchAPI(controller.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebTool'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: isLoading? CircularProgressIndicator(color: Colors.amber):
          response != null? Icon(Icons.done, color: Colors.teal):
          Icon(Icons.close, color: Colors.red),
        onPressed: (){
          fetchAPI(controller.text);
        },
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: controller,
                    onSubmitted: fetchAPI,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.indigo),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                      filled: true,
                      fillColor: Colors.indigoAccent.shade100,
                      border: OutlineInputBorder(),
                      hintText: 'Enter URL',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search, color: Colors.amber),
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.arrow_forward, color: Colors.amber),
                        onTap: (){
                          fetchAPI(controller.text);
                        },
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height/2,
                  ),
                  child: Text(response?? 'No response!'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo),
                    color: Colors.indigoAccent.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                  child: Text(error?? 'No error!'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo),
                    color: Colors.indigoAccent.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void fetchAPI(String url) async {
    try{
      setState(() {
        response = 'No response!';
        error = 'No error!';
      });
      if(url == null || url == ''){
        error = 'Enter URL!';
        return;
      }
      setState(() {
        isLoading = true;
      });
      APIs apis = APIs(httpMethod: APIs.GetMethod, url: url);
      response = await apis.fetchAPI();
    } catch(e){
      error = e.toString();
    } finally{
      setState(() {
        isLoading = false;
      });
    }
  }
}


