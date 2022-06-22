import 'package:m_sport/features/program_page/domain/entities/program_page_entity.dart';
import 'package:m_sport/features/program_page/domain/usecases/get_program_page.dart';
import 'package:m_sport/core/stores/entity_store.dart';
import 'package:mobx/mobx.dart';

part 'program_page_store.g.dart';

class ProgramPageStore = _ProgramPageStore with _$ProgramPageStore;

abstract class _ProgramPageStore extends EntityStore<ProgramPageEntity> with Store {
  final GetProgramPage getProgramPage;

  _ProgramPageStore(this.getProgramPage);

  @override
  fetchEntity([LoadParams? params]) {
    return getProgramPage(ProgramPageParams(id: params?.params!['id'] as int));
  }

  void loadPragramPage(int id) {
    loadEntity(LoadParams({'id': id}));
  }
}