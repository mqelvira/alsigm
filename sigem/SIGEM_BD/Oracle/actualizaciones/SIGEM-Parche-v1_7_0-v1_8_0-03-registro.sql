ALTER TABLE a1sf ADD fld20 date;
ALTER TABLE a2sf ADD fld15 date;

UPDATE IDOCARCHDET SET DETVAL = '"01.00"|20|1,"N�mero de registro",1,20,1,"Fld1",0,0,""|2,"Fecha de registro",9,0,1,"Fld2",0,0,""|3,"Usuario",1,32,1,"Fld3",0,0,""|4,"Fecha de trabajo",7,0,1,"Fld4",0,0,""|5,"Oficina de registro",4,0,1,"Fld5",0,0,""|6,"Estado",4,0,1,"Fld6",0,0,""|7,"Origen",4,0,1,"Fld7",0,0,""|8,"Destino",4,0,1,"Fld8",0,0,""|9,"Remitentes",1,80,1,"Fld9",0,0,""|10,"N�. registro original",1,20,1,"Fld10",0,0,""|11,"Tipo de registro original",4,0,1,"Fld11",0,0,""|12,"Fecha de registro original",7,0,1,"Fld12",0,0,""|13,"Registro original",4,0,1,"Fld13",0,0,""|14,"Tipo de transporte",1,31,1,"Fld14",0,0,""|15,"N�mero de transporte",1,30,1,"Fld15",0,0,""|16,"Tipo de asunto",4,0,1,"Fld16",0,0,""|17,"Resumen",1,240,1,"Fld17",0,0,""|18,"Comentario",2,65535,1,"Fld18",0,0,""|19,"Referencia de Expediente",1,50,1,"Fld19",0,0,""|20,"Fecha del documento",7,0,1,"Fld20",0,0,""|8|1,"EREG1",1,1,1|2,"EREG2",0,1,2|3,"EREG3",0,1,4|4,"EREG4",0,1,6|5,"EREG5",0,1,7|6,"EREG6",0,1,8|7,"EREG7",0,1,9|8,"EREG8",0,1,5' 
WHERE ARCHID = 1 AND DETTYPE = 1;

UPDATE IDOCARCHDET SET DETVAL = '"01.00"|2147483646|0|11|2|2,9,"-",":"," ",1,1|0,2147483646|4|2,7,"-","","",1,0|0,2147483646|5|1,4,".","",0|0,2147483646|6|1,4,".","",0|0,2147483646|7|1,4,".","",0|0,2147483646|8|1,4,".","",0|0,2147483646|11|1,4,".","",0|0,2147483646|12|2,7,"-","","",1,0|0,2147483646|13|1,4,".","",0|0,2147483646|16|1,4,".","",0|0,2147483646|20|2,7,"-","","",1,0|0,2147483646' 
WHERE ARCHID = 1 AND DETTYPE = 5;

UPDATE IDOCARCHDET SET DETVAL = '"01.00"|15|1,"N�mero de registro",1,20,1,"Fld1",0,0,""|2,"Fecha de registro",9,0,1,"Fld2",0,0,""|3,"Usuario",1,32,1,"Fld3",0,0,""|4,"Fecha de trabajo",7,0,0,"Fld4",0,0,""|5,"Oficina de registro",4,0,1,"Fld5",0,0,""|6,"Estado",4,0,1,"Fld6",0,0,""|7,"Origen",4,0,1,"Fld7",0,0,""|8,"Destino",4,0,1,"Fld8",0,0,""|9,"Destinatarios",1,80,1,"Fld9",0,0,""|10,"Tipo de transporte",1,31,1,"Fld10",0,0,""|11,"N�mero de transporte",1,30,1,"Fld11",0,0,""|12,"Tipo de asunto",4,0,1,"Fld12",0,0,""|13,"Resumen",1,240,1,"Fld13",0,0,""|14,"Comentario",2,65535,1,"Fld14",0,0,""|15,"Fecha del documento",7,0,1,"Fld15",0,0,""|8|1,"SREG1",1,1,1|2,"SREG2",0,1,2|3,"SREG3",0,1,4|4,"SREG4",0,1,6|5,"SREG5",0,1,7|6,"SREG6",0,1,8|7,"SREG7",0,1,9|8,"SREG8",0,1,5' 
WHERE ARCHID = 2 AND DETTYPE = 1;

UPDATE IDOCARCHDET SET DETVAL = '"01.00"|2147483646|1|4|8|2|2,9,"-",":"," ",1,1|0,2147483646|4|2,7,"-","","",1,0|0,2147483646|5|1,4,".","",0|0,2147483646|6|1,4,".","",0|0,2147483646|7|1,4,".","",0|0,2147483646|8|1,4,".","",0|0,2147483646|12|1,4,".","",0|0,2147483646|14|2,7,"-","","",1,0|0,2147483646'
WHERE ARCHID = 2 AND DETTYPE = 5;

UPDATE IDOCFMT SET DATA = '"01.05"|"Carpeta",32,1,556,377,3|"Registro",6,32,513,363,"MS Sans Serif",8,40|1001,8,9,88,17,1342177280,130,"N�mero de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1001",""|1002,88,4,194,17,1350631552,129,"","",0,0,0,3,1,"IDOC_EDIT1002",""|1005,204,9,238,19,1342177280,130,"Usuario:","",0,0,0,1,2147483646,"IDOC_STATIC1005",""|1006,238,4,310,17,1350631552,129,"","",0,0,0,3,3,"IDOC_EDIT1006",""|1073,320,9,350,17,1342177280,130,"Estado:","",0,0,0,1,2147483646,"IDOC_STATIC1073",""|1074,350,4,412,17,1350631552,129,"","",0,0,0,3,6,"IDOC_EDIT1074",""|1003,8,25,88,35,1342177280,130,"Fecha de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1003",""|1004,88,22,194,35,1350631552,129,"","",0,0,0,3,2,"IDOC_EDIT1004",""|1007,278,25,350,33,1342177280,130,"Fecha de trabajo:","MS Sans Serif",8,1,0,1,2147483646,"IDOC_STATIC1007",""|1008,350,22,412,35,1350631552,129,"","",0,0,0,3,4,"IDOC_EDIT1008",""|1075,8,41,82,51,1342177280,130,"Oficina de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1075",""|1076,88,38,152,51,1350631552,129,"","",0,0,0,3,5,"IDOC_EDIT1076",""|1077,166,38,412,51,1350633604,129,"","",0,0,0,10,5,"IDOC_EDIT1077",""|1013,8,57,78,67,1342177280,130,"Origen:","",0,0,0,1,2147483646,"IDOC_STATIC1013",""|1014,88,54,172,67,1350631552,129,"","",0,0,0,3,7,"IDOC_EDIT1014",""|1039,182,54,412,73,1350633604,129,"","",0,0,0,10,7,"IDOC_EDIT1039",""|1015,8,78,78,88,1342177280,130,"Destino:","",0,0,0,1,2147483646,"IDOC_STATIC1015",""|1016,88,75,172,88,1350631552,129,"","",0,0,0,3,8,"IDOC_EDIT1016",""|1040,182,75,412,94,1350633604,129,"","",0,0,0,10,8,"IDOC_EDIT1040",""|1017,8,99,90,108,1342177280,130,"Remitentes:","",0,0,0,1,2147483646,"IDOC_STATIC1017",""|1018,88,96,412,160,1350631552,129,"","",0,0,0,3,9,"IDOC_EDIT1018",""|1052,8,171,72,179,1342177280,130,"Tipo de asunto:","",0,0,0,1,2147483646,"IDOC_STATIC1052",""|1053,88,168,152,182,1350631552,129,"","",0,0,0,3,16,"IDOC_EDIT1053",""|1054,160,168,412,188,1350633604,129,"","",0,0,0,10,16,"IDOC_EDIT1054",""|1047,8,200,66,209,1342177280,130,"Resumen:","",0,0,0,1,2147483646,"IDOC_STATIC1047",""|1048,88,192,412,225,1350631620,129,"","",0,0,0,3,17,"IDOC_EDIT1048",""|1087,8,235,78,243,1342177280,130,"Ref. Expediente:","",0,0,0,1,2147483646,"IDOC_STATIC1087",""|1088,88,230,212,244,1350631552,129,"","",0,0,0,3,19,"IDOC_EDIT1088",""|1055,8,260,88,268,1342177280,130,"Tipo de Reg. original:","",0,0,0,1,2147483646,"IDOC_STATIC1055",""|1056,88,256,166,270,1350631552,129,"","",0,0,0,3,11,"IDOC_EDIT1056",""|1019,224,248,300,257,1342177280,130,"N�. registro original:","",0,0,0,1,2147483646,"IDOC_STATIC1019",""|1020,322,244,412,259,1350631552,129,"","",0,0,0,3,10,"IDOC_EDIT1020",""|1057,224,264,318,275,1342177280,130,"Fecha de Reg. original:","",0,0,0,1,2147483646,"IDOC_STATIC1057",""|1058,322,262,412,275,1350631552,129,"","",0,0,0,3,12,"IDOC_EDIT1058",""|1062,8,289,88,299,1342177280,130,"Tipo de transporte:","",0,0,0,1,2147483646,"IDOC_STATIC1062",""|1063,88,284,200,299,1350631552,129,"","",0,0,0,3,14,"IDOC_EDIT1063",""|1064,224,288,330,299,1342177280,130,"N�mero de transporte:","",0,0,0,1,2147483646,"IDOC_STATIC1064",""|1065,322,284,412,299,1350631552,129,"","",0,0,0,3,15,"IDOC_EDIT1065",""|1089,8,313,82,323,1342308352,130,"Fecha del documento:","",0,0,0,1,2147483646,"IDOC_STATIC1089",""|1090,88,309,200,324,1350631552,129,"","",0,0,0,3,20,"IDOC_EDIT1090",""|1,2147483646,""|"Comentarios",6,32,513,363,"MS Sans Serif",8,2|1035,16,46,84,57,1342177280,130,"Comentario:","",0,0,0,1,2147483646,"IDOC_STATIC1035",""|1036,92,41,408,243,1352728644,129,"","",0,0,0,3,18,"IDOC_EDIT1036",""|1,2147483646,""|"Documentos",6,32,513,363,"MS Sans Serif",8,0|2,2147483646,"2,2|0|2,0,50,0,0,0,1,1,50,0,0,50,1|0.000000,0,0"|0|0|"0"|1,0|0,0|0|2147483646|2147483646|0' 
WHERE ID = 9;

UPDATE IDOCFMT SET DATA = '"01.05"|"Carpeta",44,8,618,392,2|"Registro",6,32,563,371,"MS Sans Serif",8,34|1001,8,11,86,19,1342177280,130,"N�mero de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1001",""|1002,92,6,192,19,1350631552,129,"","",0,0,0,3,1,"IDOC_EDIT1002",""|1005,202,9,242,19,1342177280,130,"Usuario:","",0,0,0,1,2147483646,"IDOC_STATIC1005",""|1006,244,6,316,19,1350631552,129,"","",0,0,0,3,3,"IDOC_EDIT1006",""|1011,322,9,352,17,1342177280,130,"Estado:","",0,0,0,1,2147483646,"IDOC_STATIC1011",""|1012,354,6,412,19,1350631552,129,"","",0,0,0,3,6,"IDOC_EDIT1012",""|1003,8,27,78,35,1342177280,130,"Fecha de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1003",""|1004,92,24,192,36,1350631552,129,"","",0,0,0,3,2,"IDOC_EDIT1004",""|1007,246,27,326,35,1342177280,130,"Fecha de trabajo:","MS Sans Serif",8,1,0,1,2147483646,"IDOC_STATIC1007",""|1008,324,24,412,36,1350631552,129,"","",0,0,0,3,4,"IDOC_EDIT1008",""|1013,8,43,78,51,1342177280,130,"Origen:","",0,0,0,1,2147483646,"IDOC_STATIC1013",""|1014,92,41,192,54,1350631552,129,"","",0,0,0,3,7,"IDOC_EDIT1014",""|1042,202,41,412,62,1350633604,129,"","",0,0,0,10,7,"IDOC_EDIT1042",""|1015,8,70,78,78,1342177280,130,"Destino:","",0,0,0,1,2147483646,"IDOC_STATIC1015",""|1016,92,67,192,80,1350631552,129,"","",0,0,0,3,8,"IDOC_EDIT1016",""|1043,202,67,412,88,1350633604,129,"","",0,0,0,10,8,"IDOC_EDIT1043",""|1017,8,94,86,102,1342177280,130,"Destinatarios:","",0,0,0,1,2147483646,"IDOC_STATIC1017",""|1018,92,92,412,144,1350631552,129,"","",0,0,0,3,9,"IDOC_EDIT1018",""|1036,8,156,80,164,1342177280,130,"Tipo de asunto:","",0,0,0,1,2147483646,"IDOC_STATIC1036",""|1037,92,153,192,166,1350631552,129,"","",0,0,0,3,12,"IDOC_EDIT1037",""|1046,202,153,412,174,1350633604,129,"","",0,0,0,10,12,"IDOC_EDIT1046",""|1038,8,185,90,193,1342177280,130,"Resumen:","",0,0,0,1,2147483646,"IDOC_STATIC1038",""|1039,92,177,412,217,1350631620,129,"","",0,0,0,3,13,"IDOC_EDIT1039",""|1019,8,225,96,233,1342177280,130,"Tipo de transporte:","",0,0,0,1,2147483646,"IDOC_STATIC1019",""|1020,92,224,226,238,1350631552,129,"","",0,0,0,3,10,"IDOC_EDIT1020",""|1034,236,225,334,233,1342177280,130,"N�mero de transporte:","",0,0,0,1,2147483646,"IDOC_STATIC1034",""|1035,330,224,412,238,1350631552,129,"","",0,0,0,3,11,"IDOC_EDIT1035",""|1040,8,256,80,264,1342177280,130,"Comentario:","",0,0,0,1,2147483646,"IDOC_STATIC1040",""|1041,92,241,412,275,1352728644,129,"","",0,0,0,3,14,"IDOC_EDIT1041",""|1009,8,284,96,292,1342177280,130,"Oficina de registro:","",0,0,0,1,2147483646,"IDOC_STATIC1009",""|1010,8,296,98,307,1350631552,129,"","",0,0,0,3,5,"IDOC_EDIT1010",""|1033,104,296,324,307,1350633604,129,"","",0,0,0,10,5,"IDOC_EDIT1033",""|1047,9,318,95,329,1342308352,130,"Fecha del documento:","",0,0,0,1,2147483646,"IDOC_STATIC1047",""|1048,93,313,214,329,1350631552,129,"","",0,0,0,3,15,"IDOC_EDIT1048",""|1,2147483646,""|"Documentos",6,32,563,371,"MS Sans Serif",8,0|2,2147483646,"2,2|0|2,0,50,0,0,0,1,1,50,0,0,50,1|0.000000,0,0"|0|0|"0"|1,0|0,0|0|2147483646|2147483646|0' 
WHERE ID = 12;