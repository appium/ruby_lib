#### v0.13.0 2013-11-22

- [647cb94](https://github.com/appium/ruby_lib/commit/647cb942f344c635e067f2ae563f4fae12685148) Release 0.13.0
- [a235a2c](https://github.com/appium/ruby_lib/commit/a235a2c70d2c7dc1934c9fb403fb95cc3ae56e04) Update name_exact
- [f1d2701](https://github.com/appium/ruby_lib/commit/f1d270120ae248beb6746a0149ebcbe4e34ebcca) names on Android will return the text values when no arg is passed
- [7ac38c9](https://github.com/appium/ruby_lib/commit/7ac38c97b99178f6ae0bf8f7b5474a0cd3379e87) Fix return value of name_exact
- [e6da4aa](https://github.com/appium/ruby_lib/commit/e6da4aa4937bfdc6f094f7895ecf172f8b96f32a) Add textfield_named for iOS
- [789fc52](https://github.com/appium/ruby_lib/commit/789fc5276ad000dafd5a400f3d9aa8cfcd37e17d) Add ios_version method
- [5447f4c](https://github.com/appium/ruby_lib/commit/5447f4cf3645459ddb4335b4a242b7639fc860f8) Rename password to ios_password
- [a5b85de](https://github.com/appium/ruby_lib/commit/a5b85de11e413e301f94d41689658b01342bb1c8) Add scroll_to_exact for Android & more
- [cc7e778](https://github.com/appium/ruby_lib/commit/cc7e778fd1532e5e15ea9933a300189ce8dc9e8a) Default to fastClear: false
- [f54f145](https://github.com/appium/ruby_lib/commit/f54f14551e04517c71d9177fc0bd72797cd77781) Add link to minitest expectations


#### v0.12.0 2013-11-07

- [c92bd37](https://github.com/appium/ruby_lib/commit/c92bd3710be09731aa8ba4547a3e19af9eeaceab) Release 0.12.0
- [f1b7633](https://github.com/appium/ruby_lib/commit/f1b7633e5dcfcd6d0d21f003ce0d98de1d093a13) Add s_texts_names. Fix alert_dismiss_text and alert_accept_text for iOS 7
- [6f2d698](https://github.com/appium/ruby_lib/commit/6f2d6981b1f12443c4079dba455b16d1f331f903) Fix page on iOS 7
- [70dbac3](https://github.com/appium/ruby_lib/commit/70dbac321688dfbec1d5f0a8efe6a7282678b88b) set_wait and no_wait now update @default_wait
- [1f31754](https://github.com/appium/ruby_lib/commit/1f31754386dfd282e1143e3386ba18b1c656bb9d) Restore readme
- [1e7a4c3](https://github.com/appium/ruby_lib/commit/1e7a4c36d1ea0df0ed87a2decbf8793406673774) Update Android page to always output resource-ids


#### v0.11.1 2013-09-24

- [0551d9a](https://github.com/appium/ruby_lib/commit/0551d9a4de2cb3d62efe63a87b01c15526202336) Release 0.11.1
- [283040e](https://github.com/appium/ruby_lib/commit/283040e7227b7838124e835578d549fadc101cdc) Fix s_texts method overloading


#### v0.11.0 2013-09-24

- [948074c](https://github.com/appium/ruby_lib/commit/948074c44917029fb27b08ed582c90d7f73a7cde) Release 0.11.0
- [a0dfe2c](https://github.com/appium/ruby_lib/commit/a0dfe2c5a99f9354b1c0f4fa766619505d4c85ae) Add s_texts, s_texts_exact
- [5b3bb88](https://github.com/appium/ruby_lib/commit/5b3bb886951b8efe9845d423a4da310742a52bcb) wait and wait_true now respect default_wait
- [5c3083b](https://github.com/appium/ruby_lib/commit/5c3083b819dc3dca66ee07fcb6e7aeadcfbc1d2c) Update Android tag maps
- [c2b7098](https://github.com/appium/ruby_lib/commit/c2b70980ba80cefe82f776ac7c0e567a7dc93884) Sort page_class on Android


#### v0.10.0 2013-09-20

- [6ab8180](https://github.com/appium/ruby_lib/commit/6ab8180ca332239793c0abc5ee3a31b0b081b6c4) Release 0.10.0
- [afb0b09](https://github.com/appium/ruby_lib/commit/afb0b09b54682fd497857a41affcdca531eb6911) Add promote_singleton_appium_methods(main_module)
- [631c584](https://github.com/appium/ruby_lib/commit/631c5846373031a16cacb18bc0259663bd64b7b7) .location_rel now returns a fraction
- [bf45140](https://github.com/appium/ruby_lib/commit/bf451407454853873305e25f7026e97a4119694d) page on iOS now takes window number
- [cb38755](https://github.com/appium/ruby_lib/commit/cb38755ec824e139b40cf291eb0d3421cca3dfad) Fix Android fast duration
- [c81bba8](https://github.com/appium/ruby_lib/commit/c81bba81bdba9a184b2fcc50fa1aabfdafd19e96) Sauce doesn't use dashes in the session id
- [613c33e](https://github.com/appium/ruby_lib/commit/613c33ee22b389a3c42d96cb618a9858a6bc2e88) Add note about xpath index


#### v0.9.1 2013-09-19

- [cd9fc63](https://github.com/appium/ruby_lib/commit/cd9fc636c5fc1071ad95ea08a7ab5c077737e6a7) Release 0.9.1
- [c5c2b83](https://github.com/appium/ruby_lib/commit/c5c2b832c5f535eacb657b4cfc5cb5d89e0ad8ee) XPath index starts at 1 for textfield
- [511f76e](https://github.com/appium/ruby_lib/commit/511f76ea711516e5b2a95918343b8e903d17dc1a) Fix server_version path debug output


#### v0.9.0 2013-09-19

- [28f2161](https://github.com/appium/ruby_lib/commit/28f21615a435364246725e8f9adac62c0257dffa) Release 0.9.0
- [25837ae](https://github.com/appium/ruby_lib/commit/25837aeccf47623c1e4055d51238ac7e443a2d4f) iOS textfields use xpath now


#### v0.8.0 2013-09-19

- [205e04a](https://github.com/appium/ruby_lib/commit/205e04a562e6606b583449cc285e5f4cc5ce9387) Release 0.8.0
- [67f6361](https://github.com/appium/ruby_lib/commit/67f63614238507deac5e3d336f3217f7edc2cd62) Fix textfield methods on iOS


#### v0.7.1 2013-09-09

- [1e0f36e](https://github.com/appium/ruby_lib/commit/1e0f36e22833246873b6ecb8cc4d2bf3544de2c8) Release 0.7.1
- [b611ac6](https://github.com/appium/ruby_lib/commit/b611ac6c361b7044d07d2501ae032784aa891c66) Fix typing on disabled textfield
- [d887050](https://github.com/appium/ruby_lib/commit/d887050006dd4e18e8b558b542eb0a090fecf985) xml_keys, xml_values, resolve_id work on iOS
- [e148f2a](https://github.com/appium/ruby_lib/commit/e148f2ad746795b7dcf3960ed8f837fad2b78f24) Allow custom URL. Fix #84
- [8d6ae78](https://github.com/appium/ruby_lib/commit/8d6ae788006fd9430cc34fc0dc3e390876758a1a) Use our docs not rubydoc.info


#### v0.7.0 2013-09-05

- [c8f3041](https://github.com/appium/ruby_lib/commit/c8f3041049c2feb9ac85f67e85523118a6ce5a84) Release 0.7.0
- [f98534d](https://github.com/appium/ruby_lib/commit/f98534dc92aa04a0afe05b6ed0e60c4be1d9394c) iOS page supports ids and defaults to 1st window
- [ab6cb4f](https://github.com/appium/ruby_lib/commit/ab6cb4f66cb496a9c557b4c6246b8ecd7a3e06ed) strings.xml is now client side. compressed xml support
- [e976552](https://github.com/appium/ruby_lib/commit/e9765527a8858d4d72e9372afdccbf0a2297f5c5) Add Android API 18 resource id to page output
- [ddc5e36](https://github.com/appium/ruby_lib/commit/ddc5e3651e4920dab9198e33b77fcf570c7e5f8b) browserName is never used
- [c5211e5](https://github.com/appium/ruby_lib/commit/c5211e52c51170653d85b9f2a249e4a346c17f7a) Print all matching ids in page
- [8d19157](https://github.com/appium/ruby_lib/commit/8d1915732718864102cdfefcf4db0adb71377a74) Include strings.xml ids in page output on Android
- [b615628](https://github.com/appium/ruby_lib/commit/b61562808624e1324be0934237dbef26a608aebf) Update readme.md
- [adc4eba](https://github.com/appium/ruby_lib/commit/adc4ebaaade7778b975c166e1ab16f5c40cc2517) Add id example
- [42d2a86](https://github.com/appium/ruby_lib/commit/42d2a860f8989a0d8df08815be1a5be4bd895ef6) Add more code examples
- [fa45efd](https://github.com/appium/ruby_lib/commit/fa45efda445b7541f49f510ec08be9e99584ff72) Update docs.md


#### v0.6.7 2013-08-23

- [a1f5942](https://github.com/appium/ruby_lib/commit/a1f5942e907339f1c3968c5af03feb5bde6b1b7c) Release 0.6.7
- [4a08dd6](https://github.com/appium/ruby_lib/commit/4a08dd63add2fd11e7cbb7aadaa086f6fb014ed2) Enable bundleid in app device cap
- [caff218](https://github.com/appium/ruby_lib/commit/caff2187c378e619ee5b4e0524734df372354b69) Improve docs
- [b579ca7](https://github.com/appium/ruby_lib/commit/b579ca7fd83c6673be1f04d745b9d6cbdaeb6504) Add iOS Jenkins Xcode note
- [4fbf0fb](https://github.com/appium/ruby_lib/commit/4fbf0fbdea07120ebf4d270bfee2cf251ba312fb) Add landscape and portrait rotate examples
- [c6d4353](https://github.com/appium/ruby_lib/commit/c6d43537c759342b1ceed72cf8a81573c5070c65) Allow setting device cap


#### v0.6.6 2013-08-19

- [5b84a0b](https://github.com/appium/ruby_lib/commit/5b84a0bd9d9273c704414bdb9a9857b503439b90) Release 0.6.6
- [6f3b002](https://github.com/appium/ruby_lib/commit/6f3b0027757d8fbf62bc26d8a3497caab025c8c8) Add export session option.
- [b05c07e](https://github.com/appium/ruby_lib/commit/b05c07e5ddcb6ba7dc79d20a38f1dae8567c52c6) Fix screenshot return value


#### v0.6.5 2013-08-13

- [8b7b4d6](https://github.com/appium/ruby_lib/commit/8b7b4d6d7836bfede93b6da99bdcac836d218481) Release 0.6.5
- [8dadb52](https://github.com/appium/ruby_lib/commit/8dadb52e0bc0372cef575d5f1c82acdc9bec4c20) Add directory support to appium.txt require


#### v0.6.4 2013-08-09

- [94a9bbc](https://github.com/appium/ruby_lib/commit/94a9bbc595f42008d7fdb7ba6814efd38955294b) Release 0.6.4
- [3b24fcd](https://github.com/appium/ruby_lib/commit/3b24fcd4c23941502eec22d99a3e3db7094b9401) Add optional $driver.global_webdriver_http_sleep
- [dae3508](https://github.com/appium/ruby_lib/commit/dae3508b566de1a3eaae64483cd79d9502a71859) Add longClick example


#### v0.6.3 2013-08-07

- [ccf8e37](https://github.com/appium/ruby_lib/commit/ccf8e375283bd9038fcf6c1db576f7539065e6d0) Release 0.6.3
- [d55c6fa](https://github.com/appium/ruby_lib/commit/d55c6faddcbfd42b1f500e617e38eaa18ddc6532) Fix device and rake uninstall
- [8c704ee](https://github.com/appium/ruby_lib/commit/8c704eece569c37bcc491e8edf88b34e1310ee96) Support OpenStruct in Awesome Print
- [898fe27](https://github.com/appium/ruby_lib/commit/898fe27a86056b5ec6931555ad778c04c3a3a342) Device is not case sensitive


#### v0.6.2 2013-08-07

- [509e7b8](https://github.com/appium/ruby_lib/commit/509e7b81f02c6b0c4cdcb07aca034c9dad260ff4) Release 0.6.2
- [69a698b](https://github.com/appium/ruby_lib/commit/69a698b0ba7b3aa7bbe8846711eac8da0108552e) Add px_to_window_rel
- [218185f](https://github.com/appium/ruby_lib/commit/218185fea68277537ed47dbc9312c874e26489b9) Add promote example
- [b57772c](https://github.com/appium/ruby_lib/commit/b57772c48c409d981518d9aee7ab1b7accd3465a) Fix comments


#### v0.6.1 2013-08-05

- [44b4b29](https://github.com/appium/ruby_lib/commit/44b4b29596b59b1d8a7a7ab7485f176a84143ac3) Release 0.6.1
- [a58228f](https://github.com/appium/ruby_lib/commit/a58228f728576be4bbe8325788ed28571b810bb4) Refactor promotion into a method


#### v0.6.0 2013-08-05

- [09aa23d](https://github.com/appium/ruby_lib/commit/09aa23d8c1b769b054c7d0e24ec86cf55d6bc027) Release 0.6.0
- [cbaf19d](https://github.com/appium/ruby_lib/commit/cbaf19d9d607b00dde89aca3829f17808780c2f3) Add keyboard send_keys documentation
- [25333d6](https://github.com/appium/ruby_lib/commit/25333d6d2871ba5009dcf4050185dbdf1d324ce9) Fix for Minitest 5
- [1e047b0](https://github.com/appium/ruby_lib/commit/1e047b092740703083ed9e452f9e77d6086f8372) Minitest 5 only
- [7ef93e9](https://github.com/appium/ruby_lib/commit/7ef93e99fbc373a6d4f2a75f1abc81a12a9688fa) Update usage example
- [47f53f9](https://github.com/appium/ruby_lib/commit/47f53f9706d3aa302a431c2b91592ee8c72ba399) Device is now required
- [62d5f2a](https://github.com/appium/ruby_lib/commit/62d5f2a258e927ee56e042466503c023c9138f6c) Patch only MiniTest
- [6ce29df](https://github.com/appium/ruby_lib/commit/6ce29df7b9d7b144a750579faab9629741f64593) Fix release notes


#### v0.5.16 2013-07-26

- [bd71fb4](https://github.com/appium/ruby_lib/commit/bd71fb4e430608d32923c583c8d4d592f11a96fc) Release 0.5.16
- [7b83b85](https://github.com/appium/ruby_lib/commit/7b83b85c41caf25376414d978ff63d49ab22f057) Only return files that exist
- [1f0428d](https://github.com/appium/ruby_lib/commit/1f0428dca4e843a82de2d46be3c724e2dc7930c7) Fix keyboard race condition
- [c99ed34](https://github.com/appium/ruby_lib/commit/c99ed341c779fb3eff4ab92a95a4a773a1ce212f) Update docs.md
- [7103921](https://github.com/appium/ruby_lib/commit/71039210e1e0b7481df59210ce4addebcae7ba08) Fix link
- [f76ea9b](https://github.com/appium/ruby_lib/commit/f76ea9b42a728aae247f88f732879cda94101624) Add require support to appium.txt
- [12b8e59](https://github.com/appium/ruby_lib/commit/12b8e5938cb616015cb86d62e41ee9d29cace097) Update docs.md
- [7d6a8f2](https://github.com/appium/ruby_lib/commit/7d6a8f2fa728e616e7fd459cdeef0d5cce9064b4) Add current_app to docs
- [16ea945](https://github.com/appium/ruby_lib/commit/16ea9454941d84bb02ba4950aeea8df6d70cab26) Fix hide keyboard on iOS
- [ad9263c](https://github.com/appium/ruby_lib/commit/ad9263cbabb4e1c56bbe9fafe85b048f2a285c11) Add Sauce wait req
- [98ee244](https://github.com/appium/ruby_lib/commit/98ee244d460f6251c5c6cff8cc79ca8610cc6165) Add .clear example for textfield
- [d373071](https://github.com/appium/ruby_lib/commit/d3730717faba192cc66f5346c2847ecf6cb60e16) Fix activity name example in readme
- [50023f3](https://github.com/appium/ruby_lib/commit/50023f3a8201b0875025e5a94ec841fb23c35714) Fix Android version
- [c4d281a](https://github.com/appium/ruby_lib/commit/c4d281a62d7923f9e6a65fbc870cb1dc6a959849) Add Android set version code
- [5675f4a](https://github.com/appium/ruby_lib/commit/5675f4a03f8b20939e8cc1b5b13df795072d6553) Update readme.md


#### v0.5.15 2013-07-03

- [734fe68](https://github.com/appium/ruby_lib/commit/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3) Release 0.5.15
- [0e203d7](https://github.com/appium/ruby_lib/commit/0e203d76610abd519ba9d2fe9c14b50c94df5bbd) Fix driver methods overriding object methods
- [efc4602](https://github.com/appium/ruby_lib/commit/efc460278af5b6f2a24c290f704781be4e9b2d4b) Fix open struct


#### v0.5.14 2013-07-03

- [521f79b](https://github.com/appium/ruby_lib/commit/521f79b11497c0c963b7059347e02d81a08f665a) Release 0.5.14
- [7831c7d](https://github.com/appium/ruby_lib/commit/7831c7d21bc6ae3c39d91c6903cb5e96ec066f16) Update current_app
- [3009abc](https://github.com/appium/ruby_lib/commit/3009abc44624f58c2201ad881b918e79252c2a83) Add iOS version commands
- [d224b6b](https://github.com/appium/ruby_lib/commit/d224b6b982d6ca7bc741ec9f92d597203081d4c6) Update readme.md
- [89a43da](https://github.com/appium/ruby_lib/commit/89a43da27d3629d5a4f3dc521fefb6e00a97ad2e) Update docs.md
- [85469de](https://github.com/appium/ruby_lib/commit/85469de2cb574722719e77809498319d948add15) Update readme.md
- [95c5c3c](https://github.com/appium/ruby_lib/commit/95c5c3cccf7b038293c9b8bd8bb168edc5bdd6a2) Current app is only for Android
- [460699c](https://github.com/appium/ruby_lib/commit/460699cce767339bf73efd8b5791464130681cb8) Update current_app


#### v0.5.13 2013-06-19

- [146e19a](https://github.com/appium/ruby_lib/commit/146e19a1b322d1bb625c6bb3ce1b80e67a7e80fa) Release 0.5.13
- [2eb4bb0](https://github.com/appium/ruby_lib/commit/2eb4bb0c696f41c839227dd99256d77d52bf995f) Check method exists before calling
- [8d48ca2](https://github.com/appium/ruby_lib/commit/8d48ca2c4463b54d5d68332b58e3ed8eff01edf0) Current app is in the lib now
- [683ae29](https://github.com/appium/ruby_lib/commit/683ae2975fde08d069fefb731a342c7ddd9ebb92) Add current_app


#### v0.5.12 2013-06-18

- [89b0902](https://github.com/appium/ruby_lib/commit/89b0902ed94ed43d8a9f0e364463da77015dcfb7) Release 0.5.12
- [7c4e8d1](https://github.com/appium/ruby_lib/commit/7c4e8d16d909112cebd2a80f0d8140723efd644a) search_id, search_value replaced with xml_keys, xml_values


#### v0.5.11 2013-06-18

- [891e003](https://github.com/appium/ruby_lib/commit/891e003748038a006121c8a4e0c702c12c405799) Release 0.5.11
- [5e7f381](https://github.com/appium/ruby_lib/commit/5e7f381aa8fc4b64af9103beae67cfc2fc310484) WebView is not a widget
- [830c3fb](https://github.com/appium/ruby_lib/commit/830c3fb07e01da64a6934a9a0868861a67326f4f) Add search value


#### v0.5.10 2013-06-17

- [16d696a](https://github.com/appium/ruby_lib/commit/16d696aa368bdce198b7ef7a1cc1370f6c5d2ac7) Release 0.5.10
- [5cc0a7a](https://github.com/appium/ruby_lib/commit/5cc0a7a52d43af7690705f889860c2dc4788b892) Add search and resolve id


#### v0.5.9 2013-06-11

- [ac76a23](https://github.com/appium/ruby_lib/commit/ac76a23ca4c7f5bb89a833937cc726654fa2df82) Release 0.5.9
- [b377791](https://github.com/appium/ruby_lib/commit/b3777911709538a230d1fd3be31ae21f72040b00) Update readme.md
- [893737a](https://github.com/appium/ruby_lib/commit/893737a6033ed7c8e6f1c31f5b45f65b841320c2) Add current_activity


#### v0.5.8 2013-06-04

- [91f5c2f](https://github.com/appium/ruby_lib/commit/91f5c2f2bd388c1d4c4e771d2abea3772197de9c) Release 0.5.8
- [b4e592c](https://github.com/appium/ruby_lib/commit/b4e592cc3d101a4ac9f7fa374ae8c75fcdc5218a) Fix call twice
- [18e3f7d](https://github.com/appium/ruby_lib/commit/18e3f7d1c6869ba0d2c248b9c242d08c47390346) Prefer existing method before calling driver method
- [1f72729](https://github.com/appium/ruby_lib/commit/1f727290c2452833df87a8b4d559bf5c51955a1e) switch_to.alert calls getAlertText so use bridge directly
- [9752a3b](https://github.com/appium/ruby_lib/commit/9752a3bdf8173653f6d5c2d412bb7c70f0b5f023) Add tag method


#### v0.5.7 2013-06-03

- [669f734](https://github.com/appium/ruby_lib/commit/669f7345b7e8a92e8206b847d4a2263731df3c4b) Release 0.5.7
- [bb5b7a5](https://github.com/appium/ruby_lib/commit/bb5b7a568dab38dc7044e3925274f9f7ee84a362) Add page_class for iOS


#### v0.5.6 2013-05-31

- [7c3335c](https://github.com/appium/ruby_lib/commit/7c3335c82e8b96e4a4cf74ae20faf98906b63770) Release 0.5.6
- [b231d8f](https://github.com/appium/ruby_lib/commit/b231d8fbcdd35cc7a027e02a7733d10a616d2f7b) Fix finds


#### v0.5.5 2013-05-31

- [e061482](https://github.com/appium/ruby_lib/commit/e061482a0f712914c5fb21da92da357b79e07b87) Release 0.5.5
- [82f9c58](https://github.com/appium/ruby_lib/commit/82f9c580d68189b669d3f5029914f00c8fd17c06) Fix value contains operator
- [c5b8d84](https://github.com/appium/ruby_lib/commit/c5b8d849b29f46beebd1aea4ff59f2de6edd9dc6) Update readme.md
- [c14fbb3](https://github.com/appium/ruby_lib/commit/c14fbb3c39b0c33a5d42dfe9da5427cebb9ec336) Add version badge


#### v0.5.4 2013-05-28

- [9e95106](https://github.com/appium/ruby_lib/commit/9e951061b9da6cee7b90ee310bbbef2b7c660fb1) Release 0.5.4
- [d66020c](https://github.com/appium/ruby_lib/commit/d66020c66b02889d4a96809f41d02d4aa3e4b915) Fix gemspec. yard is required for docs task
- [1c6509d](https://github.com/appium/ruby_lib/commit/1c6509ddea68305b47f251e0d0c1ff4a5c1493ee) Add dev task to install gems required for release task
- [5106643](https://github.com/appium/ruby_lib/commit/51066439a4bacf7fea4a469044f6c3e2b60356c9) Add Sauce Storage support


#### v0.5.3 2013-05-24

- [b24565d](https://github.com/appium/ruby_lib/commit/b24565df67d4f0468ab5e3c1a700711a4c82b80d) Release 0.5.3
- [5c7169a](https://github.com/appium/ruby_lib/commit/5c7169ae5fecc9adf0bd0a8f7fc6aea5a90495a2) Update appium_lib.gemspec
- [1a03758](https://github.com/appium/ruby_lib/commit/1a03758dede749f9fd23f00db1be9199c159a6c8) Update readme.md


#### v0.5.2 2013-05-24

- [44ffbcb](https://github.com/appium/ruby_lib/commit/44ffbcb4715c8caac2770972c72ca498e751be34) Release 0.5.2
- [61e92f8](https://github.com/appium/ruby_lib/commit/61e92f87e6870be06b34a20dc0dfc64ddfed7f13) Add get_page_class
- [cca5db4](https://github.com/appium/ruby_lib/commit/cca5db4d98e00306f99110cd43398b0dc1f5980f) Update tag names


#### v0.5.1 2013-05-24

- [1a98819](https://github.com/appium/ruby_lib/commit/1a98819e93e739496f27a6ec2ad4197ca78c08a4) Release 0.5.1
- [2003589](https://github.com/appium/ruby_lib/commit/2003589197a78d54f3d177abbf2335724c090e1e) Fix names on Android


#### v0.5.0 2013-05-24

- [de58f71](https://github.com/appium/ruby_lib/commit/de58f7164230d7551df8462d65d0e43a3d0cfdab) Release 0.5.0
- [062a2a2](https://github.com/appium/ruby_lib/commit/062a2a21fc3768c0d19b33d317c7ba5828bcbc3e) Add page_class
- [9e1e091](https://github.com/appium/ruby_lib/commit/9e1e091f1cc27d3330faa9c44b8241b720c10595) Add note
- [1372009](https://github.com/appium/ruby_lib/commit/1372009afdd62c6c2f57ffa8d9fa4fce3de056b2) Fix method signature
- [f0e0954](https://github.com/appium/ruby_lib/commit/f0e0954d8f2c8f941b4f95bf995890454e748c4f) Dynamic is Android only
- [8a1a387](https://github.com/appium/ruby_lib/commit/8a1a387e1fe03e9a3e9d0fafd2064fb9cd3759c4) Update docs.md
- [eaa5b79](https://github.com/appium/ruby_lib/commit/eaa5b79f6768f3fd0da0637fad46c3dec4cd4ad1) Rename s_first_text s_last_text
- [edbd74f](https://github.com/appium/ruby_lib/commit/edbd74fb8a32b53f37c65dd3617afaf6c6bd5641) Add example for screenshot
- [73fcb72](https://github.com/appium/ruby_lib/commit/73fcb72d78bf02cb0deaa9af3f65ce074518c4fa) Add params to exists
- [558d4af](https://github.com/appium/ruby_lib/commit/558d4afc023243374eadf6187c5036c0ac8dd4ba) Fix opts
- [adfdc18](https://github.com/appium/ruby_lib/commit/adfdc18f224dcb98e41630ed354bdc2ac61241d8) Fix gemspec
- [299d0c8](https://github.com/appium/ruby_lib/commit/299d0c8085e5117d7cdb5084334fb8e35efad32d) Move appium.txt loading to appium_lib
- [aaf54be](https://github.com/appium/ruby_lib/commit/aaf54be45c0b711c4c3a86d3b42a853f1bdc80d1) Fix code format
- [9e3a3e9](https://github.com/appium/ruby_lib/commit/9e3a3e9c3321c1fb78d8ed8df9b98f7f99d8c258) Move default wait to init param
- [ae9acb1](https://github.com/appium/ruby_lib/commit/ae9acb1fcea3dc2af32032ade35ee9263668e7a8) Update docs
- [849594b](https://github.com/appium/ruby_lib/commit/849594bdd87bf6133cbb64c43d0a02f427f17467) Update method comments


#### v0.4.2 2013-05-20

- [be814c2](https://github.com/appium/ruby_lib/commit/be814c286bd55fb133f333738da9b0dcd6146b69) Release 0.4.2
- [9d2cfe8](https://github.com/appium/ruby_lib/commit/9d2cfe86b3367fd3f4551962a042fe25da1e31bd) Add page_window for Apptentive
- [e9b5e97](https://github.com/appium/ruby_lib/commit/e9b5e97baf7b6a417dc3865b7cc0c163c0165d70) Update docs


#### v0.4.1 2013-05-20

- [cd8dd73](https://github.com/appium/ruby_lib/commit/cd8dd73461d6bdb8903a8b3f5bba9ce554a44789) Release 0.4.1
- [9e8cd0a](https://github.com/appium/ruby_lib/commit/9e8cd0a915e6c9c373ebd3a33a653c573f776636) Add status
- [978d489](https://github.com/appium/ruby_lib/commit/978d48964361ca36267b866b1fe69d0b09b3f273) Update docs
- [eb11923](https://github.com/appium/ruby_lib/commit/eb11923543a1e3e2fe8f19d2f09959cefd16fa05) Fix generic iOS methods


#### v0.4.0 2013-05-16

- [70a59fe](https://github.com/appium/ruby_lib/commit/70a59fefcaa4f16ba0e7629f16feaae3e5f8c424) Release 0.4.0
- [b30548e](https://github.com/appium/ruby_lib/commit/b30548e58783bc6b20bd5c0f11e2ae9ddb5faa30) Translate mobile find on Android
- [1ea8b85](https://github.com/appium/ruby_lib/commit/1ea8b85ebb7c7531c2791f3c41d0280d947edad0) Screenshot should work on iOS
- [3797644](https://github.com/appium/ruby_lib/commit/3797644874ff1e56a8c35f9825e42c8486902984) Update docs
- [0e2c119](https://github.com/appium/ruby_lib/commit/0e2c119199535a2e9a8e708453fa068c6445e6ca) Fix release notes
- [5c28a2d](https://github.com/appium/ruby_lib/commit/5c28a2debcd8386aab62b48d0b087ed7dac84d8d) Next release will be 0.4.0
- [b9e5044](https://github.com/appium/ruby_lib/commit/b9e5044ddf6f998c09f006d8a6d95a5560f2fdd3) Remove comment
- [30c2ada](https://github.com/appium/ruby_lib/commit/30c2adaecb0bca734664192a805968a83f4b7a8b) Update doc links
- [d08cd59](https://github.com/appium/ruby_lib/commit/d08cd5944aeda9fa3f3842fd5a259e0385b88166) Add JS doc gen
- [61530fb](https://github.com/appium/ruby_lib/commit/61530fb908822cd32be6cb25d94ffb00f68ec87b) Update docs
- [ebe6a2f](https://github.com/appium/ruby_lib/commit/ebe6a2fa91a748c0c823dbb969afa51ab3710acd) Update docs.md
- [637fef7](https://github.com/appium/ruby_lib/commit/637fef7f7547e6e2b2fd8f70e19ef3f3870cc136) Use element.displayed? not visible


#### v0.3.16 2013-05-14

- [fb34a03](https://github.com/appium/ruby_lib/commit/fb34a03ceec0be552f218323bf266fda7f7e060b) Release 0.3.16
- [6e552ae](https://github.com/appium/ruby_lib/commit/6e552ae0d9a66a03ac50caa38f73f3f3dbded317) Selendroid is boolean


#### v0.3.15 2013-05-13

- [cc56df8](https://github.com/appium/ruby_lib/commit/cc56df88825ac8e705e740eed7ac8ca42bcc9dd0) Release 0.3.15
- [8613403](https://github.com/appium/ruby_lib/commit/8613403db07435908a149dc296fb92cad8af2e35) Use boolean for .visible on iOS


#### v0.3.14 2013-05-13

- [12aa291](https://github.com/appium/ruby_lib/commit/12aa29132a9a88076fbf8c76fbb65b1aa5e1fc96) Release 0.3.14
- [a61b297](https://github.com/appium/ruby_lib/commit/a61b297d387b0c28865b050eaa3d7d59efae2a34) Add .visible for iOS
- [6f6dda5](https://github.com/appium/ruby_lib/commit/6f6dda53fb12a483a524370c3d3c729fa1b87be4) Update gemspec


#### v0.3.13 2013-05-10

- [7badb99](https://github.com/appium/ruby_lib/commit/7badb998734ee4c4ae0781c5e8f3cfc4b862eeb3) Release 0.3.13
- [efaa0ea](https://github.com/appium/ruby_lib/commit/efaa0eaebe5a045dba8370ec98aea8bdf31637ba) Fix #52


#### v0.3.12 2013-05-10

- [faf3e98](https://github.com/appium/ruby_lib/commit/faf3e98d0d745df9bbbfada93dcfd6b47a585793) Release 0.3.12
- [7ff6b95](https://github.com/appium/ruby_lib/commit/7ff6b955cafc235a554d192cc09014c4400dc27a) Add scroll_to


#### v0.3.11 2013-05-09

- [14d705a](https://github.com/appium/ruby_lib/commit/14d705acd527f13e2962e2c04200b6d28fd36cbb) Release 0.3.11
- [ebdae44](https://github.com/appium/ruby_lib/commit/ebdae448b108c76e586ad8f8ae86a1abc495e7e5) Search name and text when using textfield


#### v0.3.10 2013-05-07

- [db557df](https://github.com/appium/ruby_lib/commit/db557df9939fa44f2a6bf5d8afd950a2fa4b4178) Release 0.3.10
- [c3adbc5](https://github.com/appium/ruby_lib/commit/c3adbc52f0b049e6b9292ac2ff328160d1820668) Fix name and textfield
- [5c26137](https://github.com/appium/ruby_lib/commit/5c261370fd68f363f0ab2f4d70ad486c43dc46fb) Android can't get alert text
- [36f68de](https://github.com/appium/ruby_lib/commit/36f68de51954de79754e8f377f4a6dad47361dc1) Add shown attribute to Selendroid page


#### v0.3.9 2013-05-06

- [3b4fbb4](https://github.com/appium/ruby_lib/commit/3b4fbb4e6957a92ac4236d5666d932ee9da238e7) Release 0.3.9
- [98b1b1e](https://github.com/appium/ruby_lib/commit/98b1b1e8e0952244c1ca2c8738d7d33af7eb0f68) Fix extra slashes in path


#### v0.3.8 2013-05-06

- [e7bc45f](https://github.com/appium/ruby_lib/commit/e7bc45fd88f026dc51237d767da9f9dfa2e05b56) Release 0.3.8
- [dc3a50f](https://github.com/appium/ruby_lib/commit/dc3a50f23ca6ba4978ddb9af1dadf6c6015eb9fb) Use 4.2 not 4.1
- [f8042f1](https://github.com/appium/ruby_lib/commit/f8042f158f046815238463a9ea86cd66ea725942) Fix page Selendroid
- [f9866e0](https://github.com/appium/ruby_lib/commit/f9866e034ea9a3744387fb15d5ca3ba221f27429) Load touch methods
- [c3f9a2b](https://github.com/appium/ruby_lib/commit/c3f9a2b0300ee238acf4ce750f9b651ff39eb919) Don't set timeout on Selendroid until it's fixed
- [d88245e](https://github.com/appium/ruby_lib/commit/d88245efe8fed5927e136719a9747b788dbd0fc2) Add page for Selendroid
- [ff63433](https://github.com/appium/ruby_lib/commit/ff63433db6d68170ef135e151d6ac154c3504f4f) Add id method
- [c59f7ce](https://github.com/appium/ruby_lib/commit/c59f7cefc76a9f172e6e6494aca275b5687d1a74) Improve debugging


#### v0.3.7 2013-05-01

- [edfd20a](https://github.com/appium/ruby_lib/commit/edfd20a6ffdef8484b9f7b5eddb9c21815241d42) Release 0.3.7
- [9f8511c](https://github.com/appium/ruby_lib/commit/9f8511c1416867df606dfb3d058f83ee277ce39a) Remove puts


#### v0.3.6 2013-05-01

- [67e5c86](https://github.com/appium/ruby_lib/commit/67e5c867d38251687dc7ebd5de013db5712fcac3) Release 0.3.6
- [a0a46f7](https://github.com/appium/ruby_lib/commit/a0a46f773a57c9ef7b92252afed467bd7cd01b96) Fix wait and add wait_true
- [e7cde77](https://github.com/appium/ruby_lib/commit/e7cde775473bd3981cac5b356f78289f832091a9) Add wait example


#### v0.3.5 2013-04-30

- [a886ef4](https://github.com/appium/ruby_lib/commit/a886ef4722a902fdef15ecfc7164299399f1d524) Release 0.3.5
- [193eb71](https://github.com/appium/ruby_lib/commit/193eb716023f52506cdf599cff6aae4f4a3c1119) Fix JSON.parse
- [54ba323](https://github.com/appium/ruby_lib/commit/54ba323721a704d3ceb34f71dd8e1fcf9069dd78) Use upstream get name contains
- [6f66b46](https://github.com/appium/ruby_lib/commit/6f66b46725ee397cc437901e95431ec95935d9c2) Name contains moved upstream
- [2d33b5c](https://github.com/appium/ruby_lib/commit/2d33b5ce4078d784f7f6f0ac07651166a466b34c) Update readme.md
- [4a1f87e](https://github.com/appium/ruby_lib/commit/4a1f87e1f0524595d7bd15027b4a009a42b5ff83) Update example
- [6177c49](https://github.com/appium/ruby_lib/commit/6177c497f9c114203e624f530e51f4f54a61788a) Rename get_wait


#### v0.3.4 2013-04-30

- [ffdf104](https://github.com/appium/ruby_lib/commit/ffdf104ffdecb165cfe410976145134768756e30) Release 0.3.4
- [4edc9f6](https://github.com/appium/ruby_lib/commit/4edc9f6097e29d2816dceef546a819fd6ee431d2) Add params to wait
- [da1c042](https://github.com/appium/ruby_lib/commit/da1c0424873fa5f859b1ec558356a3ad0721097b) Add selendroid launch support
- [f398041](https://github.com/appium/ruby_lib/commit/f398041369884d8068950ab9e703a8a2d750082c) Use symbols for driver opts
- [cf09a0d](https://github.com/appium/ruby_lib/commit/cf09a0d1ca8de835043f855cbd74ced9abb5f1b0) Add expected server opts
- [fe6c7d7](https://github.com/appium/ruby_lib/commit/fe6c7d71dbaf7f7b383d117918de2498945406d4) Fix os specific patches
- [d9b9c1a](https://github.com/appium/ruby_lib/commit/d9b9c1a2fcc1857e0e7c78d250fd59b84726d69b) Improve logging
- [3b831b0](https://github.com/appium/ruby_lib/commit/3b831b089e02c4a53585d90ed009f5ad3cb982a7) Return invisible match if no visible result


#### v0.3.3 2013-04-27

- [b0ca37c](https://github.com/appium/ruby_lib/commit/b0ca37cfe47318f029e1f2ad498a5c08338016d7) Release 0.3.3
- [e7f55d9](https://github.com/appium/ruby_lib/commit/e7f55d92181660ea188a5123e6e4f447389c8d6d) Add driver method
- [6d381fe](https://github.com/appium/ruby_lib/commit/6d381fe029bd9a5c11aa4d1a322d6afb603c6434) Update readme.md
- [07da208](https://github.com/appium/ruby_lib/commit/07da208973ea4de64ec9605ef5dd38884771e8c6) Add troubleshooting steps


#### v0.3.2 2013-04-26

- [eee6632](https://github.com/appium/ruby_lib/commit/eee6632251c40c8b2d6be9a361f429d7c89762f8) Release 0.3.2
- [b22d747](https://github.com/appium/ruby_lib/commit/b22d7473f03e1b13a1ffd9ddc2ea5ca1396c4642) Default to app_activity if app_wait_activity is not set
- [76198ad](https://github.com/appium/ruby_lib/commit/76198ad4d169d836007a247b2ebe8cad5391f512) Fix reset clearing iOS JavaScript
- [445519b](https://github.com/appium/ruby_lib/commit/445519b4528c9c253865f76fdac921a22c31fbd7) Use Appium's detailed error messages
- [e00964f](https://github.com/appium/ruby_lib/commit/e00964fa7b9ccd047b06f1432ddd1e62170306df) Update readme.md
- [ef0b626](https://github.com/appium/ruby_lib/commit/ef0b626940d86fd07dbb86ac16b40dd5b0b5ce4a) Avoid invisible elements


#### v0.3.1 2013-04-26

- [e00fc6e](https://github.com/appium/ruby_lib/commit/e00fc6efb8f0c94ac6e196e831980ee96676b645) Release 0.3.1
- [81d762a](https://github.com/appium/ruby_lib/commit/81d762a92293a9d59600154f1f0a5944aee5b439) Check method exists before calling
- [4b3f3dc](https://github.com/appium/ruby_lib/commit/4b3f3dc91714b08aae0acee51aa1137c58f59acb) Fix method dispatch
- [fa8b679](https://github.com/appium/ruby_lib/commit/fa8b679b816bd1507c7c9de3f301a3b8a7742d8f) Fix iOS name
- [5be26c4](https://github.com/appium/ruby_lib/commit/5be26c411fcf75154301749cd790487d3dd71ea9) Add sauce methods and find_name
- [b3724d3](https://github.com/appium/ruby_lib/commit/b3724d36a85188c7c8c85dadc313c6c43c8bed59) Add session_id


#### v0.3.0 2013-04-25

- [e08e88c](https://github.com/appium/ruby_lib/commit/e08e88c40cc56e132c5db18d9d5862028861d5f2) Release 0.3.0
- [3f4dd63](https://github.com/appium/ruby_lib/commit/3f4dd63ab2ab2e97b457bb188a347af6c74bc7df) Update code style
- [9bbb17e](https://github.com/appium/ruby_lib/commit/9bbb17e4079c7db1c033284c3120611f11f33656) Update readme.md
- [354bf19](https://github.com/appium/ruby_lib/commit/354bf19090ca6b1a7812d067321452094f7a62c0) Add new usage example
- [9668450](https://github.com/appium/ruby_lib/commit/96684503b091af581a78067342106feef5769a92) Restore top level methods
- [b095c4a](https://github.com/appium/ruby_lib/commit/b095c4a94109c508fc286801d957e4535e27462d) Rewrite as a real lib
- [71628ff](https://github.com/appium/ruby_lib/commit/71628ff13fc84c3b15f0dc3986a75bd3fcb7a28e) Fix page for iOS
- [fce0d67](https://github.com/appium/ruby_lib/commit/fce0d676cb78582703934872a0256c55ad55d225) Add force encoding check
- [aed2607](https://github.com/appium/ruby_lib/commit/aed26079c25ee2f80c8a1462dde7d589d30e014b) Raise NoSuchElementError on find
- [82dc953](https://github.com/appium/ruby_lib/commit/82dc953a302fc4505d6c7c2121da0ccbe71e053a) Add webview support to find
- [151edde](https://github.com/appium/ruby_lib/commit/151edde563bb907b07c7896794ecbb81568c3e29) Define no args page for iOS
- [b3227f7](https://github.com/appium/ruby_lib/commit/b3227f73175697782c5dbc8f62ad911fcae88965) Quote button name when string
- [0c0073d](https://github.com/appium/ruby_lib/commit/0c0073d0785ff64606c7887ec4eb83a8bcc5cafd) Add grid and relative
- [3b87251](https://github.com/appium/ruby_lib/commit/3b87251d9e749590873c1bb118c88dd4b8fdaea0) Add note about secure tag on Android
- [494f0e3](https://github.com/appium/ruby_lib/commit/494f0e39d9b1ebbafd731b4d311e4cc1cee02266) Add window mapping for Android
- [e4d63a5](https://github.com/appium/ruby_lib/commit/e4d63a569c6fede034a1fd411ba9047327389063) Replace classNameMatches with className
- [dd82100](https://github.com/appium/ruby_lib/commit/dd821001ee333801a36f2b5c01e4793e47fd037e) Fix find_eles_attr
- [de7a1bc](https://github.com/appium/ruby_lib/commit/de7a1bc1112aa3d1930647738d85ae54270685d2) Improve webdriver debug messages
- [dff41da](https://github.com/appium/ruby_lib/commit/dff41dae4a0d67200336b3daa677ab73157c0464) Better webdriver debug messages
- [d2ca728](https://github.com/appium/ruby_lib/commit/d2ca72880c9bdfb853a5dcd63e3db16fa03d3f1d) Use textContains to fetch first element only
- [1cbb69d](https://github.com/appium/ruby_lib/commit/1cbb69d8b9b69cdacfdfef663ab8ff31d506ba50) Check for empty app path
- [427e105](https://github.com/appium/ruby_lib/commit/427e105be7865c5a637e62fb597cc034b4cda2ad) Fix format
- [40cd10b](https://github.com/appium/ruby_lib/commit/40cd10bf72a080a0a34f43d189befab1b1f953e4) Update get_inspect
- [bc1cdb1](https://github.com/appium/ruby_lib/commit/bc1cdb120ccef4598333838cfaf35c54d84ad79a) Add find_eles_attr
- [e89f8bd](https://github.com/appium/ruby_lib/commit/e89f8bdad8919471ae12c11343b82c2d04d88027) Use XPath last()
- [133cf98](https://github.com/appium/ruby_lib/commit/133cf98bd27c26d1a5438bdf4534149f0f8aef89) Add xpath, xpaths
- [435eac0](https://github.com/appium/ruby_lib/commit/435eac0bd8020dd5fc30a9ae163f72ab4fda1565) Fix name
- [050734f](https://github.com/appium/ruby_lib/commit/050734f7a64e8d9386b5c2e2ccb0ce653f816437) Update first_ele to use XPath #15
- [f89dcc3](https://github.com/appium/ruby_lib/commit/f89dcc361b8c6762cad541fc9b5a2e1955b1cd27) Update ele_index to use XPath #15
- [763d086](https://github.com/appium/ruby_lib/commit/763d0862135bf9e06ad177c9e3e20a83819b1775) Use mobile method
- [09035ab](https://github.com/appium/ruby_lib/commit/09035ab053df980baf43b8d1128f68fe52df37a4) Remove old comment
- [2d07ed0](https://github.com/appium/ruby_lib/commit/2d07ed0d5868c734168b31fb47881eaa4c74af1c) Raise instead of puts


#### v0.0.30 2013-04-16

- [6d65a9c](https://github.com/appium/ruby_lib/commit/6d65a9c2895b1b66556b12fee4fc9649f558ede1) Release 0.0.30
- [5692f96](https://github.com/appium/ruby_lib/commit/5692f9604a09b6198f8ada7823d8f74858b8af88) Fix quote
- [ee17332](https://github.com/appium/ruby_lib/commit/ee173329758ea486d32d6887439de39a749ceba0) Use driver_quit


#### v0.0.29 2013-04-15

- [1c1e0ee](https://github.com/appium/ruby_lib/commit/1c1e0eeed8d636dc81d3b74612405722b1134071) Release 0.0.29
- [2278c8e](https://github.com/appium/ruby_lib/commit/2278c8e662d32df86933a63f14dea4df431a95e5) Add wait param to start_driver
- [f5f82c0](https://github.com/appium/ruby_lib/commit/f5f82c0f98291e0f8b8ae0baa6285ad4b62cc34e) Default to partial match
- [2e7f8c6](https://github.com/appium/ruby_lib/commit/2e7f8c6b09aa433d3712685f6842a052dd4847b3) Update webdriver
- [b7b6caa](https://github.com/appium/ruby_lib/commit/b7b6caa8ab0c2683626aed265ee6ec2feece37f0) Use gh_name


#### v0.0.28 2013-04-11

- [70606a4](https://github.com/appium/ruby_lib/commit/70606a43cebcd0c19b98a1876fb929f03db7bb0e) Release 0.0.28
- [61d1943](https://github.com/appium/ruby_lib/commit/61d19439c8597ca3562028d6c985370a5d43fa26) Update docs.md
- [7676a90](https://github.com/appium/ruby_lib/commit/7676a90af8a1951817fcc8c49ddef46577cf5726) Add iOS name, names, text, texts
- [7bc936c](https://github.com/appium/ruby_lib/commit/7bc936c63fff14780595a9a9fd360670d6e00178) Update webdriver
- [e3646d3](https://github.com/appium/ruby_lib/commit/e3646d311873f82287e2a14a8c699c2d097c5a6c) Add fast_duration
- [22ac58a](https://github.com/appium/ruby_lib/commit/22ac58ab3f48cc51019fafde19efdc012d5b8c2b) Check that app path exists
- [217bca9](https://github.com/appium/ruby_lib/commit/217bca9e85c5e5e4a21832c34cc715476b0dd181) Add page for iOS
- [2abf365](https://github.com/appium/ruby_lib/commit/2abf365017555c37e95cfa57f0142b0a2fa944a8) Update docs.md
- [a1d26ff](https://github.com/appium/ruby_lib/commit/a1d26ff13912e301079cc8ca222013850b660d21) Add link to docs.md
- [e4d27c9](https://github.com/appium/ruby_lib/commit/e4d27c95e344ca7b25512044b65cbdbe4a9dce82) Update docs.md
- [2cf20a0](https://github.com/appium/ruby_lib/commit/2cf20a026ef33e727b1da360634668ddda70518d) Create docs.md
- [e1f470e](https://github.com/appium/ruby_lib/commit/e1f470e0a2b9a6cf94ffa20edbc244e31c0375e8) Add find for Android
- [37bb4e9](https://github.com/appium/ruby_lib/commit/37bb4e90b29e5adb4438b287b6387a504c94b5c4) Update comment
- [aaeba81](https://github.com/appium/ruby_lib/commit/aaeba817376dd8e3cadeab37d096abc0170b565b) Add order to find
- [73b757c](https://github.com/appium/ruby_lib/commit/73b757cd28c5bc85b98d6e747f79f7ee33af5022) Define find and finds to search everything
- [ebd6c1b](https://github.com/appium/ruby_lib/commit/ebd6c1bc7d3f8be01fdf5346786c2b5fb2da8deb) Fix text and texts on iOS


#### v0.0.27 2013-04-05

- [fb4af20](https://github.com/appium/ruby_lib/commit/fb4af206c114cf8f75fcb41cdbbea0ba728bf7e6) Release 0.0.27
- [ca00d82](https://github.com/appium/ruby_lib/commit/ca00d82fb8e716d5941ec0ee6b38b207329b915e) Fix require
- [ad00639](https://github.com/appium/ruby_lib/commit/ad006393ce8b6dc071c98b2edf73c32707d37762) Update readme.md


#### v0.0.26 2013-04-04

- [07fed25](https://github.com/appium/ruby_lib/commit/07fed259a743d9f3f3d72bfc8c8b9eac7b26d724) Release 0.0.26
- [7c77faa](https://github.com/appium/ruby_lib/commit/7c77faa7087f9aa4bf2cc387a13b9bb0974d59a1) Add exists method
- [27f4ccf](https://github.com/appium/ruby_lib/commit/27f4ccf19f0d4028baf634ccb9538a340c96ebb9) Add alert for Android
- [4bb466f](https://github.com/appium/ruby_lib/commit/4bb466f8ed90cb0f015bb627423dba8c91574a4d) Add txt methods
- [2d2704a](https://github.com/appium/ruby_lib/commit/2d2704a99318a21c292a636730bca94af87bcc55) Store default wait in var
- [8a2bc8a](https://github.com/appium/ruby_lib/commit/8a2bc8aed39639e6c3d51c185d233be6f9760c59) Update release_notes.md
- [c504873](https://github.com/appium/ruby_lib/commit/c504873582d4871650e02515ccb68e21bd1486ae) Create release_notes.md
- [2e71e47](https://github.com/appium/ruby_lib/commit/2e71e477962c70113b556700cf08c74060d77370) Don't wait in Pry
- [3416272](https://github.com/appium/ruby_lib/commit/341627269bf50497ebe4a6e388939d45d53e2032) Update readme.md


#### v0.0.25 2013-03-28

- [6a975a6](https://github.com/appium/ruby_lib/commit/6a975a6cc0e97866c3ef6248f0f7d1abbc934577) Release 0.0.25
- [6a8fdce](https://github.com/appium/ruby_lib/commit/6a8fdcea4c8fdc308c7d107e958fbabed9719056) Rename inspect


#### v0.0.24 2013-03-28

- [d5bcb94](https://github.com/appium/ruby_lib/commit/d5bcb94966c4a7806a47ee892f3e5ff784a739e2) Release 0.0.24
- [17f9a67](https://github.com/appium/ruby_lib/commit/17f9a67143720dbfc50b34783a11c7bf5c28ea3c) Add .lock to ignore
- [9181cb8](https://github.com/appium/ruby_lib/commit/9181cb88f3d1180a16998f27e2236864809c6fcf) Add inspect using JSON dump
- [e74dc46](https://github.com/appium/ruby_lib/commit/e74dc468a5d3d81f77c50d3fe41eb9dbebf3d404) Add get_source
- [2444290](https://github.com/appium/ruby_lib/commit/24442908f9426b228dc760497ef98f9cf579d4d5) Add name methods


#### v0.0.23 2013-03-27

- [789634c](https://github.com/appium/ruby_lib/commit/789634c6b20d4030eaec4d385a85275b3fabfe76) Release 0.0.23
- [6d58a33](https://github.com/appium/ruby_lib/commit/6d58a33bce0bf1ff3c6156717519a2db6a27bb84) Add app-wait-activity


#### v0.0.22 2013-03-23

- [bfd7761](https://github.com/appium/ruby_lib/commit/bfd7761c0f2b32e7ab0bbe8372228163181e60b9) Release 0.0.22


#### v0.0.21 2013-03-22

- [4066823](https://github.com/appium/ruby_lib/commit/40668230b89eaa66970889b20305279029048698) Release 0.0.21


#### v0.0.20 2013-03-22

- [ed588a1](https://github.com/appium/ruby_lib/commit/ed588a1ccc67d0efa0d8d56f4f9b08c23b261687) Release 0.0.20
- [a4a7199](https://github.com/appium/ruby_lib/commit/a4a7199dfb609841310ad4e31ccbb56e3ecfa90d) Update readme.md


#### v0.0.19 2013-03-22

- [01f2d15](https://github.com/appium/ruby_lib/commit/01f2d150ae3d8e88970b361a8330c6ccc174097d) Release 0.0.19
- [10eec2f](https://github.com/appium/ruby_lib/commit/10eec2f197899395978b73de049aed08ceda55cc) AppLib => AppiumLib
- [c1e3b4f](https://github.com/appium/ruby_lib/commit/c1e3b4f0a08be3a0aef65218220f09f4198683bf) AppLib => AppiumLib