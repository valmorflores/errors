
import 'dart:convert';
import 'dart:io';

class Database {

   String path;
   String version;

   Database( {path} );

      execute( String query ){
        print( 'execute');
      }

      insert( String tabela, Map<String, dynamic> aCampos ){
        String cInfo = '';
        aCampos.forEach((item,a)=>cInfo=cInfo+( cInfo!=''?',':'')+' "' + 
                    item + '" : "' + a.toString() + '" ' + '\n' );
        this.save( '{ "' + tabela + '" : ' + '{' + cInfo + '}' + ' }' );
      }

      update( String tabela, aCampos, {where, whereArgs} ){
        print( 'update');
      }

      query(table, {columns, where, whereArgs}) async {
       /* columns: [columnId, columnToken, columnProfile, columnFrequency],
        where: '$columnId = ?',
        whereArgs: [id]) */
        Map<String, dynamic> dataResult;
        String jsonString = await read();
        Map<String, dynamic> dataJson = jsonDecode(jsonString);
        dataJson.forEach((key, value) 
           {print(key);
              dataResult = value;
              // Fields from tables
              value.forEach((nkey, nvalue){
                if ( nkey.toString() == 'profile' ) {
                  dataResult['profile'] = nvalue.toString();
                  print(nkey.toString()+'='+nvalue.toString());
                }
                if ( nkey.toString() == 'token' ) {
                  dataResult['token'] = nvalue.toString();
                  print(nkey.toString()+'='+nvalue.toString());
                }
                print('seguindo a vida');
              });
            });
        // Conteudo mapeado da raiz {'profiles':{'field1':'data', 'field2':'data2'}}
        // result = {'field1':'data', 'field2':'data2'}
        if ( dataResult != null )
           return dataResult;
      }
      
      List<Map>rawQuery( String cQuery, aFields ){
        return [];
      }

      read() async {
        try {
          final file = File('${path}');
          String text = await file.readAsString();
          return text;
        } catch (e) {
          print("Couldn't read file");
        }
      }

      save( String text ) async {
        final file = File('${path}');
        print('Saving to ' + path);
        await file.writeAsString(text);
      }

      fileExists() {
         return File( path ).exists();
      }

      openDatabase( {path, version, onCreate} ){
         print('open database');
         return true;
      }

   }