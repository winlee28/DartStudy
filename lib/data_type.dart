import 'package:flutter/material.dart';

///数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapList();
    return Container();
  }

  void _numType() {
    num num1 = -2.0; //定义为小数
    num num2 = 4; //定义num为你太
    int num3 = 5; //只能是整数
    double num4 = 6.0; //只能是双精度

    print(num1.abs()); // 取绝对值 输出 2.0
    print(num2.toDouble()); // 转为小数 输出4.0
    print(num3.toString()); // 转为字符串 输出"5"
    print(num4.toInt()); // 转为整数 输出 6
  }

  void _stringType() {
    String str1 = 'str1',
        str2 = "str2"; //定义字符串str1和str2
    String str3 = "字符串数据类型"; //定义字符串str3
    String str4 = 'str1=$str1;str2=$str2'; //通过$符拼接字符串
    String str5 = "str1=" + str1 + " str3=" + str3; //通过+号拼接字符串

    print(str3.substring(1, 5)); //符串数据 输出 符串数据
    print(str3.indexOf("数据")); // 获取位置 输出 3
    print(str3.startsWith("字")); //匹配起始字符串 true
    print(str3.replaceAll("字符串", "dart的String")); //替换 输出dart的String数据类型
    print(str3.split("数")); //切够字符串 输出[字符串，据类型]
  }

  void _boolType() {
    bool success = true; //定义bool值为true
    bool failure = false; //定义bool值为false

    print(success || failure); //或运算 输出 true
    print(success && failure); //且运算 输出 false
  }

  void _listType() {
    List list = [1, 2, 3, "list"]; //范型为dynamic
    //报 type 'List<dynamic>' is not a subtype of type 'List<int>' 异常
    //因为指定了intList的范型为int 但是list的范型为dynamic，随意赋值失败
//    List<int> intList = list;
    List<int> intList2 = [1, 2, 3, 4, 5]; //定义int集合
    list.add("hello"); //添加单一元素
    list.addAll(intList2); //添加集合
    print(list); //输出 [1, 2, 3, "list","hello",1, 2, 3, 4, 5]

    List<String> strList =
    List.generate(2, (index) => "我是第$index个元素"); //通过generate定义一个String集合
    print(strList); //输出 [我是第0个元素, 我是第1个元素]

    //遍历集合
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }

    for (var data in list) {
      print(data);
    }

    list.forEach((it) {
      print(it);
    });
    //1, 2, 3, "list","hello",1, 2, 3, 4, 5
  }

  void _mapList() {
    Map map = {"lisi": 20, "zhangsan": 24}; //直接通过 {key:value} 方式定义
    Map map2 = {};
    map2[11] = 20;
    map2["zhangsan"] = "24";
    //上面两个效果是一样的且都没有指定范型。

    Map<int, int> intMap = {1: 2, 3: 4}; //指定map的范型

    map.forEach((key, value) {
      print(
          "key:$key,value:$value"); //输出 key:lisi,value:20 和 key:zhangsan,value:24
    });

    map.map((key, value) {
      return MapEntry(value, key); //返回一个新的map对象，我们将key value颠倒返回
    }).forEach((key, value) {
      print("key:$key,value:$value"); //输出 key:20,value:lisi 和 key:24,value:zhangsan
    });

    for(var key in map.keys){ //遍历map的key元素 同理还可以遍历map.values
      print(key); //输出 lisi 和 zhangsan
    }


    ///dynamic：是所有Dart对象的基础类型， 在大多数情况下，通常不直接使用它，
    ///通过它定义的变量会关闭类型检查，这意味着 dynamic x = 'hal';x.foo();
    ///这段代码静态类型检查不会报错，但是运行时会crash，因为x并没有foo()方法，所以建议大家在编程时不要直接使用dynamic；
    ///var：是一个关键字，意思是“我不关心这里的类型是什么。”，系统会自动推断类型runtimeType；
    ///Object：是Dart对象的基类，当你定义：Object o=xxx；时这时候系统会认为o是个对象，你可以调用o的toString()和hashCode()方法
    ///因为Object提供了这些方法，但是如果你尝试调用o.foo()时，静态类型检查会进行报错；
    ///综上不难看出dynamic与Object的最大的区别是在静态类型检查上；
  }
}
