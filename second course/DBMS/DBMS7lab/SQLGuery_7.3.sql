{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE dbo.test_table\
(\
id INT IDENTITY(1,1) NOT NULL,\
manager VARCHAR(50) NULL,\
otdel VARCHAR(50) NULL,\
god INT NULL,\
summa MONEY NULL\
)\
\
INSERT INTO test_table( manager, otdel, god, summa) VALUES ( 'Emloyee_6', 'Sales departament', 2014, 150), ( 'Emloyee_7', 'Sales departament', 2014, 300), ( 'Emloyee_1', 'Accounting', 2015, 230), ( 'Emloyee_2', 'Accounting', 2015, 200), ( 'Emloyee_3', 'Shopping departament', 2015, 200), ( 'Emloyee_4', 'Shopping departament', 2015, 300), ( 'Emloyee_5', 'Sales departament', 2015, 200), ( 'Emloyee_6', 'Shopping departament', 2015, 250), ( 'Emloyee_7', 'Shopping departament', 2015, 350)\
\
--3.1 \uc0\u1055 \u1086 \u1083 \u1091 \u1095 \u1080 \u1090 \u1100  \u1089 \u1091 \u1084 \u1084 \u1091  \u1088 \u1072 \u1089 \u1093 \u1086 \u1076 \u1072  \u1085 \u1072  \u1086 \u1087 \u1083 \u1072 \u1090 \u1091  \u1090 \u1088 \u1091 \u1076 \u1072  \u1087 \u1086  \u1086 \u1090 \u1076 \u1077 \u1083 \u1072 \u1084  \u1080  \u1087 \u1086  \u1075 \u1086 \u1076 \u1072 \u1084 , \u1080  \u1089 \u1085 \u1072 \u1095 \u1072 \u1083 \u1072 \
--\uc0\u1076 \u1072 \u1074 \u1072 \u1081 \u1090 \u1077  \u1087 \u1086 \u1087 \u1088 \u1086 \u1073 \u1091 \u1077 \u1084  \u1085 \u1072 \u1087 \u1080 \u1089 \u1072 \u1090 \u1100  \u1079 \u1072 \u1087 \u1088 \u1086 \u1089  \u1089  \u1075 \u1088 \u1091 \u1087 \u1087 \u1080 \u1088 \u1086 \u1074 \u1082 \u1086 \u1081  \u1073 \u1077 \u1079  \u1080 \u1089 \u1087 \u1086 \u1083 \u1100 \u1079 \u1086 \u1074 \u1072 \u1085 \u1080 \u1103  \u1086 \u1087 \u1077 \u1088 \u1072 \u1090 \u1086 \u1088 \u1072 \
--ROLLUP.\
\
SELECT otdel, god, SUM(summa) AS itog\
FROM dbo.test_table\
GROUP BY otdel, god\
ORDER BY otdel, god\
\
--3.2 \uc0\u1086 \u1073 \u1097 \u1080 \u1081  \u1088 \u1072 \u1089 \u1093 \u1086 \u1076  \u1087 \u1086  \u1082 \u1072 \u1078 \u1076 \u1086 \u1084 \u1091  \u1086 \u1090 \u1076 \u1077 \u1083 \u1091 . \u1044 \u1083 \u1103  \u1101 \u1090 \u1080 \u1093  \u1094 \u1077 \u1083 \u1077 \u1081  \u1084 \u1099  \u1084 \u1086 \u1078 \u1077 \u1084  \u1080 \u1089 \u1087 \u1086 \u1083 \u1100 \u1079 \u1086 \u1074 \u1072 \u1090 \u1100 \
--\uc0\u1086 \u1087 \u1077 \u1088 \u1072 \u1090 \u1086 \u1088  ROLLUP.\
\
SELECT otdel, god, SUM(summa) AS itog\
FROM test_table\
GROUP BY ROLLUP (otdel, god)\
\
--3.3. \uc0\u1048 \u1089 \u1087 \u1086 \u1083 \u1100 \u1079 \u1086 \u1074 \u1072 \u1090 \u1100  rollup \u1080  \u1089  \u1075 \u1088 \u1091 \u1087 \u1087 \u1080 \u1088 \u1086 \u1074 \u1082 \u1086 \u1081  \u1087 \u1086  \u1086 \u1076 \u1085 \u1086 \u1084 \u1091  \u1087 \u1086 \u1083 \u1102 , \u1085 \u1072 \u1087 \u1088 \u1080 \u1084 \u1077 \u1088 :\
--\uc0\u1043 \u1088 \u1091 \u1087 \u1087 \u1080 \u1088 \u1086 \u1074 \u1082 \u1072  \u1087 \u1086  \u1086 \u1090 \u1076 \u1077 \u1083 \u1072 \u1084  \u1089  \u1086 \u1073 \u1097 \u1080 \u1084  \u1080 \u1090 \u1086 \u1075 \u1086 \u1084 \
\
SELECT otdel,  SUM(summa) AS Total\
FROM dbo.test_table\
GROUP BY ROLLUP(otdel)\
\
\
-- \uc0\u1043 \u1088 \u1091 \u1087 \u1087 \u1080 \u1088 \u1086 \u1074 \u1082 \u1072  \u1087 \u1086  \u1075 \u1086 \u1076 \u1072 \u1084  \u1089  \u1086 \u1073 \u1097 \u1080 \u1084  \u1080 \u1090 \u1086 \u1075 \u1086 \u1084 \
SELECT god,  SUM(summa) AS Total\
FROM dbo.test_table\
GROUP BY ROLLUP(god)\
\
--4.1. \uc0\u1053 \u1072 \u1087 \u1080 \u1096 \u1077 \u1084  \u1087 \u1088 \u1072 \u1082 \u1090 \u1080 \u1095 \u1077 \u1089 \u1082 \u1080  \u1090 \u1072 \u1082 \u1086 \u1081  \u1078 \u1077  SQL \u1079 \u1072 \u1087 \u1088 \u1086 \u1089  \u1082 \u1072 \u1082  \u1074  3.2, \u1090 \u1086 \u1083 \u1100 \u1082 \u1086  \u1074 \u1084 \u1077 \u1089 \u1090 \u1086  rollup \u1091 \u1082 \u1072 \u1078 \u1077 \u1084 \
--cube \uc0\u1080  \u1087 \u1086 \u1089 \u1084 \u1086 \u1090 \u1088 \u1080 \u1084  \u1085 \u1072  \u1087 \u1086 \u1083 \u1091 \u1095 \u1077 \u1085 \u1085 \u1099 \u1081  \u1088 \u1077 \u1079 \u1091 \u1083 \u1100 \u1090 \u1072 \u1090 \
SELECT otdel, god, SUM(summa) AS itog\
FROM test_table\
GROUP BY CUBE (otdel, god)\
\
--GROUPING SETS \'96 \uc0\u1086 \u1087 \u1077 \u1088 \u1072 \u1090 \u1086 \u1088  Transact-SQL, \u1082 \u1086 \u1090 \u1086 \u1088 \u1099 \u1081  \u1092 \u1086 \u1088 \u1084 \u1080 \u1088 \u1091 \u1077 \u1090  \u1088 \u1077 \u1079 \u1091 \u1083 \u1100 \u1090 \u1072 \u1090 \u1099 \
--\uc0\u1085 \u1077 \u1089 \u1082 \u1086 \u1083 \u1100 \u1082 \u1080 \u1093  \u1075 \u1088 \u1091 \u1087 \u1087 \u1080 \u1088 \u1086 \u1074 \u1086 \u1082  \u1074  \u1086 \u1076 \u1080 \u1085  \u1085 \u1072 \u1073 \u1086 \u1088  \u1076 \u1072 \u1085 \u1085 \u1099 \u1093 \
SELECT otdel, god, SUM(summa) AS itog\
FROM test_table\
GROUP BY \
GROUPING SETS(otdel, god)\
\
--6. GROUPING \'96 \uc0\u1092 \u1091 \u1085 \u1082 \u1094 \u1080 \u1103  Transact-SQL, \u1082 \u1086 \u1090 \u1086 \u1088 \u1072 \u1103  \u1074 \u1086 \u1079 \u1074 \u1088 \u1072 \u1097 \u1072 \u1077 \u1090  \u1080 \u1089 \u1090 \u1080 \u1085 \u1091 , \u1077 \u1089 \u1083 \u1080  \u1091 \u1082 \u1072 \u1079 \u1072 \u1085 \u1085 \u1086 \u1077 \
--\uc0\u1074 \u1099 \u1088 \u1072 \u1078 \u1077 \u1085 \u1080 \u1077  \u1103 \u1074 \u1083 \u1103 \u1077 \u1090 \u1089 \u1103  \u1089 \u1090 \u1072 \u1090 \u1080 \u1089 \u1090 \u1080 \u1095 \u1077 \u1089 \u1082 \u1080 \u1084 , \u1080  \u1083 \u1086 \u1078 \u1100 , \u1077 \u1089 \u1083 \u1080  \u1074 \u1099 \u1088 \u1072 \u1078 \u1077 \u1085 \u1080 \u1077  \u1085 \u1077 \u1089 \u1090 \u1072 \u1090 \u1080 \u1089 \u1090 \u1080 \u1095 \u1077 \u1089 \u1082 \u1086 \u1077 .\
\
SELECT otdel,\
ISNULL (CAST(god AS VARCHAR(30)),\
    CASE WHEN GROUPING(god)=1 AND GROUPING(otdel)= 0\
        THEN 'Subtotal' ELSE 'Total' END) AS god,\
    \
    SUM(summa) as total,\
    GROUPING(otdel) AS grouping_otdel,\
    GROUPING(god) AS grouping_god\
    \
FROM test_table\
GROUP BY \
ROLLUP(otdel, god)}