//面向对象学习
class Person {
  String name;
  int age;

  //标准构造方法
  Person(this.name, this.age);

  //重载父类的toString方法 也是多态的重要体现
  @override
  String toString() {
    return "name=$name,age=$age";
  }
}

class Worker extends Person {
  String workType;
  final String workAddress;
  String companyName;
  double _salary;

  set salary(double value) => _salary = value;

  get salary => _salary;

//  Avoid wrapping fields in getter and setter just to be safe

  //通过this来初始化子类字段，将其他字段交由父类初始化,这里指定了companyName的初始化。
  //如果要初始化变量，那么其不可以在构造方法中定义
  Worker(this.workType, this.workAddress, String name, int age)
      : companyName = "world",
        super(name, age);

  //命名构造函数
  Worker.begin(Worker work, this.workAddress) : super(work.name, work.age) {
    print("命名构造函数");
  }

  //假如有变量final String workAddress，那么就需要在构造方法中指定：
  //Worker.begin(Worker work,this. workAddress) : super(work.name, work.age) {
  //  print("命名构造函数");
  //}

  factory Worker.workHard(Worker work) {
    return Worker.begin(work, "");
  }
}

//工厂构造
class Logger {
  static Logger _logger;

  factory Logger() {
    if (_logger == null) {
      _logger = Logger._initInstance();
    }
    return _logger;
  }

  Logger._initInstance();
}

//抽象类
abstract class Animal {
  //抽象方法
  void eat();
}

//实现抽象类
class Dog extends Animal {
  //实现eat方法
  @override
  void eat() {
    print("啃骨头");
  }
}

//声明mixins类
class Pig {
  void action() {
    print("吃完就睡");
  }
}

//使用mixins类，可以复用它的action方法
class Cat extends Animal with Pig {
  @override
  void action() {
    print("抓老鼠");
  }

  @override
  void eat() {
    print("吃猫粮");
  }
}
