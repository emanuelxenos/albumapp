import 'package:albumapp/app/fwc_album_app.dart';
import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(FwcAlbumApp());
}
