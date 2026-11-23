import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yemek_yapma/oyun_yemek_yapma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yemekYapmaConfig.title.length, 33);
    expect(yemekYapmaConfig.tagline.length, 33);
    for (final s in yemekYapmaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(yemekYapmaConfig.gameId, yemekYapmaId);
    expect(yemekYapmaRules.gameId, yemekYapmaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yemekYapmaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yemekYapmaId, optionalMechanics: yemekYapmaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yemekYapmaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
