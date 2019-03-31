import 'package:flutter/material.dart';
import 'package:flutter_product/pages/home/popular.dart';
import 'package:flutter_product/pages/home/stay.dart';
import 'package:flutter_product/pages/home/home_slider.dart';
import 'package:flutter_product/pages/home/visit.dart';
import 'package:flutter_product/pages/home/food_drink.dart';
import 'package:flutter_product/utils/constants.dart';
import 'package:flutter_product/utils/icon_font.dart';
import 'package:flutter_product/widgets/fade_in.dart';
import 'package:flutter_product/widgets/text_input.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;
  double offset = 0.0;
  final List<Map<String, dynamic>> visits = [
    {
      "title": "រូបសំណាកនាគរាជសន្តិភាព និងអភិវឌ្ឍន៍",
      "postedDate": "ខែ​កញ្ញា ២៦, ២០១៨",
      // "image": Constants.images.img001,
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/09/41737761_2134238303508806_9079148632782929920_n-450x440.jpg",
      "content":
          "រូបសំណាកនាគរាជសន្តិភាព និងអភិវឌ្ឍន៍រូបសំណាកនេះត្រូវបានសម្ពោធនៅថ្ងៃទី២៧ ខែកញ្ញា ឆ្នាំ២០០៧ មានពណ៏ខ្មៅផលិត ពីអាវុធជាតិផ្ទុះជាច្រើនប្រភេទ ដែលបានប្រមូលរយៈពេលពីរឆ្នាំពីប្រជាពលរដ្ឋ មន្រ្តីរាជការកងកម្លាំងប្រដាប់អាវុធដោយអាជ្ញាធរខេត្ត ក្រោមការឩបត្ថម្ភពីរដ្ឋាភិបាលជប៉ុនហៅកាត់ថា( ចេសាក់) ។ រូបសំណាក់នេះរំលឹកអំពីការប្តេជ្ញាចិត្ត ការខិតខំប្រឹងប្រែងនិងក្តីសង្ឃឹមរបស់ពលរដ្ឋនៅក្នុងខេត្តបាត់ដំបង ក្នុងការលុបបំបាត់អំពើហឹង្សាកន្លងមក ហើយបានកសាងសង្គមមួយដែលគ្មានអំពើហឹង្សា ។"
    },
    {
      "title": "អគារសាលាខេត្តបាត់ដំបង",
      "postedDate": "ខែ​កញ្ញា ២៦, ២០១៨",
      // "image": Constants.images.img002,
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/09/pro-743x440.png",
      "content":
          "អតីតអគារសាលាខេត្តបាត់ដំបងដំបង ដែលមានអាយុកាល ១១៣ឆ្នាំ (១៩០៥-២០១៨) អតីតអគារសាលាខេត្តបាត់ដំបង បានកសាងឡើងនៅក្នុងសម័យលោកម្ចាស់កថាថន ឈុំ ពេលដែលខេត្តបាត់ដំបងស្ថិតក្រោមការគ្រប់គ្រងរបស់ថៃ ពីឆ្នាំ១៧៩៥ ដល់១៩០៧ (លោកម្ចាស់កថាថន ឈុំ គឺជាពូជពង្សរបស់ចៅហ្វាបែន ដែលបានគ្រប់គ្រងខេត្តបាត់ដំបងរហូត ៥ ជំនាន់តៗគ្នា)។ ក្នុងឆ្នាំ១៩០៥ ស្ដេចត្រាញ់ កថាថន ឈុំ បានជួលស្ថាបត្យករអ៊ីតាលីពីទីក្រុងបាងកកឲ្យមកសាងសង់អគារនេះឡើងសម្រាប់ធ្វើជាលំនៅឋានផ្ទាល់ខ្លួន ប៉ុន្តែក្នុងឆ្នាំ១៩០៧ ពេលដែលបារាំងទាមទារបានខេត្តទាំងបី រួមមានខេត្តបាត់ដំបង សិរីសោភណ្ឌ (ស្វាយស៊ីសុផុន) និងអង្គរ (សៀមរាប) ពីថៃមកឲ្យកម្ពុជាវិញ ស្ដេចត្រាញ់រូបនេះក៏បានលក់លំនៅឋានរបស់លោកទាំងអស់ រួមទាំងអាគារនេះផង ដែលលោកមិនទាន់បានរស់នៅនៅឡើយ ឲ្យមកអាជ្ញាធរបារាំង ។ អគារនេះក៏ត្រូវបានប្រើប្រាស់ជាកន្លែងធ្វើការ និងកន្លែងស្នាក់នៅរបស់មន្ត្រីជាន់ខ្ពស់បារាំង និងក្រោយមកជាសាលាខេត្តបាត់ដំបង រហូតមកដល់ឆ្នាំ២០០៥ ។ បច្ចុប្បន្នអាជ្ញាធរខេត្តបាន រៀបចំអតីតអគារសាលាខេត្តនេះឲ្យទៅជាសារមន្ទីរបេតិកភ័ណរបស់ខេត្ត ដើម្បីឲ្យភ្ញៀវជាតិ និងអន្តរជាតិចូលទស្សនាកម្សាន្ត ដោយមានការដាក់តាំងរូបភាព ទស្សនីយភាពផ្សេងៗដែលកើតឡើងក្នុងសម័យគ្រប់គ្រងដោយលោកម្ចាស់នីមួយៗរហូត ដល់ឆ្នាំ១៩០៧ និងក្នុងសម័យអាណានិគមនិយមបារាំង។ ។"
    },
    {
      "title": "ប្រវត្តិនិងអត្ថន័យពិធីបុណ្យអុំទូក",
      "postedDate": "ខែ​សីហា ១៥, ២០១៨",
      // "image": Constants.images.img003,
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/08/water-festival-btb1-752x440.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
  ];
  final List<Map<String, dynamic>> stays = [
    {
      "title": "សណ្ឋាគារខេមរាបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៤, ២០១៨",
      // "image": Constants.images.img001,
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/Front.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្�������������ឡើង។ បុណ្យនេះមានដើមកំណើ��������ាំងពីបុរាណកា��មក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "រីសត RAVORN VILLA Boutique​ ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៤, ២០១៨",
      // "image": Constants.images.img002,
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/Ravorn20.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "សណ្ឋាគារ ក្លាស់ស៊ី និង​ស្ប៉ាក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៤, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/38762539.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "សណ្ឋាគារ Sophea Hostel ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៤, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/crw-800h-500a-cc1.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
  ];
  final List<Map<String, dynamic>> foodAndDrinks = [
    {
      "title": "ភោជនីយដ្ឋាន Choco L’Art Cafe ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៦, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/coco4-388x220.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "ភោជនីយដ្ឋាន Jaan Bai ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៦, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/chaan.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "ភោជនីយដ្ឋាន Delicious ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៦, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/getlstd-property-photo2.jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "ភោជនីយដ្ឋាន Creperie ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៥, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/creperie4.png",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុក���្���ុ���ឯ���ស���រ���ាតិ និង អន្តរជាតិ ឬត���មសិលាចារ����� នៃប្រាសាទនានាជាដើម ។"
    },
    {
      "title": "ភោជនីយដ្ឋាន White Rose ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៤, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/Battambang-Cambodia..jpg",
      "content":
          "ប្រវត្តិសាស្ត្របានបញ្ជាក់ថានៅ ” ថ្ងៃ ១៤-១៥ កើតខែអស្សុជ និង ១ រោជខែកក្ដិក ” ពិធីអុំទូក អកអំបុក បណ្ដែតប្រទីប ជាបុណ្យប្រពៃណីជាតិដ៏ធំមួយបានប្រារព្ធឡើង។ បុណ្យនេះមានដើមកំណើតតាំងពីបុរាណកាលមក ដែលយើងឃើញមានការចែងទុកក្នុងឯកសារជាតិ និង អន្តរជាតិ ឬតាមសិលាចារឹក នៃប្រាសាទនានាជាដើម ។"
    },
  ];
  final List<Map<String, dynamic>> populars = [
    {
      "title": "ប្រាសាទស្នឹងក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មិថុនា ២០, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/06/snueng-752x440.jpg",
      "content": "content"
    },
    {
      "title": "អគារសាលាខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មិថុនា ២០, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/09/pro-743x440.png",
      "content": "content"
    },
    {
      "title": "ស្ថិតិភ្ញៀវទេសចរបុណ្យចូលឆ្នាំប្រពៃណីជាតិខ្មែរខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ២០, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/new-year1.jpg",
      "content": "content"
    },
    {
      "title": "ខេត្តបាត់ដំបងសូមស្វាគមន៍",
      "postedDate": "ខែ​សីហា ៨, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/08/ta-752x440.jpg",
      "content": "content"
    },
    {
      "title": "ភោជនីយដ្ឋាន Choco L’Art Cafe ក្នុងខេត្តបាត់ដំបង",
      "postedDate": "ខែ​មេសា ៦, ២០១៨",
      "image":
          "https://www.tourismbattambang.org/wp-content/uploads/2018/04/coco4.jpg",
      "content": "content"
    }
  ];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      offset = _controller.offset;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          elevation: 1,
          expandedHeight: 230.0,
          backgroundColor: Colors.white,
          floating: false,
          leading: Container(),
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                offset < 139
                    ? FadeIn(
                        child: Container(
                          width: 60,
                          child: Image(
                            image: AssetImage(Constants.images.ministryLogo),
                          ),
                        ),
                      )
                    : Container(),
                Text(
                  "មន្ទីរទេសចរណ៍ខេត្តបាត់ដំបង",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              CustomTextInput(
                filled: false,
                suffixIcon: FeatherIcons.search,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: HomeSliderWidget(
                    images: [
                      {"url": visits[0]["image"], "title": visits[0]["title"]},
                      {"url": visits[1]["image"], "title": visits[1]["title"]},
                      {"url": visits[2]["image"], "title": visits[2]["title"]}
                    ],
                  ),
                ),
              ),
              VisitWidget(visits: visits),
              StayWidget(
                stays: stays,
              ),
              FoodAndDrinkWidget(foodAndDrinks: foodAndDrinks),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "ពេញនិយម",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopularWidget(
                  imageUrl: populars[index]["image"],
                  title: populars[index]["title"],
                ),
              );
            },
            childCount: populars.length,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton({String text, IconData icon}) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black38,
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Icon(
                      icon,
                      size: 40,
                    ),
                  ),
                  Text(text)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Future getTest() async {
//   var url = 'http://192.168.0.106:3000/test';
//   return await http.post(url, body: {
//     "test1": "PR",
//     "test2": "LK",
//   }).then((http.Response response) {
//     return jsonDecode(response.body);
//   }).catchError((err) => err);
// }

class FlexibleAppBar extends SliverAppBar {
  static const double height = 256.0;

  FlexibleAppBar(String title, String imageUrl)
      : super(
          pinned: true,
          expandedHeight: height,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            background: _buildBackground(imageUrl),
          ),
        );

  static Widget _buildBackground(String imageUrl) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Image.network(imageUrl, fit: BoxFit.cover, height: height),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.5, 0.6),
            end: FractionalOffset(0.5, 1.0),
            colors: <Color>[Color(0x00000000), Color(0x70000000)],
          ),
        ),
      ),
    ]);
  }
}
