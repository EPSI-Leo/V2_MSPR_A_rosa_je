-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 avr. 2024 à 09:41
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arosaje2`
--

-- --------------------------------------------------------

--
-- Structure de la table `advices`
--

DROP TABLE IF EXISTS `advices`;
CREATE TABLE IF NOT EXISTS `advices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_plant` varchar(191) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `advice` text,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `advices`
--

INSERT INTO `advices` (`id`, `id_user`, `id_plant`, `name`, `advice`) VALUES
(254, 0, NULL, 'Rose', 'Ne pas enlever les épines'),
(255, 0, NULL, 'Tournesol', 'On peut manger les graines, ou en faire de l\'huile'),
(57, 0, NULL, 'Muguet', 'C\'est toxic'),
(78, 0, NULL, 'kjhgfPOKIJHGVC', 'LKJHGFC');

-- --------------------------------------------------------

--
-- Structure de la table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(191) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `beginAt` date DEFAULT NULL,
  `endAt` date DEFAULT NULL,
  `description` text,
  `picture` longblob,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81023 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plants`
--

INSERT INTO `plants` (`id`, `id_user`, `name`, `beginAt`, `endAt`, `description`, `picture`, `latitude`, `longitude`) VALUES
(1, 'admin', 'Cactus', '2024-03-12', '2024-03-12', 'QSFRYILOMLKJHGFDSFGHJK/§', 0xffd8ffe000104a46494600010100000100010000ffe1020645786966000049492a000800000007000001030001000000400100000101030001000000f00000000f010700060000007600000010010700130000007c00000012010300010000000800000032010200140000006200000069870400010000009000000000000000323032343a30333a31322031323a31343a343100476f6f676c6573646b5f6770686f6e6536345f7838365f36340016009a82050001000000d60100009d82050001000000ee01000027880300010000006400000000900700040000003032323003900200140000009e0100000490020014000000b201000001920a0001000000de0100000292050001000000f60100000692050001000000e60100000992030001000000200000000a92050001000000c601000090920200040000003234380091920200040000003234380092920200040000003234380001a00300010000000100000002a00400010000004001000003a0040001000000f000000002a40300010000000000000003a40300010000000000000004a4050001000000ce01000005a4030001000000084a00000ca40300010000000100000000000000323032343a30333a31322031323a31343a343100323032343a30333a31322031323a31343a34310018ab0000102700000c7b0000102700003c000000102700004a20010010270000d4030000102700009443000010270000c73d000010270000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800f0014003012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f6da28a2be4ce80a28a2800a28a2800a28a2800a28a2800a28a2800aa7ab7fc81afbfebde4ff00d04d5ca86ee0fb559cf6fbb6f9b1b26ec671918cd00793d759e18ff906c9ff005d8ff25a7ffc20dff511ff00c81ffd956d691e1bfb0da3c5f6bdf990b67cbc761efed58623f86ccab7c0c6515a7fd91ff4dfff001cff00ebd1fd91ff004dff00f1cffebd79a708691ff2dbfe03fd6b4eab5a5a7d977fcfbb763b6318ab35f6d947fb9c3e7f9b3aa9fc2828a28af48d028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a3451457c81a8514514005145140051451400514514005145140051451400559b7ff567eb55aacdbffab3f5aaa787faccbd95ed7ff8722a479a2d12d14515d3feaf7fd3cfc3fe09cdec7cc28a28af6f0787fab518d2bdedfe77358c7955828a28ae92828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a3451457c81a8514514005145140051451400514514005145140051451400559b7ff567eb55aacdbffab3f5aebc07fbc47e7f9314b625a28a2be90cc28a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00a3451457c81a85145140051451400514514005145739aa78aff00b375196d3ec5e67978f9fcdc67201e98f7a00b9e28ff009172effe01ff00a1ad79c5747aa78aff00b4b4e96d3ec5e5f998f9fcdce3041e98f6ae72800a28a2bae3f0a3c6abf1cbd585759e18ff00906c9ff5d8ff0025ae4ebacf0c7fc8364ffaec7f92d73e33f812f97e6287c46d514515e19b851451400569e91ff2dbfe03fd6b32ad5a5dfd977fc9bb763be318af4b28ff007c87cff26694fe246e51599fdaff00f4c3ff001fff00eb51fdafff004c3ff1ff00feb57db1d469d154ed2fbed5294f2f6e1739dd9ab940051451400514514005145140051451400514514005145140051451401468a28af90350a28a2800a28a2800a28a2800af39f147fc8c777ff00ffd016bd1abce7c51ff00231ddffc03ff00405aa84799d8cab55f671bdae63d14515a7b1f339bebbfddfc428a28ad92b2b1c5297349bee15d67863fe41b27fd763fc96b93aeb3c31ff20d93febb1fe4b5cd8cfe04be5f98e1f11b54555d4ffe41379ff5c1ff00f4135e6d5e19b9ea745796515e8e1f2ff6d4d4f9ad7f2ff826f0a3cd1bdcf53a2bcb28aefc1e0bead5a3579af6f2f2b1a46872bbdcf53a2bcb2bd274cff904d9ff00d704ff00d0457b7f5bf235e53634aff8fa6ff70ff315b158fa57fc7d37fb87f98ad8aeaa73e78a912d5828a28ab00a28a2800a28a2800a28a2800a28a2800a28a2800a28a28028d14515f206a14514500145145001451450015e73e28ff918eeff00e01ffa02d7a3579cf8a3fe463bbff807fe80b5ad1f88e4c67c0bd4c7a28a2ba0f3828a28a002bacf0c7fc8364ffaec7f92d7275d67863fe41b27fd763fc96b9719fc097cbf32a1f11a1a9ffc826f3feb83ff00e826bcdabd2753ff00904de7fd707ffd04d79b57866e1451457d1e03fdde3f3fcd9dd47e04145145761a057a4e99ff00209b3ffae09ffa08af36af49d33fe41367ff005c13ff00411401b1a57fc7d37fb87f98ad8ac7d2bfe3e9bfdc3fcc56c57a587fe1a21ee1451456e20a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803c4e8a28af9d3c80a28a2800a28a28036a0ff8f78ffdc1fcaa4a8e0ff8f78ffdc1fcaa4ae696ecf06b7f125eac28a2b84f117c47fec1d76e74cfecaf3fc9dbfbcfb46ddd950dd369f5f5a9333bba2bcc3fe16fff00d40bff0026ff00fb0a3fe16fff00d40bff0026ff00fb0a00f4fa2bcc3fe16fff00d40bff0026ff00fb0ab5a6fc53fed0d56cecbfb1bcbfb44e916ffb5676ee60338d9cf5a00f45a28a28022baff8f49bfeb9b7f2ae66ba6baff8f49bfeb9b7f2ae66800a28a2bbe8fc08faecaffdd21f3fcd8514515a9de15e93a67fc826cffeb827fe822bcdabd274cff904d9ff00d704ff00d045005aa28a2be6f1ff00ef12f97e48e2adf1b0a28a2b90c82b774fff008f18ff001fe66b0ab774ff00f8f18ff1fe66802cd14515f5b90ffbb4bfc4ff002474d1f8428a28af6cd428a28a0028a28a0028a28a00f13a28a2be74f2028a28a0028a28a00da83fe3de3ff707f2a92a383fe3de3ff707f2a92b9a5bb3c1adfc497ab0af09f887ff0023d6a5ff006cbff45257bb5784fc43ff0091eb52ff00b65ffa292b5a147dacb96f636c1e17eb3370bdb4b9cc514515d7fd9ffdefc3fe09e97f637f7ff0ff008215a9e1bff91a748ffafd87ff004315975a9e1bff0091a748ff00afd87ff43147f67ff7bf0ff821fd8dfdff00c3fe09f44d14515956c1fb3839f3186272cf6149d4e7bdbcbfe0915d7fc7a4dff5cdbf957335d35d7fc7a4dff5cdbf957335c479414514577d1f811f5d95ff00ba43e7f9b0a28a2b53bc2bd274cff904d9ff00d704ff00d04579b57a4e99ff00209b3ffae09ffa08a00b5451457cde3ffde25f2fc91c55be361451457219056ee9ff00f1e31fe3fccd6156ee9fff001e31fe3fccd0059a28a2beb721ff007697f89fe48e9a3f08514515ed9a8514514005145140051451401e27451457ce9e405145140051451401b507fc7bc7fee0fe55254707fc7bc7fee0fe5525734b767835bf892f5615e13f10ff00e47ad4bfed97fe8a4af76af09f887ff23d6a5ff6cbff00452575e03f88fd3fc8f4728fe3bf4fd51cc514515eb1f4615a9e1bff0091a748ff00afd87ff4315975a9e1bff91a748ffafd87ff00431401f44d14515cd8bfe0bfeba9c3997fbacbe5f9a22baff8f49bfeb9b7f2ae66ba6baff8f49bfeb9b7f2ae66bc53e5428a28aefa3f023ebb2bff007487cff361451456a77857a4e99ff209b3ff00ae09ff00a08af36af49d33fe41367ff5c13ff4114016a8a28af9bc7ffbc4be5f9238ab7c6c28a28ae4320addd3ff00e3c63fc7f99ac2addd3ffe3c63fc7f99a00b3451457d6e43feed2ff13fc91d347e10a28a2bdb350a28a2800a28a2800a28a2803c4e8a28af9d3c80a28a2800a28a28036a0ff8f78ffdc1fcaa4a8e0ff8f78ffdc1fcaa4ae696ecf06b7f125eac28a28a9330a28a2800a28a2800a28a28022baff8f49bfeb9b7f2ae66ba6baff8f49bfeb9b7f2ae66800a28a2bbe8fc08faecaffdd21f3fcd8514515a9de15e93a67fc826cffeb827fe822bcdabd274cff904d9ff00d704ff00d045005aa28a2be6f1ff00ef12f97e48e2adf1b0a28a2b90c82b774fff008f18ff001fe66b0ab774ff00f8f18ff1fe66802cd14515f5b90ffbb4bfc4ff002474d1f8428a28af6cd428a28a0028a28a0028a28a00f13a28a2be74f2028a28a0028a28a00da83fe3de3ff707f2a92b81b8ff008f997fdf3fcea3aef8653ed22a7cfbebb7fc131794fb47cfcfbebb7fc13d0a8af3da2abfb1bfbff87fc10fec6feffe1ff04f42a2bcf68a3fb1bfbff87fc10fec6feffe1ff04f42a2bcf6ac587fc846d7febb27f3147f637f7ff0ff00821fd8dfdffc3fe09dd51451586272cf6149d4e6bdbcbfe0986272cf6149d4e7bdbcbfe0915d7fc7a4dff5cdbf957335d35d7fc7a4dff5cdbf957335e51e50514515df47e047d7657fee90f9fe6c28a28ad4ef0af49d33fe41367ff5c13ff4115e6d5e93a67fc826cffeb827fe822802d514515f378fff007897cbf247156f8d8514515c86415bba7ffc78c7f8ff00335855bba7ff00c78c7f8ff33401668a28afadc87fdda5fe27f923a68fc21451457b66a145145001451450014514500789d14515f3a790145145001451450073f71ff1f32ffbe7f9d47525c7fc7ccbfef9fe751d7d3e1ff851f45f91e9d3f817a0514515a96145145001562c3fe4236bff005d93f98aaf562c3fe4236bff005d93f98a00eea8a28ae2ccbfdd65f2fcd1c3997fbacbe5f9a22baff8f49bfeb9b7f2ae66ba6baff8f49bfeb9b7f2ae66be54f950a28a2bbe8fc08faecaff00dd21f3fcd8514515a9de15e93a67fc826cff00eb827fe822bcdabd274cff00904d9ffd704ffd045005aa28a2be6f1ffef12f97e48e2adf1b0a28a2b90c82b774ff00f8f18ff1fe66b0ab774fff008f18ff001fe66802cd14515f5b90ff00bb4bfc4ff2474d1f8428a28af6cd428a28a0028a28a0028a28a00f13a28a2be74f2028a28a0028a28a00da83fe3de3ff00707f2a92a383fe3de3ff00707f2a92b9a5bb3c1adfc497ab0a28a2a4cc28a28a0028a28a0028a28a008aebfe3d26ff00ae6dfcab99ae9aebfe3d26ff00ae6dfcab99a0028a28aefa3f023ebb2bff007487cff361451456a77857a4e99ff209b3ff00ae09ff00a08af36af49d33fe41367ff5c13ff4114016a8a28af9bc7ffbc4be5f9238ab7c6c28a28ae4320addd3ff00e3c63fc7f99ac2addd3ffe3c63fc7f99a00b3451457d6e43feed2ff13fc91d347e10a28a2bdb350a28a2800a28a2800a28a2803c4e8a28af9d3c80a28a2800a28a28036a0ff8f78ffdc1fcaa4a8e0ff8f78ffdc1fcaa4ae696ecf06b7f125eac28a2bc27e21ffc8f5a97fdb2ff00d1495ad0a3ed65cb7b1b60f0bf599b85eda5cf76a2be62a2baff00b3ff00bdf87fc13d2fec6feffe1ff04fa768af98ab53c37ff234e91ff5fb0ffe8628fecffef7e1ff00043fb1bfbff87fc13e89a28a2b2ad83f67073e630c4e59ec293a9cf7b797fc122baff8f49bfeb9b7f2ae66ba6baff8f49bfeb9b7f2ae66b88f2828a28aefa3f023ebb2bff7487cff00361451456a77857a4e99ff00209b3ffae09ffa08af36a81bef1fad007ad515e494571d5cabdbcdd5e7b5fcbfe09c359fbecf5ba2aa695ff207b2ff00af78ff00f41156eb9eae4dece9ca7cfb26f6ff00826570addd3ffe3c63fc7f99ac2addd3ff00e3c63fc7f99af10659a28a2beb721ff7697f89fe48e9a3f08514515ed9a8514514005145140051451401e27451457ce9e405145140051451401b507fc7bc7fee0fe55254707fc7bc7fee0fe5525734b767835bf892f5615e13f10ffe47ad4bfed97fe8a4af76af09f887ff0023d6a5ff006cbff452575e03f88fd3fc8f4728fe3bf4fd51cc514515eb1f4615a9e1bff91a748ffafd87ff004315975a9e1bff0091a748ff00afd87ff431401f44d14515cd8bfe0bfeba9c3997fbacbe5f9a22baff008f49bfeb9b7f2ae66ba6baff008f49bfeb9b7f2ae66bc53e5428a28aefa3f023ebb2bff7487cff00361451456a778540df78fd6a7a81bef1fad002514515d74be047057fe233d434aff903d97fd7bc7ffa08ab75534aff00903d97fd7bc7ff00a08ab759e2ff00dde7e8ff002320addd3ffe3c63fc7f99ac2addd3ff00e3c63fc7f99af8928b3451457d6e43feed2ff13fc91d347e10a28a2bdb350a28a2800a28a2800a28a2803fffd9, 37.4219985, -122.0839999),
(81022, 'ab95c90f-2994-4633-9e73-7fccd5adeca8', 'test', '2024-03-13', '2024-03-13', 'test', 0xffd8ffe000104a46494600010100000100010000ffe10fe145786966000049492a00080000000a000f01020007000000aa0000001001020014000000b20000001201030001000000060000001a01050001000000860000001b010500010000008e0000002801030001000000020000003201020014000000960000001302030001000000010000006987040001000000c60000002588040001000000b8010000ae02000048000000010000004800000001000000323032343a30333a31332031343a33333a333100476f6f676c65000073646b5f6770686f6e6536345f7838365f36340010009a82050001000000940100009d820500010000009c0100002788030001000000640000000090070004000000303231300490020014000000a40100000191070004000000010203000992030001000000000000000a920500010000008c01000090920200020000003000000091920200020000003000000092920200020000003000000000a00700040000003031303001a0030001000000ffff000002a00400010000004001000003a0040001000000f000000003a4030001000000000000000000000088130000e80300008096980000ca9a3bf00a0000e8030000323032343a30333a31332031343a33333a333100090001000200020000004e00000002000500030000002a02000003000200020000004500000004000500030000004202000005000400010000000000000006000500010000005a0200000700050003000000620200001b00070028000000860200001d0002000b0000007a0200000000000000000000e803000000000000e803000000000000e803000000000000e803000000000000e803000000000000e803000000000000e8030000000000000100000000000000010000000000000001000000313937303a30313a3031000041534349490000004e6f6e650000000000000000000000000000000000000000000000000000000002000102040001000000cc02000002020400010000000d0d000000000000ffd8ffe000104a46494600010100000100010000ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc000110800f0014003012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f3ea29334035c4760b45145020cd19a4a4a007834b4d14668017346ea4cd2d3017ad26da70a5a008f6d1b69f4500445290254b45004463a8da2ab4290ad170b148c54c317b5686de2985053b819e62a6f978e9c7d2b40c74d316680b1472ebde9cb3b0ea0d5830d30c5ed40812e87735612e3dea9f93cd34c2474e28b01a8b383d6a459548eb58f9917a1cd396e1875145866c6e07a1a0565add63a9c5588eeb8eb480bb8a4db502ce0d48b229ef400edb498c53b23b1a6e6900869053b1498a062668a292810b9a2928cd0032938a4cd25318fa4cd22d2d20133452e051b681094a0d1462801dc519a6e296980ecd1cd36941a0070a5a4cd28a402668e29714845000053b14c14ea00439a4e69d9a01a004029702978a4c5000141a468a9c052e0d302031d279553d2d17029b4351986afe0534a8a2e16339e1a8fca23a56998f34df2a9dc4677ef17bd3d6675ea2adb45ed5198a80235baf5e2ac477231d6a16801a89adc83c51619a29329a941523ad6362543c1cfd69c27907514580d623d29bb6a84777ea7153a5d03df34ac04f8a4c522ce8d4f055ba1a00871453a8a402628a5cd14009406a5a4c5002d140a33400b4500d191400941cd38114b9a0060a5cd2d34e2801c1a973518c52d003c6297229828a603a802901c5286a402d18a01a70228001c519a2907b5002d21a539a6e6800c51416a40734c009a0353b03bd2605201720f51498069314a01029806c14d282949c501a802268f3519847a55b068201a2e0673c03d2a2680f6ad32a2a331d3b858cedb22f4269566917a8abfe4fa8a8de1f6a041fbe03aa9f6068579bba7ea2a4c1a4e690c679cdde36fca8fb4a8386183ef520cf7a5183400c13c67bd384a87a1a1915bef283f514d31c646360fc38a0078607a3528fad43e5263807f334821c7f1b50058c1a315088dc1e24e3e9411283c303f5a009a8e9516f9947407e868f35c0e63a0098126835109fd636fc8d02e233ed4012714a00a609233fc54e0cbd9850038528a6800f714a052017028db4983d8d202c280148a4e69d9f5a01f6a00051bb14a08a5c0340081e977034dd83b1a365002f068e9d29391403eb4c05c1ef467146734991400a0d2e69bc51400bc7ad000a674a5cf1400e3ed4629a0d2f34001a41c504d1c5002ee3498f5a28c500440d26ff006a502976fb500377519a5c7b53b03d28019ba9334f2b49b68010114b40414eda3d6801b4669db7de936fd28001cd1cd2ed229306800c5181eb499c500d0021452724027e9486343d463e9c53e8e28023f2d71c647d0d0108e8ed4fa77140112f983f8ff4a70794775229d494009e6483f841fa1a709980e50fe14019a770074a0068997192187e14ab3c47f8a8e0d2605003c3af6714e0c31c11517969d768fca9be5213d3f5a00b19cfa500541e57a123f1a3630070e73401395a4c5423cd1fc79fc280d30ebb3f3a0097a5254625933831e7dc1a71980eb1b7e1cd002d149e72632db947b8a413467a30a0078c51f8d20652386068c7a62801c07b5146d3499c5002e4f6a4c9a50d450032941cd3334038a603f14b4cdd4a0d021d8a01029b9a2818e3cd18a6834ecd0210f4a414a4d20a0075017d0d3734a1a8014ad260519c500e6800228da3bd3c6290e2801bb07bd26ca7d19a006053eb41534fa33c5004783da8c1a7d262900c39f4a00f5a70146298c4028e94a45029006ea4c9f5a09a406980bcfad039ef40a5148001f4a5dd49cd36801d9a4273d45028a006ec4ec8bf95279699c807f334f1f4141cfa530198e78771ed9a5cbff0c87f119a520fa5005200dd201d549fa628123ff12a7e7471de8e0d0020a08a5141a6212941a4a00a062e68cd18a4a0428a5a68f6a5ed40c5145345283400b8a00a5ed499c5002e28149ba933400ec9a4079a09e29319a043f8a4ce293149400f0dc526714828c5003fb514da33400fc52537268cd003b19a4c52034bbb9a00691c50ab4ecd2822801bb6957834e0452fa91400da28a41ef40015f4a4029d8a2801b452918a41d68003400697a528201e9400c1906972694fb51da80100cd1b6901a3340098a7018a169d8a004c714ddb4ea40680055a5c528a0d20182971450298c4c514b9a5a0432905481697681400c028a7f1471400c14a0528a5038a006e29450693340c7114d1473482801f46292819148418e68c514e07d6980dc5253c639a38a006814e140c52d0004520a5cd14000e94dc53a931400868ed4628c7140076a3b520a5a06252a8e79a31c1a51d314088a9c052629ca7140c00c53b349450021a4c52d14000e293341a00a00514869c05281eb4088c75a70a71028a060290d3a9280198a5c538507a5021a052d02971486211480669f4502100149b68ef4eed4c06e28c5380e28a063429a4da6a4a2801801c53b1c52f349cd021029a5db40e28cd0026da314eea28a00403149834ecd2839a00660d2638a7fb529031c500463a507a669dc52638c5002678a3269c071cd215a004c518a5a0d2180a2814a298098a00a7514009b69714b9a4cd0018a3a519a2801a79340e94f02940a008a96a42b4ddb400da5a50b4bb78a0068e94b42af145020145380e28c5031a07149d29c28c5002034a05277a7e462900d3494a0d2f5a60276a41ef4a69314085029a453866940a0068a18504734a280128c53a930714005252a834500348a514e238a1450003a5277a52bc5285e28022141a5a4a0628a3bd2528a042d2734a2971400de68c529a4c5218b40a31494c4381a5069a28a007e69334da00cd031d9a4cd1b4d18a042e69334b8a4db400034a4e68c518340094a3a52e38a40290c6f7a5c53b6d038a602628029d8a314084c503bd2914014806e31400734ec53b23140c61148052839a2980a052fb1a6d380cf5a0437d6814b8a5140001d452639a78e9499c1a00422802866c8a683400dc52814e028db400cc52629db6971400d14b4b8a3140084500528a5140c4c526da781450047b6971c53b345021a169eab480d381a005db4840a42d49ba801e00a3029bba9371a00711483ad21248a05031c690537068e94843a93340a4e94c07668ce69a29dda800e28a4c53874a00434dc538d02801156940a5068a06369c3a521a2810b8a6f4a5079a09a0033499a519a5c503128ed46d39a5c71408296a3cd26fa007d14dcd19a063a9293349cd003b8a01c5368a0076ea4cd36945020a514629c1680194a29c139a5db40119a00a711482818a0714a05369435021d482909a4a063cf4a4e29a4f14d14807e69a4d0052ed269808a69d4e44a704a044742d4a1714981400cef4629e16976d219181cd2e29fb706942d0222da69c17229f8c514011eda70514e22800d0000628db4e03d68e82801a45340e4d494d23bd0057c5262a4db498a602014a7a5145031b8a502968a004eb4a0518a280108a0528a314000a706a6d148052d46ea6d266980a6928cd140053b1c53453c1c0a042014a0519cd28340c4dbcd382814519a042e05038a6e68068024dd466994a05201d9e29bde9c314714002d2d203499c9a00752734a281d6800c645340e69f499a005031403cd206a3228014d2d30b526680149e68cd368a006e69a6969298c6d2814a2969005252134dcd310f14b4c5a534862e69375368a621c0d2134b8e29314009453d56976d0046053a9c052114008053b6d2034e0680100c519a5a6914862e68cd2014e02980829d8e29a053c5021334b4519a401494b4940c4a553450a2801c0d00f3494bb78a0404d20a705a0ad00007146283d2807140098c9a02d2d2ad00201eb4b8028cf34b8a00ffd9ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc000110800f0014003012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f3ea29334035c4760b45145020cd19a4a4a007834b4d14668017346ea4cd2d3017ad26da70a5a008f6d1b69f4500445290254b45004463a8da2ab4290ad170b148c54c317b5686de2985053b819e62a6f978e9c7d2b40c74d316680b1472ebde9cb3b0ea0d5830d30c5ed40812e87735612e3dea9f93cd34c2474e28b01a8b383d6a459548eb58f9917a1cd396e1875145866c6e07a1a0565add63a9c5588eeb8eb480bb8a4db502ce0d48b229ef400edb498c53b23b1a6e6900869053b1498a062668a292810b9a2928cd0032938a4cd25318fa4cd22d2d20133452e051b681094a0d1462801dc519a6e296980ecd1cd36941a0070a5a4cd28a402668e29714845000053b14c14ea00439a4e69d9a01a004029702978a4c5000141a468a9c052e0d302031d279553d2d17029b4351986afe0534a8a2e16339e1a8fca23a56998f34df2a9dc4677ef17bd3d6675ea2adb45ed5198a80235baf5e2ac477231d6a16801a89adc83c51619a29329a941523ad6362543c1cfd69c27907514580d623d29bb6a84777ea7153a5d03df34ac04f8a4c522ce8d4f055ba1a00871453a8a402628a5cd14009406a5a4c5002d140a33400b4500d191400941cd38114b9a0060a5cd2d34e2801c1a973518c52d003c6297229828a603a802901c5286a402d18a01a70228001c519a2907b5002d21a539a6e6800c51416a40734c009a0353b03bd2605201720f51498069314a01029806c14d282949c501a802268f3519847a55b068201a2e0673c03d2a2680f6ad32a2a331d3b858cedb22f4269566917a8abfe4fa8a8de1f6a041fbe03aa9f6068579bba7ea2a4c1a4e690c679cdde36fca8fb4a8386183ef520cf7a5183400c13c67bd384a87a1a1915bef283f514d31c646360fc38a0078607a3528fad43e5263807f334821c7f1b50058c1a315088dc1e24e3e9411283c303f5a009a8e9516f9947407e868f35c0e63a0098126835109fd636fc8d02e233ed4012714a00a609233fc54e0cbd9850038528a6800f714a052017028db4983d8d202c280148a4e69d9f5a01f6a00051bb14a08a5c0340081e977034dd83b1a365002f068e9d29391403eb4c05c1ef467146734991400a0d2e69bc51400bc7ad000a674a5cf1400e3ed4629a0d2f34001a41c504d1c5002ee3498f5a28c500440d26ff006a502976fb500377519a5c7b53b03d28019ba9334f2b49b68010114b40414eda3d6801b4669db7de936fd28001cd1cd2ed229306800c5181eb499c500d0021452724027e9486343d463e9c53e8e28023f2d71c647d0d0108e8ed4fa77140112f983f8ff4a70794775229d494009e6483f841fa1a709980e50fe14019a770074a0068997192187e14ab3c47f8a8e0d2605003c3af6714e0c31c11517969d768fca9be5213d3f5a00b19cfa500541e57a123f1a3630070e73401395a4c5423cd1fc79fc280d30ebb3f3a0097a5254625933831e7dc1a71980eb1b7e1cd002d149e72632db947b8a413467a30a0078c51f8d20652386068c7a62801c07b5146d3499c5002e4f6a4c9a50d450032941cd3334038a603f14b4cdd4a0d021d8a01029b9a2818e3cd18a6834ecd0210f4a414a4d20a0075017d0d3734a1a8014ad260519c500e6800228da3bd3c6290e2801bb07bd26ca7d19a006053eb41534fa33c5004783da8c1a7d262900c39f4a00f5a70146298c4028e94a45029006ea4c9f5a09a406980bcfad039ef40a5148001f4a5dd49cd36801d9a4273d45028a006ec4ec8bf95279699c807f334f1f4141cfa530198e78771ed9a5cbff0c87f119a520fa5005200dd201d549fa628123ff12a7e7471de8e0d0020a08a5141a6212941a4a00a062e68cd18a4a0428a5a68f6a5ed40c5145345283400b8a00a5ed499c5002e28149ba933400ec9a4079a09e29319a043f8a4ce293149400f0dc526714828c5003fb514da33400fc52537268cd003b19a4c52034bbb9a00691c50ab4ecd2822801bb6957834e0452fa91400da28a41ef40015f4a4029d8a2801b452918a41d68003400697a528201e9400c1906972694fb51da80100cd1b6901a3340098a7018a169d8a004c714ddb4ea40680055a5c528a0d20182971450298c4c514b9a5a0432905481697681400c028a7f1471400c14a0528a5038a006e29450693340c7114d1473482801f46292819148418e68c514e07d6980dc5253c639a38a006814e140c52d0004520a5cd14000e94dc53a931400868ed4628c7140076a3b520a5a06252a8e79a31c1a51d314088a9c052629ca7140c00c53b349450021a4c52d14000e293341a00a00514869c05281eb4088c75a70a71028a060290d3a9280198a5c538507a5021a052d02971486211480669f4502100149b68ef4eed4c06e28c5380e28a063429a4da6a4a2801801c53b1c52f349cd021029a5db40e28cd0026da314eea28a00403149834ecd2839a00660d2638a7fb529031c500463a507a669dc52638c5002678a3269c071cd215a004c518a5a0d2180a2814a298098a00a7514009b69714b9a4cd0018a3a519a2801a79340e94f02940a008a96a42b4ddb400da5a50b4bb78a0068e94b42af145020145380e28c5031a07149d29c28c5002034a05277a7e462900d3494a0d2f5a60276a41ef4a69314085029a453866940a0068a18504734a280128c53a930714005252a834500348a514e238a1450003a5277a52bc5285e28022141a5a4a0628a3bd2528a042d2734a2971400de68c529a4c5218b40a31494c4381a5069a28a007e69334da00cd031d9a4cd1b4d18a042e69334b8a4db400034a4e68c518340094a3a52e38a40290c6f7a5c53b6d038a602628029d8a314084c503bd2914014806e31400734ec53b23140c61148052839a2980a052fb1a6d380cf5a0437d6814b8a5140001d452639a78e9499c1a00422802866c8a683400dc52814e028db400cc52629db6971400d14b4b8a3140084500528a5140c4c526da781450047b6971c53b345021a169eab480d381a005db4840a42d49ba801e00a3029bba9371a00711483ad21248a05031c690537068e94843a93340a4e94c07668ce69a29dda800e28a4c53874a00434dc538d02801156940a5068a06369c3a521a2810b8a6f4a5079a09a0033499a519a5c503128ed46d39a5c71408296a3cd26fa007d14dcd19a063a9293349cd003b8a01c5368a0076ea4cd36945020a514629c1680194a29c139a5db40119a00a711482818a0714a05369435021d482909a4a063cf4a4e29a4f14d14807e69a4d0052ed269808a69d4e44a704a044742d4a1714981400cef4629e16976d219181cd2e29fb706942d0222da69c17229f8c514011eda70514e22800d0000628db4e03d68e82801a45340e4d494d23bd0057c5262a4db498a602014a7a5145031b8a502968a004eb4a0518a280108a0528a314000a706a6d148052d46ea6d266980a6928cd140053b1c53453c1c0a042014a0519cd28340c4dbcd382814519a042e05038a6e68068024dd466994a05201d9e29bde9c314714002d2d203499c9a00752734a281d6800c645340e69f499a005031403cd206a3228014d2d30b526680149e68cd368a006e69a6969298c6d2814a2969005252134dcd310f14b4c5a534862e69375368a621c0d2134b8e29314009453d56976d0046053a9c052114008053b6d2034e0680100c519a5a6914862e68cd2014e02980829d8e29a053c5021334b4519a401494b4940c4a553450a2801c0d00f3494bb78a0404d20a705a0ad00007146283d2807140098c9a02d2d2ad00201eb4b8028cf34b8a00ffd9, 37.4219985, -122.0839999);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `CGU` int NOT NULL,
  `token_session` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=480 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `CGU`, `token_session`) VALUES
(479, 'Moi', 'alexis', 'admin', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0NzksImV4cCI6MTcxMjY1MjUxOCwiY3VzdG9tX2RhdGEiOnsidGVzdCI6InRlc3QifX0.6cUzB-U0HdgDT638rSONHJr_i-qkoBawkCjynZSvZyU');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;