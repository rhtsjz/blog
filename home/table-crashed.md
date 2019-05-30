#### Pre:
我有一张表,表的创建语句:
```mysql
mysql> show create table user\G
*************************** 1. row ***************************
       Table: user
Create Table: CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC
```

#### 问题:
执行 select 语句:
```mysql
mysql> select * from user;
ERROR 1194 (HY000): Table 'user' is marked as crashed and should be repaired
```
执行 insert 语句一开始是正常的:
```mysql
mysql> insert into user(name) values('abi');
Query OK, 1 row affected (0.00 sec)
```

后来出现了下面的错误,同时 select 语句也变成了同样错误:
```mysql
mysql> insert into user(name) values('abh');
ERROR 144 (HY000): Table './fortest/user' is marked as crashed and last (automatic?) repair failed
```
执行 check 语句:
```mysql
mysql> check table user;
+--------------+-------+----------+------------------------------------------------------+
| Table        | Op    | Msg_type | Msg_text                                             |
+--------------+-------+----------+------------------------------------------------------+
| fortest.user | check | warning  | Size of datafile is: 2716073984       Should be: 120 |
| fortest.user | check | error    | Wrong bytesec: 29-227-227 at linkstart: 0            |
| fortest.user | check | error    | Corrupt                                              |
+--------------+-------+----------+------------------------------------------------------+
3 rows in set (0.01 sec)
```

执行 repair 语句:
```mysql
mysql> repair table user;
+--------------+--------+----------+----------------------------------------------------------------------------------+
| Table        | Op     | Msg_type | Msg_text                                                                         |
+--------------+--------+----------+----------------------------------------------------------------------------------+
| fortest.user | repair | info     | Wrong bytesec:  29-227-227 at 0; Skipped                                         |
| fortest.user | repair | info     | Wrong bytesec:  17-239-108 at 120; Skipped                                       |
| fortest.user | repair | info     | Found block with too small length at 3246452; Skipped                            |
| fortest.user | repair | info     | Found link that points at 6095204292730695756 (outside data file) at 15630348    |
| fortest.user | repair | info     | Found block with too small length at 19684036; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 37338196; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 48119644; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 49474856; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 56208688; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 59300460; Skipped                           |
| fortest.user | repair | info     | Found link that points at -776149602654384517 (outside data file) at 60466500    |
| fortest.user | repair | info     | Found link that points at 186477716701231356 (outside data file) at 69385048     |
| fortest.user | repair | info     | Found link that points at -9138934217593146852 (outside data file) at 78166732   |
| fortest.user | repair | info     | Found block with too small length at 93250988; Skipped                           |
| fortest.user | repair | info     | Found block with too small length at 104430892; Skipped                          |
| fortest.user | repair | info     | Found link that points at 978615501973411778 (outside data file) at 106478572    |
| fortest.user | repair | info     | Found link that points at -7236880699454053057 (outside data file) at 112489648  |
| fortest.user | repair | info     | Found link that points at -5230218432310328217 (outside data file) at 119195696  |
| fortest.user | repair | info     | Found link that points at -5147979486401759742 (outside data file) at 119725864  |
| fortest.user | repair | info     | Found block with too small length at 136589132; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6117319861048715702 (outside data file) at 145817012   |
| fortest.user | repair | info     | Found block with too small length at 146944392; Skipped                          |
| fortest.user | repair | info     | Found link that points at -3834409278897071384 (outside data file) at 152061140  |
| fortest.user | repair | info     | Found block with too small length at 161782224; Skipped                          |
| fortest.user | repair | info     | Found link that points at 4439205962805364819 (outside data file) at 163979228   |
| fortest.user | repair | info     | Found link that points at -1842481184798829158 (outside data file) at 166944472  |
| fortest.user | repair | info     | Found block with too small length at 171618336; Skipped                          |
| fortest.user | repair | info     | Found link that points at 8375263030488419610 (outside data file) at 172043856   |
| fortest.user | repair | info     | Found link that points at 440442690961290715 (outside data file) at 173267276    |
| fortest.user | repair | info     | Found block with too small length at 174563356; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 192294052; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 192816648; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 193932460; Skipped                          |
| fortest.user | repair | info     | Found link that points at -8697304286702021002 (outside data file) at 194421240  |
| fortest.user | repair | info     | Found link that points at -157796649029152029 (outside data file) at 201991872   |
| fortest.user | repair | info     | Found block with too small length at 205627764; Skipped                          |
| fortest.user | repair | info     | Found link that points at -8628023097380420296 (outside data file) at 209343912  |
| fortest.user | repair | info     | Found link that points at 6508276469030050521 (outside data file) at 219622532   |
| fortest.user | repair | info     | Found link that points at -5380938865116003505 (outside data file) at 223880500  |
| fortest.user | repair | info     | Found block with too small length at 226468232; Skipped                          |
| fortest.user | repair | info     | Found link that points at -7378401732991775506 (outside data file) at 247643056  |
| fortest.user | repair | info     | Found block with too small length at 275896272; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 276603032; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 294715612; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 296795764; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 300273040; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 331533164; Skipped                          |
| fortest.user | repair | info     | Found link that points at -4635560226513151749 (outside data file) at 339505348  |
| fortest.user | repair | info     | Found block with too small length at 346622348; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 360565656; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 362200896; Skipped                          |
| fortest.user | repair | info     | Found link that points at 2077269940316005423 (outside data file) at 368605408   |
| fortest.user | repair | info     | Found block with too small length at 377812800; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 391124384; Skipped                          |
| fortest.user | repair | info     | Found link that points at -1554213233835523599 (outside data file) at 400962656  |
| fortest.user | repair | info     | Found link that points at -3446800499701625012 (outside data file) at 404023624  |
| fortest.user | repair | info     | Found block with too small length at 421988744; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6521875601689741722 (outside data file) at 428023356   |
| fortest.user | repair | info     | Found block with too small length at 437088872; Skipped                          |
| fortest.user | repair | info     | Found link that points at -2026583606050464784 (outside data file) at 437460152  |
| fortest.user | repair | info     | Found block with too small length at 438094324; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 459041416; Skipped                          |
| fortest.user | repair | info     | Found link that points at 5338323786373509646 (outside data file) at 461944272   |
| fortest.user | repair | info     | Found block with too small length at 471775536; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 478037688; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 487528556; Skipped                          |
| fortest.user | repair | info     | Found link that points at -2606808702487503897 (outside data file) at 488172924  |
| fortest.user | repair | info     | Found link that points at -8393276595171753788 (outside data file) at 506621348  |
| fortest.user | repair | info     | Found link that points at -8311690079833553520 (outside data file) at 522419008  |
| fortest.user | repair | info     | Found block with too small length at 528880856; Skipped                          |
| fortest.user | repair | info     | Found link that points at -5836855350025776703 (outside data file) at 529231716  |
| fortest.user | repair | info     | Found link that points at 2759315581982960131 (outside data file) at 537558400   |
| fortest.user | repair | info     | Found link that points at 7558786515638509662 (outside data file) at 539146024   |
| fortest.user | repair | info     | Found block with too small length at 558940488; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 561258848; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 568829324; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6668253124722741503 (outside data file) at 584924224   |
| fortest.user | repair | info     | Found link that points at 6106976018351121860 (outside data file) at 591624960   |
| fortest.user | repair | info     | Found link that points at -5428928822890247981 (outside data file) at 601271116  |
| fortest.user | repair | info     | Found block with too small length at 607151556; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 618882332; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 621114288; Skipped                          |
| fortest.user | repair | info     | Found link that points at -5742146493469841531 (outside data file) at 635058392  |
| fortest.user | repair | info     | Found block with too small length at 635851756; Skipped                          |
| fortest.user | repair | info     | Found link that points at -5710818376181911122 (outside data file) at 640925184  |
| fortest.user | repair | info     | Found link that points at 6702238420752464396 (outside data file) at 646350364   |
| fortest.user | repair | info     | Found block with too small length at 656990596; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6417537869456813106 (outside data file) at 668593060   |
| fortest.user | repair | info     | Found block with too small length at 675620664; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 681869084; Skipped                          |
| fortest.user | repair | info     | Found link that points at 4524804591647929744 (outside data file) at 682185544   |
| fortest.user | repair | info     | Found link that points at 8421965932710698900 (outside data file) at 683737524   |
| fortest.user | repair | info     | Found block with too small length at 684875036; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 698700736; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 711836320; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 729830632; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6237910098948046241 (outside data file) at 734461792   |
| fortest.user | repair | info     | Found block with too small length at 742090416; Skipped                          |
| fortest.user | repair | info     | Found link that points at -1326628364968701012 (outside data file) at 762514764  |
| fortest.user | repair | info     | Found link that points at 5796636900936770686 (outside data file) at 765296320   |
| fortest.user | repair | info     | Found block with too small length at 765547712; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 773142688; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 788344348; Skipped                          |
| fortest.user | repair | info     | Found link that points at -8499257429967410343 (outside data file) at 797741392  |
| fortest.user | repair | info     | Found block with too small length at 799652716; Skipped                          |
| fortest.user | repair | info     | Found link that points at -6255651917011152840 (outside data file) at 803752944  |
| fortest.user | repair | info     | Found link that points at 5000271668586075747 (outside data file) at 807701356   |
| fortest.user | repair | info     | Found block with too small length at 824973756; Skipped                          |
| fortest.user | repair | info     | Found link that points at 6699612756473737192 (outside data file) at 827464176   |
| fortest.user | repair | info     | Found block with too small length at 864640116; Skipped                          |
| fortest.user | repair | info     | Found link that points at 5539104394693458241 (outside data file) at 875893208   |
| fortest.user | repair | info     | Found block with too small length at 882996116; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 890125084; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 904251008; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 910275316; Skipped                          |
| fortest.user | repair | info     | Found link that points at -8891624245964397350 (outside data file) at 912738196  |
| fortest.user | repair | info     | Found link that points at -6303489464710462338 (outside data file) at 920300976  |
| fortest.user | repair | info     | Found block with too small length at 921515284; Skipped                          |
| fortest.user | repair | info     | Found link that points at 5788364883079656943 (outside data file) at 929006236   |
| fortest.user | repair | info     | Found link that points at 2539681516311235395 (outside data file) at 936617620   |
| fortest.user | repair | info     | Found block with too small length at 939478872; Skipped                          |
| fortest.user | repair | info     | Found link that points at 1822426594869164740 (outside data file) at 940584572   |
| fortest.user | repair | info     | Found block with too small length at 949780936; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 953090800; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 971175004; Skipped                          |
| fortest.user | repair | info     | Found link that points at -4987009742777083999 (outside data file) at 997108108  |
| fortest.user | repair | info     | Found block with too small length at 998051508; Skipped                          |
| fortest.user | repair | info     | Found block with too small length at 1008578856; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1010013416; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1015513788; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1051455944; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1053844140; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1060403004; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1066164888; Skipped                         |
| fortest.user | repair | info     | Found link that points at -1483336740468648573 (outside data file) at 1079989744 |
| fortest.user | repair | info     | Found block with too small length at 1098508328; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1104576400; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1109166560; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1120152200; Skipped                         |
| fortest.user | repair | info     | Found link that points at 7536652486056205845 (outside data file) at 1122357660  |
| fortest.user | repair | info     | Found block with too small length at 1127653812; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8268440860667203187 (outside data file) at 1128931944  |
| fortest.user | repair | info     | Found link that points at -4078734627271558340 (outside data file) at 1130678548 |
| fortest.user | repair | info     | Found block with too small length at 1134515144; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1136172924; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1138548900; Skipped                         |
| fortest.user | repair | info     | Found link that points at -6348482143792093417 (outside data file) at 1176252312 |
| fortest.user | repair | info     | Found block with too small length at 1182855900; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1183916012; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1188427044; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1203097428; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1216130612; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1223044176; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1236328004; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1244164476; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1250609428; Skipped                         |
| fortest.user | repair | info     | Found link that points at 4635643759147072240 (outside data file) at 1276148020  |
| fortest.user | repair | info     | Found block with too small length at 1283366444; Skipped                         |
| fortest.user | repair | info     | Found link that points at -6020927873062451111 (outside data file) at 1284824916 |
| fortest.user | repair | info     | Found link that points at -5323816468941808737 (outside data file) at 1287163012 |
| fortest.user | repair | info     | Found link that points at 3770816959446492556 (outside data file) at 1287808720  |
| fortest.user | repair | info     | Found link that points at 8750796667688417383 (outside data file) at 1295159180  |
| fortest.user | repair | info     | Found block with too small length at 1299776016; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1315068020; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1315137644; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1318747600; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1328879280; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1329241072; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1341558808; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8091293964412076746 (outside data file) at 1344992996  |
| fortest.user | repair | info     | Found link that points at 4791628156332294930 (outside data file) at 1353605684  |
| fortest.user | repair | info     | Found link that points at -2934407981676210246 (outside data file) at 1355992824 |
| fortest.user | repair | info     | Found link that points at -1986736778285176504 (outside data file) at 1358650256 |
| fortest.user | repair | info     | Found link that points at 8012318778133737235 (outside data file) at 1363525900  |
| fortest.user | repair | info     | Found block with too small length at 1369015536; Skipped                         |
| fortest.user | repair | info     | Found link that points at 4702367405222953542 (outside data file) at 1370376136  |
| fortest.user | repair | info     | Found block with too small length at 1380237180; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1395390368; Skipped                         |
| fortest.user | repair | info     | Found link that points at 9074325984493803858 (outside data file) at 1411249948  |
| fortest.user | repair | info     | Found block with too small length at 1426151704; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8495718012507000491 (outside data file) at 1430343252 |
| fortest.user | repair | info     | Found link that points at 2970864684071034079 (outside data file) at 1440505924  |
| fortest.user | repair | info     | Found block with too small length at 1445322204; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1445547576; Skipped                         |
| fortest.user | repair | info     | Found link that points at -5757417667161728437 (outside data file) at 1450688588 |
| fortest.user | repair | info     | Found link that points at -7002119707315690970 (outside data file) at 1454394940 |
| fortest.user | repair | info     | Found link that points at 1408824018726903833 (outside data file) at 1459265148  |
| fortest.user | repair | info     | Found block with too small length at 1466483024; Skipped                         |
| fortest.user | repair | info     | Found link that points at -2975892649111669127 (outside data file) at 1466762292 |
| fortest.user | repair | info     | Found link that points at 4801230439338276904 (outside data file) at 1467699920  |
| fortest.user | repair | info     | Found block with too small length at 1472642576; Skipped                         |
| fortest.user | repair | info     | Found link that points at 7141362292406179530 (outside data file) at 1475691680  |
| fortest.user | repair | info     | Found link that points at 6264163710086773706 (outside data file) at 1482597384  |
| fortest.user | repair | info     | Found block with too small length at 1493110540; Skipped                         |
| fortest.user | repair | info     | Found link that points at -1026609050473097666 (outside data file) at 1505189048 |
| fortest.user | repair | info     | Found block with too small length at 1522748016; Skipped                         |
| fortest.user | repair | info     | Found link that points at 1744827353625480627 (outside data file) at 1523347516  |
| fortest.user | repair | info     | Found link that points at 8709683703900652391 (outside data file) at 1527209024  |
| fortest.user | repair | info     | Found link that points at 3534568093350588945 (outside data file) at 1538080920  |
| fortest.user | repair | info     | Found link that points at -6470441478694096127 (outside data file) at 1545454008 |
| fortest.user | repair | info     | Found block with too small length at 1548741604; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1574358480; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1576147284; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8687308402565209864 (outside data file) at 1584623416 |
| fortest.user | repair | info     | Found block with too small length at 1586144528; Skipped                         |
| fortest.user | repair | info     | Found link that points at -7380970617419796328 (outside data file) at 1591233484 |
| fortest.user | repair | info     | Found block with too small length at 1599341932; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1604547532; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1611357444; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1611731736; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1612543920; Skipped                         |
| fortest.user | repair | info     | Found link that points at 5603511130262387328 (outside data file) at 1614053304  |
| fortest.user | repair | info     | Found link that points at -9158686477800863892 (outside data file) at 1626498080 |
| fortest.user | repair | info     | Found link that points at -1338556142530223048 (outside data file) at 1631433224 |
| fortest.user | repair | info     | Found block with too small length at 1639496592; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1648589420; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1685067932; Skipped                         |
| fortest.user | repair | info     | Found link that points at 5052131221730757608 (outside data file) at 1700940124  |
| fortest.user | repair | info     | Found block with too small length at 1725424776; Skipped                         |
| fortest.user | repair | info     | Found link that points at 2883723253876836268 (outside data file) at 1727573012  |
| fortest.user | repair | info     | Found block with too small length at 1740407472; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1743061376; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1744247780; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1751692536; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1753214648; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1770030616; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1773203868; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1787310376; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8043644854539908500 (outside data file) at 1792072436  |
| fortest.user | repair | info     | Found link that points at -73468554453739013 (outside data file) at 1796906472   |
| fortest.user | repair | info     | Found block with too small length at 1802163480; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8450951462625057975 (outside data file) at 1802672472 |
| fortest.user | repair | info     | Found link that points at -7346418297641600052 (outside data file) at 1810227496 |
| fortest.user | repair | info     | Found block with too small length at 1823991988; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1824498228; Skipped                         |
| fortest.user | repair | info     | Found link that points at 6960800591970454513 (outside data file) at 1830290508  |
| fortest.user | repair | info     | Found block with too small length at 1838724044; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1856100660; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1858352188; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1870187660; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8615776604495172041 (outside data file) at 1871210664 |
| fortest.user | repair | info     | Found link that points at 3831199712800486404 (outside data file) at 1876575464  |
| fortest.user | repair | info     | Found block with too small length at 1886747916; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1890325620; Skipped                         |
| fortest.user | repair | info     | Found link that points at -5440325078884374400 (outside data file) at 1893515996 |
| fortest.user | repair | info     | Found block with too small length at 1904223772; Skipped                         |
| fortest.user | repair | info     | Found link that points at 6085840214443205253 (outside data file) at 1905646328  |
| fortest.user | repair | info     | Found link that points at 228652912283366511 (outside data file) at 1922899288   |
| fortest.user | repair | info     | Found block with too small length at 1923843216; Skipped                         |
| fortest.user | repair | info     | Found link that points at 3576305815155194803 (outside data file) at 1935372676  |
| fortest.user | repair | info     | Found block with too small length at 1944407416; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1950983740; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1958434012; Skipped                         |
| fortest.user | repair | info     | Found link that points at 968961661092489207 (outside data file) at 1964037752   |
| fortest.user | repair | info     | Found link that points at -4128168016197374023 (outside data file) at 1976988660 |
| fortest.user | repair | info     | Found block with too small length at 1981580044; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 1986533356; Skipped                         |
| fortest.user | repair | info     | Found link that points at -4924601701242861753 (outside data file) at 1989986364 |
| fortest.user | repair | info     | Found link that points at 3982278435743392342 (outside data file) at 1990586832  |
| fortest.user | repair | info     | Found block with too small length at 1996846456; Skipped                         |
| fortest.user | repair | info     | Found link that points at -457951071570226804 (outside data file) at 1997401844  |
| fortest.user | repair | info     | Found block with too small length at 2000194036; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2013711260; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2021062568; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2022353356; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2028558228; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2045921484; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2049818232; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2062484932; Skipped                         |
| fortest.user | repair | info     | Found link that points at 1431017065678414659 (outside data file) at 2064910728  |
| fortest.user | repair | info     | Found link that points at 7909605412202990362 (outside data file) at 2074143464  |
| fortest.user | repair | info     | Found link that points at 4826656128247501584 (outside data file) at 2074643376  |
| fortest.user | repair | info     | Found block with too small length at 2088087864; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2098626040; Skipped                         |
| fortest.user | repair | info     | Found link that points at 4806134188483893342 (outside data file) at 2114049660  |
| fortest.user | repair | info     | Found block with too small length at 2121036696; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2123827484; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2124187676; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8735433367279521381 (outside data file) at 2127106408  |
| fortest.user | repair | info     | Found block with too small length at 2136303136; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2147220640; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2147489484; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2151047264; Skipped                         |
| fortest.user | repair | info     | Found link that points at 5029674776070774003 (outside data file) at 2151100392  |
| fortest.user | repair | info     | Found link that points at 3675714490087301035 (outside data file) at 2164591076  |
| fortest.user | repair | info     | Found block with too small length at 2168318596; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2188051188; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2199358532; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2202805408; Skipped                         |
| fortest.user | repair | info     | Found link that points at -4292005562898451759 (outside data file) at 2204157288 |
| fortest.user | repair | info     | Found block with too small length at 2205365316; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2214382820; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2218736108; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2219886400; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2223834368; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2238925912; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2242294364; Skipped                         |
| fortest.user | repair | info     | Found link that points at 909662801793696564 (outside data file) at 2247354628   |
| fortest.user | repair | info     | Found block with too small length at 2253489612; Skipped                         |
| fortest.user | repair | info     | Found link that points at 3120718565393475202 (outside data file) at 2267079796  |
| fortest.user | repair | info     | Found link that points at -5506622203807998911 (outside data file) at 2281117968 |
| fortest.user | repair | info     | Found block with too small length at 2288606944; Skipped                         |
| fortest.user | repair | info     | Found link that points at -4899050282282903319 (outside data file) at 2298331768 |
| fortest.user | repair | info     | Found link that points at 5761748178983107675 (outside data file) at 2302939948  |
| fortest.user | repair | info     | Found block with too small length at 2310999928; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2314805080; Skipped                         |
| fortest.user | repair | info     | Found link that points at -5933958072200354290 (outside data file) at 2315725672 |
| fortest.user | repair | info     | Found link that points at -8003646845966442526 (outside data file) at 2319554616 |
| fortest.user | repair | info     | Found block with too small length at 2321198636; Skipped                         |
| fortest.user | repair | info     | Found link that points at 6577576580823791762 (outside data file) at 2328722332  |
| fortest.user | repair | info     | Found link that points at -7647664254554921020 (outside data file) at 2331631608 |
| fortest.user | repair | info     | Found block with too small length at 2333084748; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2334703512; Skipped                         |
| fortest.user | repair | info     | Found link that points at 7347888785635195569 (outside data file) at 2340812836  |
| fortest.user | repair | info     | Found block with too small length at 2359864248; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2369726712; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2372884760; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2374792100; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2380557220; Skipped                         |
| fortest.user | repair | info     | Found link that points at -6851841897421035171 (outside data file) at 2391498788 |
| fortest.user | repair | info     | Found block with too small length at 2398854004; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2401960756; Skipped                         |
| fortest.user | repair | info     | Found link that points at 7852446980063122181 (outside data file) at 2406546052  |
| fortest.user | repair | info     | Found block with too small length at 2411041648; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2421634464; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2425873960; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2437874044; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2452506884; Skipped                         |
| fortest.user | repair | info     | Found link that points at 9147062793425474184 (outside data file) at 2453798788  |
| fortest.user | repair | info     | Found block with too small length at 2479632244; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2480668100; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8044481586208066495 (outside data file) at 2481510228 |
| fortest.user | repair | info     | Found block with too small length at 2482904304; Skipped                         |
| fortest.user | repair | info     | Found link that points at -7019678753865532927 (outside data file) at 2486418432 |
| fortest.user | repair | info     | Found block with too small length at 2508614296; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8132546985471390389 (outside data file) at 2515854764  |
| fortest.user | repair | info     | Found block with too small length at 2524680968; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2538708432; Skipped                         |
| fortest.user | repair | info     | Found link that points at -8269559451881048137 (outside data file) at 2538771280 |
| fortest.user | repair | info     | Found link that points at -7149109216627008505 (outside data file) at 2542249536 |
| fortest.user | repair | info     | Found link that points at 60567610592733027 (outside data file) at 2543928572    |
| fortest.user | repair | info     | Found link that points at -7603041429449621979 (outside data file) at 2563466864 |
| fortest.user | repair | info     | Found block with too small length at 2567108876; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8391700812692280023 (outside data file) at 2577835820  |
| fortest.user | repair | info     | Found block with too small length at 2590773060; Skipped                         |
| fortest.user | repair | info     | Found link that points at 8611521788338537819 (outside data file) at 2595043232  |
| fortest.user | repair | info     | Found link that points at 7802596098604385771 (outside data file) at 2596608228  |
| fortest.user | repair | info     | Found link that points at 2874132904415102470 (outside data file) at 2604196116  |
| fortest.user | repair | info     | Found block with too small length at 2628269200; Skipped                         |
| fortest.user | repair | info     | Found link that points at 3885753306837157964 (outside data file) at 2630761616  |
| fortest.user | repair | info     | Found link that points at 3436381105620234858 (outside data file) at 2634093692  |
| fortest.user | repair | info     | Found block with too small length at 2634385988; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2635719540; Skipped                         |
| fortest.user | repair | info     | Found link that points at 3626334033911984272 (outside data file) at 2636762708  |
| fortest.user | repair | info     | Found block with too small length at 2637221576; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2641474640; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2643329816; Skipped                         |
| fortest.user | repair | info     | Found link that points at 7313726347008710244 (outside data file) at 2649418684  |
| fortest.user | repair | info     | Found link that points at -8615733773133464519 (outside data file) at 2657000268 |
| fortest.user | repair | info     | Found block with too small length at 2662626084; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2664884908; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2665902072; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2670592452; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2674005088; Skipped                         |
| fortest.user | repair | info     | Found link that points at 149821876922788709 (outside data file) at 2683748000   |
| fortest.user | repair | info     | Found link that points at -325747235733532530 (outside data file) at 2687509748  |
| fortest.user | repair | info     | Found link that points at -578501962702993998 (outside data file) at 2694024672  |
| fortest.user | repair | info     | Found link that points at -3615891217389066271 (outside data file) at 2696754628 |
| fortest.user | repair | info     | Found link that points at 8820265396722207775 (outside data file) at 2700980096  |
| fortest.user | repair | info     | Found block with too small length at 2703739756; Skipped                         |
| fortest.user | repair | info     | Found block with too small length at 2714512080; Skipped                         |
| fortest.user | repair | warning  | Number of rows changed from 6 to 2                                               |
| fortest.user | repair | status   | OK                                                                               |
+--------------+--------+----------+----------------------------------------------------------------------------------+
373 rows in set (24.50 sec)
```

再次执行 check 语句:
```mysql
mysql> check table user;
+--------------+-------+----------+----------+
| Table        | Op    | Msg_type | Msg_text |
+--------------+-------+----------+----------+
| fortest.user | check | status   | OK       |
+--------------+-------+----------+----------+
1 row in set (0.00 sec)
```

再次执行 select 语句,部分数据丢失, id 小于 5 的数据全都丢失了:
```mysql
mysql> select * from user;
+----+------+---------------------+
| id | name | create_time         |
+----+------+---------------------+
|  5 | abg  | 2015-08-07 16:25:07 |
|  6 | abh  | 2015-08-07 16:25:20 |
+----+------+---------------------+
2 rows in set (0.00 sec)
```
#### 在实际遇到这个问题的时候首先报的错是 duplicate primaryKey 但是实际上这个主键是自增的,并且在插入时并没有指定主键id的值也就是说,当表 crashed 时会出现不同的表现.

参考资料:

1.[What could cause duplicate ids on a auto increment primary key field (mysql)?](http://stackoverflow.com/questions/514018/what-could-cause-duplicate-ids-on-a-auto-increment-primary-key-field-mysql)

2.[where does MySQL store database files?](http://stackoverflow.com/questions/2091350/where-does-mysql-store-database-files)

3.[Corrupted MyISAM Tables](https://dev.mysql.com/doc/refman/5.0/en/corrupted-myisam-tables.html)
