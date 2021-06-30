import 'dart:io';
import 'package:aes_crypt/aes_crypt.dart';

void EncryptFile({password, srcFilepath, distFilepath}) {
  var crypt = new AesCrypt(password);
  String encFilepath;
  crypt.setOverwriteMode(AesCryptOwMode.warn);
  try {
    encFilepath = crypt.encryptFileSync(srcFilepath, distFilepath);
    print('The encryption has been completed successfully.');
    print(encFilepath);
  } on AesCryptException catch (e) {
    // It goes here if overwrite mode set as 'AesCryptFnMode.warn'
    // and encrypted file already exists.
    if (e.type == AesCryptExceptionType.destFileExists) {
      print('The encryption has been completed unsuccessfully.');
      print(e.message);
    }
    return;
  }
}

void DecryptFile({srcFilepath, password, distFilepath}) {
  var crypt = new AesCrypt(password);
  String decFilepath;
  try {
    // Decrypts the file to the same name as previous one but before sets
    // another overwrite mode 'AesCryptFnMode.auto'. See what will happens.
    crypt.setOverwriteMode(AesCryptOwMode.rename);
    decFilepath = crypt.decryptFileSync(srcFilepath, distFilepath);
    print('The decryption has been completed successfully.');
    //print('Decrypted file 3: $decFilepath');
    //print('File content: ' + File(decFilepath).readAsStringSync() + '\n');
  } on AesCryptException catch (e) {
    if (e.type == AesCryptExceptionType.destFileExists) {
      print('The decryption has been completed unsuccessfully.');
      // print(e.message);
    }
  }
}
