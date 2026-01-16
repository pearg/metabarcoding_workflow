# Function equivalent to excel's =RIGHT() and =LEFT() functions
right <- function(x, n) {substr(x, nchar(x) - n + 1, nchar(x))}
left <- function(x, n) {substr(x, 1, n)}

load("~/temp/tfill_raw.rda") # From Appendix2_corrections_to_ASV_library_cw.Rmd"
load(paste0("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/",
            "asv_library_97_match_list_with_bin_uris_2024-12-15.rda"))
# And load "match_List" - the full list of matching records to BOLD (not limited to >0.97 similarity)
load(paste0("~/uomShare/wergStaff/MelCarew/git-data/metabarcoding_workflow/",
            "asv_library_97_match_list_to_BOLD_2024-12-15.rda"))

# There are 60 asv_codes in the match_lists that aren't in tfill...not sure of their origin
match_list_bin_uri <- match_list_bin_uri[match(tfill$asv_code, names(match_list_bin_uri))]
match_list <- match_list[match(tfill$asv_code, names(match_list))]

## Mel's changes by asv_code 

asv_species_corrections_tf <- c("70d22725893c8c5a6de91b0f5f7c1483" = "Atalophlebia sp. B-ABV8739",
                                "3f21ea3293d426980c0bb90cee947feb" = "Atalophlebia sp. B-ACM3545 group",
                                "e78f9bda3fc0623568541c2ead24a207" = "Atalophlebia sp. B-ACM3545 group",
                                "4e348190a398806a2a552afa1d9785bc" = "Atalophlebia sp. B-ACM3545 group",
                                "9f0c1c87cbbb54687329685716172501" = "Atalophlebia sp. B-ACM3545 group",
                                "dd3c0a3a15229d2473b6993ac29aa99a" = "Atalophlebia sp. B-ABV8738",
                                "1ee6186bfdb129f48c157ca1c0c9a4eb" = "Atalophlebia sp. B-ABV8738",
                                "b1a18f0dd7091e2518c1ff84ed5f84ba" = "Atalophlebia sp. B-ABV8738",
                                "65a3a3575d29e7c6148d5db6026e1e2b" = "Atalophlebia sp. B-ABV8738",
                                "381713edf4911d317655bbe78c03bd7c" = "Atalophlebia sp. B-ABV8738",
                                "4ed3e46ae94fed01456beece28d3462a" = "Atalophlebia sp. B-ABV8738",
                                "bff34b36461035f98b4a19c68585670d" = "Atalophlebia sp. B-ABV8738",
                                "95a45757ca0d1b368fe8074fd74c305e" = "Atalophlebia sp. B-ABV8738",
                                "6b5331b9ae4948258787c763a238337e" = "Atalophlebia sp. B-ABV8738",
                                "b942a5cbd781d243a76e2c4dd69d308a" = "Atalophlebia sp. B-ABV8738",
                                "a588b4d5cf19a86af46629e1079441ae" = "Atalophlebia sp. B-ABV8738",
                                "a401467f0889e90831b562a7a6b76754" = "Atalophlebia sp. B-ABV8738",
                                "f215cae2a2ad3fb1cb2022409008d7d7" = "Atalophlebia sp. B-ABV8738",
                                "cd110aeba62b0abe376f661f202833a9" = "Atalophlebia sp. B-ABV8738",
                                "d1fa9cf86fcf53138dbbb142b97f08b5" = "Atalophlebia sp. B-ABV8738",
                                "cb36ab35170b2da895e9b3d037f28e1e" = "Atalophlebia sp. B-ABV8738",
                                "e2a3cb032fd7259f3e5dfdd838e9ecde" = "Atalophlebia sp. B-ABV8738",
                                "a14e8463b305f03290cb4bcb08592f61" = "Atalophlebia sp. B-ABV8738",
                                "1322d61c1f535e021c096c299b528c06" = "Atalophlebia sp. B-ABV8738",
                                "21895efd7bd1d6feba3c2953cf88a5b3" = "Atalophlebia sp. B-ABV8738",
                                "9e677a3023f89ed21730330455690e16" = "Atalophlebia sp. B-ABV8738",
                                "5b188bdbc5b7941c7479a2a21981064e" = "Atalophlebia sp. B-ABV8738",
                                "a1431e9d360fafc2b2443de41c0c3782" = "Atalophlebia sp. B-ABV8738",
                                "5c88eefaaea3ed54fa3607b40c59cae6" = "Atalophlebia sp. B-ABV8738",
                                "2541e207f53779f1800ae3f512010c1f" = "Atalophlebia sp. B-ABV8738",
                                "bba8aa05127e1611e543e2460f164ec5" = "Atalophlebia sp. B-ABV8738",
                                "203b1c5cab85ecf7d52c3e0bcb8b0796" = "Atalophlebia sp. B-ABV8738",
                                "565684b97d85973575fe6141646bb8a4" = "Atalophlebia sp. B-ABV8738",
                                "d09293a1eac202f29b0e7129cfeeacd9" = "Atalophlebia sp. B-ABV8738",
                                "890a8b167337ad43aea29ff52abce49a" = "Atalophlebia sp. B-ABV8738",
                                "a97cbbfeab2012203000003a1adb0cc0" = "Atalophlebia sp. B-ABV8738",
                                "b42084ae609f8be35664d7da75a033d5" = "Atalophlebia sp. B-ABV8738",
                                "ba38db874b621f4b4b153f2029227c1e" = "Atalophlebia sp. B-ABV8738",
                                "959bccfd4539922de2d81c1ac8bffc60" = "Atalophlebia sp. B-ABV8738",
                                "41bb20f079819ba1bc999cff4264ce10" = "Atalophlebia sp. B-ABV8738",
                                "a45b2f42201c473c0bda9448991f2f76" = "Austrheithrus glymma group",
                                "9fa8ccb4ebacd70196bec0fe4009dbdb" = "Austrosimulium furiosum",
                                "64d1a48a6ecdf91a3302ac93abb2660b" = "Cardiocladius sp. B-AAW4309",
                                "f2a4e6257cf87a30b64a0b2bae77383c" = "Chaetogaster diastrophus",
                                "86b33bf13e66c6c67d3f5474293b571e" = "Cheumatopsyche alampeta",
                                "238c2c0ba0114584f6c19f0af402918d" = "Cheumatopsyche alampeta",
                                "41731cb0901269ad2a332136172821e9" = "Cheumatopsyche alampeta",
                                "a61411743ca3648acb6ba5515a790bac" = "Cheumatopsyche alampeta",
                                "d69784b654683ffbf8c9f4b322fcceac" = "Coloburiscoides munionga",
                                "6fd09aa00745f711988abb7f706f94d3" = "Cricotopus sp. B-ACQ6787",
                                "70dd479dab11e6c210f1b09ee0e034ef" = "Cricotopus tasmania",
                                "a63f49201a1d50046d9d30dfb66dc8ad" = "Cricotopus tasmania",
                                "7a2c1044d52c83b368a156311ecebd8c" = "Dinotoperla thwaitesi",
                                "73ea249cf444d566b8f16ac379050060" = "Dinotoperla thwaitesi",
                                "939a96cb02f7b39f695000ed1cceb03e" = "Dinotoperla thwaitesi",
                                "861e0cfb5221abdc6064db2b1926fce8" = "Dinotoperla walkeri/evansi",
                                "b167c9e6e63d586c8f79138f640da0cb" = "Eusthenia sp. B-ABX4126",
                                "da4d55f930d324ef809f8cb8ed9f7f92" = "Limnophyes sp. B-ABV0255",
                                "a787c9445c65f9dd4c79bc70d36a6b43" = "Notriolus sp. B-ACG2297",
                                "40c9a0e410636ea12e8939097e2d1e70" = "Illiesoperla mayi",
                                "c1921daa3f5540925d9e5665ddd685d7" = "Illiesoperla mayi",
                                "7c5030e27cdd452bca4b9f8e0053282c" = "Ferrissia sp. B-AAE6642",
                                "550b713ce1a34a038a8397950a2c1e88" = "Ferrissia sp. B-AAE6642",
                                "9c8d4ed11f998adb5b1d39c37ab5757a" = "Ferrissia sp. B-AAE6642",
                                "d7ec6a3ffce28d814e99a0fb4bc341fc" = "Orthotrichia sp. B-ACN2323",
                                "3c53818b7dba9d904b7eea8ff74da37f" = "Orthotrichia sp. B-ACN2323",
                                "f7358734f527c2ee2d34faee20d698c9" = "Orthotrichia sp. B-ACN2323",
                                "82d28b72c3abb370e13d65dd276f89ee" = "Rhadinosticta simplex",
                                "65f7c2bfe69db19644a64586b0d58634" = "Rhadinosticta simplex",
                                "caef4a0caa706750af87af8b29f76cca" = "Rhadinosticta simplex",
                                "f69cda376ebfda153f279dd5a4ec0620" = "Rhadinosticta simplex",
                                "2ea0943ed6a0c0226ca86b14bdba3a86" = "Koorrnonga sp. B-ABV9141",
                                "2663fc79f8b9ef35a7034bbab1d17c84" = "Koorrnonga sp. B-ABV9141",
                                "417a147572314eb831920593a6f855a6" = "Limnodrilus hoffmeisteri",
                                "73b30f3d5ed35a60478bb40faa743103" = "Limnodrilus hoffmeisteri",
                                "54c4f55ce6c085a4ae3c48b0f6cfdf85" = "Limnophila sp. B-ABX1092",
                                "5891552594c69be0ce0115907b14e679" = "Limnophila sp. B-ABX1092",
                                "ca0d841497e5adc77bb5c77ad6387a55" = "Limnophila sp. B-ABX1092",
                                "f9f17f1fc2377cf4a3ad3af2e06b8822" = "Limnophila sp. B-ABX1092",
                                "c5e9ed11cb3e54ebe7be96ab7fa4e7bb" = "Limnophila sp. B-ABX1092",
                                "3ba6698641d2024757af7d454cf2f7b2" = "Limnophila sp. B-ABX1092",
                                "69f0912a9f5891036280cd9ba3e42b2f" = "Limnophila sp. B-ABX1092",
                                "f02ae936d610e8de0863bc9c5b4f7775" = "Limnophila sp. B-ABX1092",
                                "a754f5c95f942ea3e163edc51f4c5340" = "Limnophila sp. B-ABX1092",
                                "717f60174e763821a83f2a0e2ab4cbfe" = "Limnophila sp. B-ABX1092",
                                "022d6c5f8ca3ddbb38862fca738ac945" = "Limnophila sp. B-ABX1092",
                                "d361f81aada6a3131743d917a65ce5e0" = "Limnophila sp. B-ABX1092",
                                "4b2149125b1eab4d0bf0aa4b3a3f3e33" = "Limnophila sp. B-ABX1092",
                                "1bb889d6c302970481be889e8a5f072b" = "Limnophila sp. B-ABX1092",
                                "e4452ccd492478fde868f344768d8805" = "Limnophila sp. B-ABX1092",
                                "3dbfba4ead1a39db6b9a8dca521fe0cd" = "Limnophila sp. B-ABX1092",
                                "9e43bbc1aa041afebb1729d917e2982b" = "Limnophila sp. B-ABA7043",
                                "93f462dbf201410a4c974864acaa9fb0" = "Lingora aurata group",
                                "6f7613ecf48108b0bca63214e95ddcca" = "Lingora aurata group",
                                "fa0de3c722446253f03b74865de00718" = "Notalina sp. B-AAX5636",
                                "a67b61dbe9026c95e7c3c25850c6c5b9" = "Polypedilum sp. B-ABW9978 complex",
                                "d48af1b82d2eb69c5d0da945d3366ae3" = "Polypedilum sp. B-ABW9978 complex",
                                "59372b4f54b83af133acd252413da311" = "Polypedilum sp. B-ABW9978 complex",
                                "d519a38d28845ececf8021aea89531b8" = "Polypedilum sp. B-ABW9978 complex",
                                "291cc67efd2da86187773af96c3e3f56" = "Polypedilum sp. B-ABW9978 complex",
                                "511189152aa7f9d85677418faf42d06e" = "Procorticacarus victorianus",
                                "52a8e64777b6f4c814c66bb5079989bb" = "Psychodidae sp. B-ABX5328",
                                "974cf8d785ec14d520a28a8818ebc7b4" = "Psychodidae sp. B-ABX5328",
                                "c2d4cf0d470ec12e35414a11ef0e9109" = "Psychodidae sp. B-ABX5328",
                                "405998b987b936242e29741e7f0660bc" = "Psychodidae sp. B-ABA8299",
                                "73027f700d0ee65d3a298efbb1f1a32f" = "Psychodidae sp. B-ABA8299",
                                "88d6f6daac318409374d918f40df3ffb" = "Ptychobiosis sp. B-AAZ4433",
                                "8bdc2627bd8205a94f40a831d20e1aef" = "Riethia sp. B-ADU5431",
                                "1d5760deee25f457d5f3aae91017277a" = "Riethia sp. B-ADU5431",
                                "ea684a894cc14c0925e5d020a9d7688c" = "Scatella sp. B-ACK6288/ACZ6583",
                                "7c37484ef50b5a349f73a716e89e42c5" = "Trinotoperla sp. B-ABX3937",
                                "ddcda4ff5e9b8671ad3fc3a0e9e16528" = "Trinotoperla sp. B-ABX3937",
                                "a3fe86602ff20f2b783583479eb170c4" = "Trinotoperla sp. B-ABX3937",
                                "220c6618187900450d1dcbb0f4d4d50d" = "Trinotoperla sp. B-ABX3937",
                                "be8e76eeb23d917e56f02dee0843b7cc" = "Trinotoperla sp. B-ABX3937",
                                "40fcd2e8af6ea029fdadeca338dc5c9b" = "Trinotoperla sp. B-ABX3937",
                                "c9b5c5cd88d41c2d881b924ccf47ea4d" = "Ulmerochorema onychion",
                                "b219d1dce6730bb64da1e45908ee8e3d" = "Ulmerophlebia sp. B-ABV8830",
                                "eb8a6ac51ba6e4ec934d77dfe7093571" = "Psychoda gemina",
                                "f2580e04289f1d317c72f6db321bdd9f" = "Psychoda gemina",
                                "9b4fd984d9ce6d3a02d16b014004f6e6" = "Psychoda gemina",
                                "c26d3a09def236ddd150bacc51117c55" = "Psychoda gemina",
                                "7e51985e8eedc43b9477c0f8697ee18a" = "Psychoda gemina",
                                "283e9e16054ee601d749f2f959958e1f" = "Psychoda gemina",
                                "af2ad7276ba40e03989a485856d1b0b8" = "Psychoda gemina",
                                "c85fa78fa52e9d30ea72015607998944" = "Psychoda gemina",
                                "91718ad5f4ac2909fc4dabf3b7f83058" = "Psychoda gemina",
                                "3b9fa04c8f620038fb9bace9f1512db2" = "Psychoda gemina",
                                "71b7133a1e35444c1387ebce1efb9c28" = "Psychoda gemina",
                                "15ad79e5f9cf6f49b71709fe727cf470" = "Psychoda gemina",
                                "a88b8fa7362a69b12d30503dc0e0d40a" = "Psychoda gemina",
                                "81987c57de8c8f22484fc7fec4968faa" = "Psychoda gemina",
                                "4a1f3d084687a5aa80f0cd00756dfbdf" = "Ceratopogonidae sp. B-ADC4845",
                                "c39071b45b2b525d469880c964415d69" = " Atalophlebia sp. B-ACM3545",
                                "41ce939b84d4c7112897272755142a23" = "Coenoria sp. B-ABX6841",
                                "c943023dbfdf852f96b76e2dcbd5f50d" = "Triplectides sp. B-AAE7976",
                                "d2ef9058a103a1979e980e612264520e" = "Triplectides sp. B-AAE7976",
                                "f5d5087598c770d95edc3439abc7289e" = "Triplectides sp. B-AAE7976",
                                "17c2cab3817d9ea79ce1a0227e16aebf" = "Triplectides sp. B-AAE7976",
                                "6a34b14ed40b13400ef226f0be01fba0" = "Triplectides sp. B-AAE7976",
                                "6c80faf3a4ffaa4cf3c671b53794d054" = "Triplectides sp. B-AAE7976",
                                "4b7764a805eac8286cc0458955f7071a" = "Triplectides sp. B-AAE7976",
                                "08227125d404fb7c99e777cd0feb6e19" = "Triplectides sp. B-AAE7976",
                                "beb2be3786f39b4e2b86e345bce96b9b" = "Nothocyphon serratipenis",
                                "7991ada89d1e5bc6d86e0b79ebb273c9" = "Nothocyphon serratipenis",
                                "a9ca6b9e0d6c2c3f69a1ab6f62227e6c" = "Nothocyphon serratipenis",
                                "201cfdafcc628ccbcbd13f77928a97af" = "Nothocyphon serratipenis",
                                "516cca6e694eef5726c0dbbb76dc5414" = "Nothocyphon serratipenis",
                                "ba5fb41916aff499ffee8e4bb86578f0" = "Nothocyphon serratipenis",
                                "3e55ecc587652697ef5db92aa60564cf" = "Nothocyphon serratipenis",
                                "415f18a3295dc264a9f199cc78e101ad" = "Nothocyphon serratipenis",
                                "767925f33c3613abdb2c5df758cb5633" = "Culicoides sigmoidus",
                                "75f3fbd1e44caedd30cafdc7619b1668" = "Culicoides sigmoidus",
                                "89002fcf8b68c4719b9b74f183b4127e" = "Culicoides sigmoidus",
                                "77145e511d943073d06091b644f724b8" = "Culicoides sigmoidus",
                                "25370f418fc2d7a5220655ff24fbbd6e" = "Nousia sp. B-ACM3519",
                                "6abec724e4ec8d2683da63476a6e59d7" = "Cosmioperla sp. B-AEC8235",
                                "51bb3b643e6c884ac72e340348a32c33" = "Ablabesmyia sp. B-AAP5135 complex",
                                "d67b66092a6572d57ac7290d21ef39c4" = "Coloburiscoides munionga",
                                "314b908770c6f9c296aaab2da5698807" = "",
                                "81530c1415a28a9a62322a482d714cef" = "",
                                "3dc52e2c7a31e2a01a84549b92911bcb" = "",
                                "f0e1b9af3b6dbb9a5afc88807a33f535" = "",
                                "aa465397725596f1c084e4e48197372d" = "",
                                "155515de679ea3f96eb251597a8355f5" = "",
                                "7e9db264fabad9a9b2ac755cc524baa3" = "",
                                "66c7e7bc806cfca10de70609b1ae1117" = "",
                                "7abdbe52662941a5b1d6956f74fc8ccf" = "",
                                "fb92efc10fba6e13b30c4e20f3f4be70" = "",
                                "d971c3c25d994549e1ab94b17048486a" = "",
                                "2a8674533aa6463808dced5102f0a1e5" = "",
                                "384f60818615b4dc43d21b4fde820d21" = "",
                                "2a09b204ea25d3ee0c23b26d00822dcf" = "",
                                "c3ef326630a4b7eee124b7f4aa844cd6" = "",
                                "3ea037839cc56c6adab4409ca544f57a" = "",
                                "5fa5b580d9fb1c0503c5b4d05ce567e0" = "",
                                "f2700c9ffaef418a7a9823b08b2b83c9" = "",
                                "6a9ea49438ba346534d213bc5fa3412e" = "",
                                "693405ffa22eb11c8a4302db0e8b6b7e" = "",
                                "edc9cb8e69fe75af9826b60ecbc8f39b" = "",
                                "a06bcf800ab074457f826c9026d93a05" = "",
                                "60b0c55b3de6bcf0a4a4d4f2485a7ff7" = "",
                                "c648f0859a67b40edf948409b8a4967a" = "",
                                "bb9f84db19013052915d3b1ac559f11f" = "",
                                "c3a2b4cfa3238dd8f6e5bf800290fd05" = "",
                                "c56010a8847101c6f955be8758ba6963" = "",
                                "f4c35e10c8e86a6dcee244a349473149" = "",
                                "0bcf51bb494deb438b90e3e956a645bb" = "",
                                "5ec678fc07a30a88297abe1aa71a4ead" = "",
                                "d32a5e240858359c1bd7d6ebde67fe5b" = "",
                                "d453f558117b6d43a6d2feafbd877e0e" = "",
                                "17edbbd11bdd22030c71999c0ed07036" = "",
                                "2aadb65453c6df2420448394917cbc2f" = "",
                                "94dda310e20d3e23a2752787a41a30f3" = "",
                                "cb50aead3ff372183a06f8d09c03ef86" = "",
                                "48b5d8e5472a2cf15d8acf17bfe90ccc" = "",
                                "aad7ed86c3f30cfe5ee5bf4b8226d159" = "",
                                "8ef04e58e9a04a7345c1310b8cc48b58" = "",
                                "e64a94ea4d2c5000abac84231068b15b" = "",
                                "65b850c96c49333ef25d783db98a5f9d" = "",
                                "20c0f2c414bc8b2ff71a32ef4a6da942" = "",
                                "4ff6a29cd87280c79d609ba2690b9b92" = "",
                                "50a1d897e621e2dbb170bc4a7d206319" = "",
                                "91162e539c973809dfa49f065bcb46c2" = "",
                                "9e5035bf7ec6a1f2c651ed0e98ed2da7" = "",
                                "c2fb64f0e662b5db32c11ee187a9bd0f" = "Cognettia chlorophila/sphagnetorum",
                                "c4e01d5fa4513318a1be2a00899d6e1a" = "Cognettia chlorophila/sphagnetorum",
                                "dfde7b1be822b7bc262c5802de893bef" = "Cricotopus tasmania",
                                "6953883ab581308a26ff62f2c277383c" = "Spongillidae sp. B-AAJ0256",
                                "7f15bdde33a25d1d333699264f073d37" = "Notriolus sp. B-ACG2297",
                                "f6ba88fdb937e5c233ff1acef9dc399b" = "Notriolus sp. B-ACG2297",
                                "19661209bd3d6750ef55e93b6f8f400b" = "Ferrissia sp. B-AAY1880 group",
                                "2b943424b95aee577e27aa221cf57118" = "Galerucinae sp. B-ABA9962",
                                "00b75095625dec00f84aaf4bd35f7561" = "Naididae sp. B-ADJ9699",
                                "1995d15a2bf7a1e13a2f446c2181bd74" = "Bothrioneurum vejdovskyanum",
                                "8274abe141342580cb6f742678bb269f" = "Naididae sp. B-ADJ9699",
                                "93f3b3bd831f808b1c0a510df9f02167" = "Bothrioneurum vejdovskyanum",
                                "99fcb0d3ffaa8726ccd9cd45fc9bf112" = "Bothrioneurum vejdovskyanum",
                                "c5f8109e46eebba439317d8eabd7c043" = "Naididae sp. B-ADJ9699",
                                "cfc29e6b343c7f58f485f311fa3cbb6e" = "Naididae sp. B-ADJ9699",
                                "d21a7e8c0685b94466ab06d13964d5ef" = "Bothrioneurum vejdovskyanum",
                                "e94b3c334cab692f4efdad397b9f116c" = "Bothrioneurum vejdovskyanum",
                                "f530f2b01471bba22dff9d650ba78834" = "Bothrioneurum vejdovskyanum",
                                "e7e0a193d3d4d87970b57d391d01e589" = "Limnophila sp. B-ABA7043",
                                "41e26b047eedf4f0f3d3772fd10b6166" = "Naididae sp. B-AAN7517",
                                "cd53765b72dab09daf8a3e8f90d68803" = "Naididae sp. B-AAN7517",
                                "cdb84f89f487741e7c818ca0646fb123" = "Procladius sp. B-AEN1862",
                                "eb8a6ac51ba6e4ec934d77dfe7093571" = "Psychoda sp. B-AAU4648",
                                "c85fa78fa52e9d30ea72015607998944" = "Psychoda sp. B-AAU4648",
                                "af2ad7276ba40e03989a485856d1b0b8" = "Psychoda sp. B-AAU4648",
                                "a88b8fa7362a69b12d30503dc0e0d40a" = "Psychoda sp. B-AAU4648",
                                "9b4fd984d9ce6d3a02d16b014004f6e6" = "Psychoda sp. B-AAU4648",
                                "81987c57de8c8f22484fc7fec4968faa" = "Psychoda sp. B-AAU4648",
                                "91718ad5f4ac2909fc4dabf3b7f83058" = "Psychoda sp. B-AAU4648",
                                "3b9fa04c8f620038fb9bace9f1512db2" = "Psychoda sp. B-AAU4648",
                                "1d5760deee25f457d5f3aae91017277a" = "Riethia zeylandica",
                                "f0671dc5cb44b617842a1e84dba330c0" = "Tanytarsus fuscithorax")

# Convert the above to a data_frame and check that all corrections capture all errors in truncated_fills
asctf_df <- data.frame(asv_code = names(asv_species_corrections_tf), 
                       new_species = asv_species_corrections_tf)
asctf_df$old_species <- tfill$species[match(asctf_df$asv_code, tfill$asv_code)]
# 237 changes
# Remove redundant rows (where new_species = old_species)
asctf_df <- asctf_df[asctf_df$new_species != asctf_df$old_species,] # down to 214

# All records that need to change to species = "" taken care of in Appendix 2
asctf_df <- asctf_df[asctf_df$new_species != "",] # down to 170

# Remove "group"/"complex" from all names and the one two-bins-separated-by-/ name - these will be corrected later
asctf_df$new_species <- gsub(" group", "", asctf_df$new_species)
asctf_df$new_species <- gsub(" complex", "", asctf_df$new_species)
asctf_df$old_species <- gsub(" group", "", asctf_df$old_species)
asctf_df$old_species[asctf_df$old_species == "Lingora sp. B-AAY5550/ADF2103"] <- "Lingora sp. B-AAY5550"
asctf_df$new_species[asctf_df$new_species == "Scatella sp. B-ACK6288/ACZ6583"] <- "Scatella sp. B-ACK6288"

# Find matching bold records to check corrections
asctf_df$bold_species <- NA
asctf_df$bin_uri <- NA
asctf_df$n_bins <- NA
asctf_df$del <- 0
for(i in 1:nrow(asctf_df)){
  boldi <- match_list_bin_uri[asctf_df$asv_code[i]][[1]]
 # If the asv_code has no bold match, check manually (below)
  if(nrow(boldi) == 0 | is.na(boldi$bin_uri[1])){
    asctf_df$bold_species[i] <- NA
    asctf_df$n_bins[i] <- 0
  }else{
    asctf_df$bold_species[i] <- boldi$taxonomicidentification[1]
    asctf_df$bin_uri[i] <- boldi$bin_uri[1]
    asctf_df$n_bins[i] <- length(unique(boldi$bin_uri))
    if(grepl("B-",asctf_df$new_species[i])){
    # If the new names has B- in it, and the name before sp. B is the same among
    # new_species, old_species and bold_species, remove from consideration
    # these will be corrected appropriately in appendix B
    new_gen <- strsplit(asctf_df$new_species, " ")[[1]][1]
    old_gen <- strsplit(asctf_df$old_species, " ")[[1]][1]
    bold_gen <- strsplit(asctf_df$bold_species, " ")[[1]][1]
       if(new_gen == old_gen & old_gen == bold_gen){
         asctf_df$del[i] <- 1
 }
  }
  }
}
asctf_df <- asctf_df[asctf_df$del == 0,]  # reduced to 57 

# Correct BOLD names - now done in Appendix 2
bold_name_corrections <- 
c("AAE9243" = "Cheumatopsyche alampeta",
"ACG2503" = "Coloburiscoides munionga",
"ACV9482" = "Cricotopus tasmania",
"ABX3893" = "Illiesoperla mayi",	
"ACG1875" = "Rhadinosticta simplex",
"ADJ8523" = "Limnodrilus hoffmeisteri",
"AEI0789" = "Procorticacarus victorianus",
"ABV8829" = "Ulmerochorema onychion",
"AAU4648" = "Psychoda gemina",
"ACV9482" = "Cricotopus tasmania",
"AAT8936" =  "Cognettia chlorophila/sphagnetorum",
"AAF0821" = "Tanytarsus fuscithorax",
"ACB6471" = "Chaetogaster diastrophus",
"ABX5220" = "Austrosimulium furiosum",
"ABY8640" = "Lingora aurata",
"AAW2994" = "Austrheithrus glymma",
"ACD5693" = "Dinotoperla thwaitesi",
"ABX4166" = "Dinotoperla walkeri/evansi",
"ACV9616" = "Bothrioneurum vejdovskyanum",
"AAX5275" = "Bothrioneurum vejdovskyanum",
"ACI5239" = "Bothrioneurum vejdovskyanum")

asctf_df <- asctf_df[!asctf_df$bin_uri %in% names(bold_name_corrections),]  # reduced to 8

# straight name change - done in Appendix 2 separately
# "Culicoides sp. MC-24"  = "Culicoides sigmoidus"
asctf_df <- asctf_df[asctf_df$old_species != "Culicoides sp. MC-24",]  # reduced to 4

# I decide in Appendix 2 that the change of c4e01d5fa4513318a1be2a00899d6e1a to
#  Cognettia chlorophila/sphagnetorum is wrong and make this and other changes to
#  make assignment of "Chamaedrilus varisetosus" more consistent.

# That leave 3 changes that I am unable to check - need Mel's input on those. (See appendix 2)

# #                             asv_code                        new_species                   old_species         bold_species bin_uri n_bins del
# 158 51bb3b643e6c884ac72e340348a32c33          Ablabesmyia sp. B-AAP5135     Ablabesmyia sp. B-ACG8949                 <NA>    <NA>      0   0
# 159 d67b66092a6572d57ac7290d21ef39c4           Coloburiscoides munionga Coloburiscoides sp. B-ADW5046                 <NA>    <NA>      0   0
# 212 19661209bd3d6750ef55e93b6f8f400b            Ferrissia sp. B-AAY1880            Ferrissia sp. MC-1                 <NA>    <NA>      0   0

# I think the asv_genus_corrections are generally unnecessary. See Appendix 2

asv_genus_corrections_tf <- c("64d1a48a6ecdf91a3302ac93abb2660b" = "Cardiocladius",
                              "b167c9e6e63d586c8f79138f640da0cb" = "Eusthenia",
                              "40c9a0e410636ea12e8939097e2d1e70" = "Illiesoperla",
                              "c1921daa3f5540925d9e5665ddd685d7" = "Illiesoperla",
                              "417a147572314eb831920593a6f855a6" = "Limnodrilus",
                              "73b30f3d5ed35a60478bb40faa743103" = "Limnodrilus",
                              "54c4f55ce6c085a4ae3c48b0f6cfdf85" = "Limnophila",
                              "5891552594c69be0ce0115907b14e679" = "Limnophila",
                              "ca0d841497e5adc77bb5c77ad6387a55" = "Limnophila",
                              "f9f17f1fc2377cf4a3ad3af2e06b8822" = "Limnophila",
                              "c5e9ed11cb3e54ebe7be96ab7fa4e7bb" = "Limnophila",
                              "3ba6698641d2024757af7d454cf2f7b2" = "Limnophila",
                              "69f0912a9f5891036280cd9ba3e42b2f" = "Limnophila",
                              "f02ae936d610e8de0863bc9c5b4f7775" = "Limnophila",
                              "a754f5c95f942ea3e163edc51f4c5340" = "Limnophila",
                              "717f60174e763821a83f2a0e2ab4cbfe" = "Limnophila",
                              "022d6c5f8ca3ddbb38862fca738ac945" = "Limnophila",
                              "d361f81aada6a3131743d917a65ce5e0" = "Limnophila",
                              "4b2149125b1eab4d0bf0aa4b3a3f3e33" = "Limnophila",
                              "1bb889d6c302970481be889e8a5f072b" = "Limnophila",
                              "e4452ccd492478fde868f344768d8805" = "Limnophila",
                              "3dbfba4ead1a39db6b9a8dca521fe0cd" = "Limnophila",
                              "d7ec6a3ffce28d814e99a0fb4bc341fc" = "Orthotrichia",
                              "3c53818b7dba9d904b7eea8ff74da37f" = "Orthotrichia",
                              "f7358734f527c2ee2d34faee20d698c9" = "Orthotrichia",
                              "82d28b72c3abb370e13d65dd276f89ee" = "Rhadinosticta",
                              "65f7c2bfe69db19644a64586b0d58634" = "Rhadinosticta",
                              "caef4a0caa706750af87af8b29f76cca" = "Rhadinosticta",
                              "f69cda376ebfda153f279dd5a4ec0620" = "Rhadinosticta",
                              "9ca9760013a77462d9c5e2c942e4d27e" = "Phytophthora",
                              "d5ee6716a28d4eb9b0d60465ff707327" = "Atrichopogon",
                              "bef6b5cae9985af4b85a6b605fa9fdde" = "Atrichopogon",
                              "1acd38a074a29e8ec63a20a7417366c0" = "Atrichopogon",
                              "2746221e52f4eaf9941524f1e91d1938" = "Atrichopogon",
                              "1510e9da49de6fd35eeb269c7e009bdc" = "Atrichopogon",
                              "3884d87677ac17de269a9dcb9f4e122e" = "Atrichopogon",
                              "b673ad9c60ae7b8ca484dca510c480b7" = "Atrichopogon",
                              "89826614d379a646660009c87d7277a4" = "Atrichopogon",
                              "966d602e3b481bdce8fcb84d7e12e284" = "Atrichopogon",
                              "beb2be3786f39b4e2b86e345bce96b9b" = "Nothocyphon",
                              "7991ada89d1e5bc6d86e0b79ebb273c9" = "Nothocyphon",
                              "a9ca6b9e0d6c2c3f69a1ab6f62227e6c" = "Nothocyphon",
                              "201cfdafcc628ccbcbd13f77928a97af" = "Nothocyphon",
                              "516cca6e694eef5726c0dbbb76dc5414" = "Nothocyphon",
                              "ba5fb41916aff499ffee8e4bb86578f0" = "Nothocyphon",
                              "3e55ecc587652697ef5db92aa60564cf" = "Nothocyphon",
                              "415f18a3295dc264a9f199cc78e101ad" = "Nothocyphon",
                              "4ff6a29cd87280c79d609ba2690b9b92" = "",
                              "91162e539c973809dfa49f065bcb46c2" = "",
                              "314b908770c6f9c296aaab2da5698807" = "", 
                              "34e16163d6aa109cd49e63dd9c77063e" = "Sphaerium",
                              "3dc52e2c7a31e2a01a84549b92911bcb" = "Sphaerium",
                              "5c1015d5f6cc01d7ac95378200637dd8" = "Sphaerium",
                              "601d1f503e11bfbd84ea1b5010a73db8" = "Sphaerium",
                              "81530c1415a28a9a62322a482d714cef" = "Sphaerium",
                              "959c81957d1b849ed9c77739c0cb4085" = "Sphaerium",
                              "a9a514669a42c0a26a908d6d7c977852" = "Sphaerium",
                              "aa87944be7ace16e376e12531934de9e" = "Sphaerium",
                              "86b33bf13e66c6c67d3f5474293b571e" = "Cheumatopsyche",
                              "da4d55f930d324ef809f8cb8ed9f7f92" = "Limnophyes",
                              "17d370084150f91d09432df645e3a689" = "Apsectrotanypus",
                              "5d99739d90edd7a4c04c039c31e5e1d4" = "Apsectrotanypus",
                              "7b63fa3e6001d8dd5b1e6ed4fb5cd8d2" = "Apsectrotanypus",
                              "a45b2f42201c473c0bda9448991f2f76" = "Austrheithrus",
                              "3f4b5bb8f843b6231461c257d99f8411" = "Gynoplistia",
                              "8ca4a080d6a6bf02b39c7ad1e83b0439" = "Apsectrotanypus",
                              "c2fb64f0e662b5db32c11ee187a9bd0f" = "Cognettia",
                              "c4e01d5fa4513318a1be2a00899d6e1a" = "Cognettia",
                              "7f15bdde33a25d1d333699264f073d37" = "Notriolus",
                              "f6ba88fdb937e5c233ff1acef9dc399b" = "Notriolus",
                              "4e47d884df5e7e6d0a0ff88304991c65" = "Gymnochthebius",
                              "2a355d22517b206b021ee593c90e89bd" = "Gymnochthebius",
                              "654a2f07087d509901669d96f5e6e559" = "Gymnochthebius",
                              "00b75095625dec00f84aaf4bd35f7561" = "",
                              "1995d15a2bf7a1e13a2f446c2181bd74" = "Bothrioneurum",
                              "8274abe141342580cb6f742678bb269f" = "",
                              "93f3b3bd831f808b1c0a510df9f02167" = "Bothrioneurum",
                              "99fcb0d3ffaa8726ccd9cd45fc9bf112" = "Bothrioneurum",
                              "c5f8109e46eebba439317d8eabd7c043" = "",
                              "cfc29e6b343c7f58f485f311fa3cbb6e" = "",
                              "d21a7e8c0685b94466ab06d13964d5ef" = "Bothrioneurum",
                              "e94b3c334cab692f4efdad397b9f116c" = "Bothrioneurum",
                              "f530f2b01471bba22dff9d650ba78834" = "Bothrioneurum",
                              "e7e0a193d3d4d87970b57d391d01e589" = "Limnophila",
                              "41e26b047eedf4f0f3d3772fd10b6166" = "",
                              "cd53765b72dab09daf8a3e8f90d68803" = "",
                              "3f4b5bb8f843b6231461c257d99f8411" = "Gynoplistia",
                              "741aca4ed6f6847e894d0ae837cc5032" = "Psychoda")

# Convert the above to a data_frame and check that all corrections capture all errors in truncated_fills
agctf_df <- data.frame(asv_code = names(asv_genus_corrections_tf), 
                       new_genus = asv_genus_corrections_tf)
agctf_df$old_genus <- tfill$genus[match(agctf_df$asv_code, tfill$asv_code)]
agctf_df$old_species <- tfill$species[match(agctf_df$asv_code, tfill$asv_code)]
agctf_df$new_species <- NA
for(i in 1:nrow(agctf_df)){
  if(agctf_df$asv_code[i] %in% asctf_df$asv_code)
   agctf_df$new_species[i] <- asctf_df$new_species[asctf_df$asv_code == agctf_df$asv_code[i]]
  }
sum(agctf_df$asv_code %in% asctf_df$asv_code)

# Remove 9ca9760013a77462d9c5e2c942e4d27e (see appendix 2)
agctf_df <- agctf_df[agctf_df$asv_code != "9ca9760013a77462d9c5e2c942e4d27e",]
# Remove all records where old_genus = new_genus (so no change required)
agctf_df <- agctf_df[!is.na(agctf_df$old_genus) & !is.na(agctf_df$new_genus) & 
                       agctf_df$old_genus != agctf_df$new_genus,]
# Remove all records where new_genus matches new_species (and will thus be picked up later)
agctf_df$del <- 0
for(i in 1:nrow(agctf_df)){
  if(!is.na(agctf_df$new_species[i]) & agctf_df$new_species[i] != ""){
  genspi <- strsplit(agctf_df$new_species[i]," ")[[1]][1]
  if(genspi == agctf_df$new_genus[i]){
    agctf_df$del[i] <- 1
  }
  }
}
agctf_df <- agctf_df[agctf_df$del == 0,]

# Leaves 19 records that can mainly be resolved without recourse to asv_codes
# Sphaerium, Apsectrotanypus and Gynoplistia dealt with in revised Appendix 2
agctf_df <- agctf_df[!grepl("Sphaerium", agctf_df$old_species),]
asctf_df <- asctf_df[!grepl("Sphaerium", asctf_df$old_species),]
agctf_df <- agctf_df[!grepl("Apsectrotanypus", agctf_df$old_species),]
agctf_df <- agctf_df[!grepl("Gynoplistia", agctf_df$old_species),]
# and that just left two unidentified Naididae species - also taken care of in Appendix 2.

