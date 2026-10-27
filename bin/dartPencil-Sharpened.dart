abstract class Sharpenable {
  void sharpen();
}

mixin Refillable {
  int refillCount = 3;

  void refill() {
    if (refillCount > 0) {
      refillCount--;
      print('Refill successful! Remaining refills: $refillCount');
    } else {
      print('Out of refills!');
    }
  }
}

class Pencil {
  double graphite;
  String color;
  double _eraser;

  Pencil(this.graphite, this.color, this._eraser);

  double get eraser => _eraser;

  set eraser(double value) {
    if (value >= 0) {
      _eraser = value;
    }
  }

  void sketch() {
    print('The $color pencil is drawing...');
  }

  void erase() {
    if (_eraser > 0) {
      print('The $color pencil is erasing...');
      _eraser -= 0.1;
    } else {
      print('The $color pencil has no eraser left.');
    }
  }

  Future<String> syncDrawingData() async {
    print('[Async task running in background...]');
        
    await Future.delayed(const Duration(seconds: 2));
    return 'Cloud Sync Success: $color pencil artwork data saved successfully!';
  }

  void displayInfo() {
    print('Color: $color');
    print('Graphite: $graphite');
    print('Eraser remaining: ${_eraser.toStringAsFixed(1)}');
  }
}

class ColoredPencil extends Pencil implements Sharpenable {
  String pigmentType;

  ColoredPencil(double graphite, String color, double eraser, this.pigmentType)
      : super(graphite, color, eraser);

  @override
  void sketch() {
    print('Drawing vibrant art with the $color colored pencil ($pigmentType pigment).');
  }

  @override
  void sharpen() {
    graphite += 0.5;
    print('Sharpened $color colored pencil. Graphite restored to $graphite.');
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Pigment Type: $pigmentType');
  }
}

class MechanicalPencil extends Pencil with Refillable implements Sharpenable {
  double leadSize;

  MechanicalPencil(double graphite, String color, double eraser, this.leadSize)
      : super(graphite, color, eraser);

  @override
  void sketch() {
    print('Drafting precise ${leadSize}mm lines with the $color mechanical pencil.');
  }

  @override
  void sharpen() {
    print('Mechanical pencils advance lead instead of sharpening.');
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Lead Size: ${leadSize}mm');
  }
}

class Stapler with Refillable {
  String model;

  Stapler(this.model);

  void staple() {
    print('Stapling documents with model $model.');
  }
}

void main() async {
  ColoredPencil coloredPencil = ColoredPencil(2.0, 'Blue', 1.0, 'Oil-based');
  MechanicalPencil mechPencil = MechanicalPencil(1.5, 'Black', 0.5, 0.5);

  List<Pencil> pencils = [coloredPencil, mechPencil];

  for (Pencil pencil in pencils) {
    pencil.displayInfo();
    pencil.sketch();
    pencil.erase();
    print('------------------------------------');
  }
  coloredPencil.sharpen();
  mechPencil.sharpen();

  print('\n[Mechanical Pencil Refill]');
  mechPencil.refill();

  print('\n[Stapler Refill]');
  Stapler stapler = Stapler('Heavy Duty 200');
  stapler.staple();
  stapler.refill();

  print('\n');
  print('Initiating cloud sync for colored pencil...');

  String syncResult = await coloredPencil.syncDrawingData();

  print('$syncResult');
  print('Execution finished.');
}
