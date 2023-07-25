import 'package:matjipmemo/models/firebase/matjip_model.dart';

bool matjipFitSquare(MatjipModel matjipModel) {
  if (matjipModel.visited &&
      !matjipModel.writer.private &&
      !matjipModel.post.invisible &&
      !matjipModel.writer.banned) {
    return true;
  } else {
    return false;
  }
}
