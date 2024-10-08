import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/home/widget/offer_list_view.dart';
import 'package:webbing_fixed/features_user/home/widget/serviec_grid_view.dart';
import '../home_export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpeechToText speech;
  bool isListening = false;
  String _searchText = "search_hint".tr();
  String recognizedText = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<HomeUserCubit>(context);
    cubit.fetchServices();
    cubit.fetchBestOffer();

    speech = SpeechToText();
    listen();
  }

  Future<void> listen() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() {
        isListening = false;
      });
    }
  }
  void startListening() {
    speech.listen(onResult: (voice) {
      setState(() {
        recognizedText = voice.recognizedWords;
        searchController.text = recognizedText;
      });
    });
    setState(() {
      isListening = true;
    });
  }
  void stopListening() {
    if (isListening) {
      speech.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeUserCubit>(context);

    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomRow(
                leftIconPath1: AssetsManager.iconWallet,
                leftIconPath2: AssetsManager.notification,
                rightIconPath: AssetsManager.iconLocation,
                text: 'location'.tr(),
              ),
              const SizedBox(height: 45),
              Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'need_help'.tr(),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFieldSearch(
                suffixIcon: IconButton(
                  icon: Icon(isListening ? Icons.mic : Icons.mic_none),
                  onPressed: isListening ? stopListening : startListening,
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: _searchText,
                controller: searchController,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferBestPage(),
                        ),
                      ).then((value) {
                        cubit.fetchServices();
                        cubit.fetchBestOffer();
                      });
                    },
                    child: CustomText(
                      text: 'show_all'.tr(),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomText(
                    text: 'offers'.tr(),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const SizedBox(height: 20),
              const BestOffers(),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'choose_service'.tr(),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'best_offers'.tr(),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const ServicesGrid(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

}