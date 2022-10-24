import 'package:get/instance_manager.dart';
import 'package:golang_movie_app/services/movie_controller.dart';

class InitalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieController(), permanent: true);
  }
}
