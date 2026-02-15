// Terminar de agregar las recompensas.

#define POSITION_1 	( 0.0 )
#define POSITION_2  ( 40.0 )
#define POSITION_3 	( 80.0 )
#define POSITION_4 	( 120.0 )
#define POSITION_5 	( 160.0 )

new PlayerText:number_captcha[MAX_PLAYERS][256];
new PlayerText:captcha_background[MAX_PLAYERS];
new PlayerCountNumber[MAX_PLAYERS];
new PlayerNumber[MAX_PLAYERS][5];

enum pay_info
{
	item_crack,
	item_medis,
	item_money,
	item_pices,
	item_payday
}
new PlayerPayInfo[MAX_PLAYERS][pay_info];

enum number_info
{
	Float:number_x,	Float:number_y
}
new NumberInfo[][number_info] =
{
	// Numero 1
	{221.914673, 378.158936},
	{252.204361, 354.550964},
	{249.105850, 360.378418},
	{243.678528, 357.379395},
	{246.289032, 365.676086},
	{243.800827, 370.355713},
	{240.655365, 376.271454},
	{235.934402, 373.648010},
	{246.618057, 379.328644},
	// Numero 2
	{270.224731, 357.039886},
	{276.418762, 356.599304},
	{281.766296, 353.700378},
	{283.817383, 359.657135},
	{285.770782, 365.330261},
	{280.260468, 367.756409},
	{274.359436, 369.047974},
	{276.280304, 374.626526},
	{278.331390, 380.583282},
	{284.037048, 378.724426},
	{289.352020, 375.730957},
	{349.615265, 352.555664},
	// Numero 3
	{378.095764, 374.972504},
	{393.427307, 356.229218},
	{399.419067, 355.915222},
	{405.353271, 354.502716},
	{405.662048, 360.394623},
	{405.997009, 366.785858},
	{399.968597, 366.400818},
	{394.018677, 367.513733},
	{406.311035, 372.777618},
	{394.662415, 379.796875},
	{400.580933, 378.084778},
	{406.577942, 377.870636},
	// Numero 4
	{366.630890, 352.780029},
	{367.872498, 373.375031},
	{362.918701, 353.904907},
	{364.467010, 360.114807},
	{365.676636, 364.966278},
	{367.321686, 371.564301},
	{368.700653, 377.095001},
	{351.420319, 357.390167},
	{352.605743, 362.144623},
	{354.008881, 367.772339},
	{360.217743, 367.873260},
	{420.937347, 389.452545},
	// Numero 5
	{304.092743, 345.306793},
	{269.944489, 358.666534},
	{274.920502, 355.033447},
	{280.756104, 353.425446},
	{271.741852, 362.900848},
	{274.672333, 369.804626},
	{280.156281, 367.368195},
	{285.796539, 365.299957},
	{288.023712, 370.546844},
	{278.970367, 379.930206},
	{284.532471, 377.677856},
	{289.860138, 374.873230},
	{331.320923, 371.573944},
	// Numero 6
	{260.456604, 387.456604},
	{241.558105, 353.584259},
	{246.099960, 357.606903},
	{252.112335, 359.365112},
	{238.453659, 358.364685},
	{235.022446, 363.648285},
	{240.054459, 366.916138},
	{245.086487, 370.183960},
	{241.764191, 375.299866},
	{228.976944, 372.957550},
	{232.974152, 377.818848},
	{238.060638, 381.002808},
	{231.645676, 368.848053},
	{260.422028, 370.452118},
	// Numero 7
	{272.959625, 386.333160},
	{269.676758, 364.259277},
	{274.203613, 360.240906},
	{279.737030, 357.714783},
	{283.148102, 362.771912},
	{285.944092, 366.917084},
	{289.746582, 372.554565},
	{292.430725, 376.533936},
	// Numero 8
	{340.992462, 381.323212},
	{351.341888, 356.170074},
	{357.075623, 354.333191},
	{363.079315, 353.665527},
	{352.736603, 362.211182},
	{354.198761, 368.544586},
	{359.955017, 366.805115},
	{365.756226, 365.260559},
	{367.195923, 371.496521},
	{356.628235, 379.067780},
	{362.564453, 378.107819},
	{368.613129, 377.635040},
	{355.413513, 373.806183},
	{364.316559, 359.024567},
	// Numero 9
	{248.431305, 372.686981},
	{230.003952, 359.300079},
	{235.119156, 356.037445},
	{240.600433, 353.597046},
	{232.118988, 364.050507},
	{234.559402, 369.531769},
	{240.325394, 367.730835},
	{245.847336, 365.381775},
	{248.287750, 370.863037},
	{250.443466, 375.704834},
	{243.040848, 359.078308},
	{288.416290, 351.816589}
};

stock PayCaptcha(playerid)
{
	player_data[playerid][pCrack] 		+= PlayerPayInfo[playerid][item_crack];
	player_data[playerid][pRemedios] 	+= PlayerPayInfo[playerid][item_medis];
	player_data[playerid][pMateriales]  += PlayerPayInfo[playerid][item_pices];
	player_data[playerid][jExperiencia] += PlayerPayInfo[playerid][item_payday];
	DarDinero(playerid,PlayerPayInfo[playerid][item_money]);

	SendClientMessage(playerid,color_white,#color_green_min"Recibiste tu recompensa "#color_white_min"por completar la verificación "#color_white_min"correctamente"#color_white_min".");

	PlayerPayInfo[playerid][item_crack] = 0;
	PlayerPayInfo[playerid][item_money] = 0;
	PlayerPayInfo[playerid][item_medis] = 0;
	PlayerPayInfo[playerid][item_pices] = 0;
	PlayerPayInfo[playerid][item_payday] = 0;
	BarraExp(playerid, 1);
}	

stock CreateCaptchaNumber(playerid,number, Float:rot_x)
{
	if(number == 1) 
	{
		for(new i = 0; i < 8; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 2)
	{
		for(new i = 9; i < 20; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 40.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 3)
	{
		for(new i = 21; i < 32; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 160.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 4)
	{
		for(new i = 33; i < 44; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 120.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 5)
	{
		for(new i = 45; i < 57; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 40.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 6)
	{
		for(new i = 58; i < 71; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 7)
	{
		for(new i = 72; i < 79; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 40.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 8)
	{
		for(new i = 80; i < 93; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x - 120.0, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
	if(number == 9)
	{
		for(new i = 94; i < 105; i++)
		{
			number_captcha[playerid][PlayerCountNumber[playerid]] = CreatePlayerTextDraw(playerid, NumberInfo[i][number_x] + rot_x, NumberInfo[i][number_y], ".");
			PlayerTextDrawLetterSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0.480000, 1.120000);
			PlayerTextDrawTextSize(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1280.000000, 1280.000000);
			PlayerTextDrawColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0xE1E1E1FF);
			PlayerTextDrawBoxColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x80808080);
			PlayerTextDrawBackgroundColor(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 0x000000FF);
			PlayerTextDrawFont(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);
			PlayerTextDrawSetProportional(playerid, number_captcha[playerid][PlayerCountNumber[playerid]], 1);

			PlayerTextDrawShow(playerid, number_captcha[playerid][PlayerCountNumber[playerid]]);
			PlayerCountNumber[playerid]++;
		}
	}
}

forward DestroyCaptcha(playerid);
public DestroyCaptcha(playerid)
{
	PlayerTextDrawDestroy(playerid, captcha_background[playerid]);
	for(new i = 0; i < PlayerCountNumber[playerid]; i++) PlayerTextDrawDestroy(playerid, number_captcha[playerid][i]);
	for(new i = 0; i < 5; i++) PlayerNumber[playerid][i] = 0;
	PlayerCountNumber[playerid] = 0;
}

forward CreateCaptcha(playerid);
public CreateCaptcha(playerid)
{
	new randomNumber[5];

	for(new i = 0; i < sizeof(randomNumber); i++) randomNumber[i] = random(9) + 1, PlayerNumber[playerid][i] = randomNumber[i];

	if(player_data[playerid][pVip] >= 2) return 1;

	ShowPlayerDialog(playerid, dialog_captcha, DIALOG_STYLE_INPUT,#color_white_min"Verificación de "#color_red_min"fraude",#color_white_min"Para evitar el uso de bots, ingresa aquí los números de abajo...\nTendrás "#color_green_min"5 oportunidades"#color_white_min" para completarlo correctamente\n\n"#color_yellow_min"Puedes omitir esto adquiriendo VIP2"#color_white_min".","Verificar","");

	captcha_background[playerid] = CreatePlayerTextDraw(playerid, 201.000000, 337.866669, "_");
	PlayerTextDrawLetterSize(playerid, captcha_background[playerid], 15.714285, 8.500000);
	PlayerTextDrawTextSize(playerid, captcha_background[playerid], 450.000000, 59.866665);
	PlayerTextDrawAlignment(playerid, captcha_background[playerid], 1);
	PlayerTextDrawColor(playerid, captcha_background[playerid], 0xFFFFFFFF);
	PlayerTextDrawUseBox(playerid, captcha_background[playerid], 1);
	PlayerTextDrawBoxColor(playerid, captcha_background[playerid], 0x000000AA);
	PlayerTextDrawSetShadow(playerid, captcha_background[playerid], 0);
	PlayerTextDrawSetOutline(playerid, captcha_background[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, captcha_background[playerid], 0x000000FF);
	PlayerTextDrawFont(playerid, captcha_background[playerid], 1);
	PlayerTextDrawSetProportional(playerid, captcha_background[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, captcha_background[playerid], 0);
	PlayerTextDrawShow(playerid, captcha_background[playerid]);

	CreateCaptchaNumber(playerid,randomNumber[0],POSITION_1);
	CreateCaptchaNumber(playerid,randomNumber[1],POSITION_2);
	CreateCaptchaNumber(playerid,randomNumber[2],POSITION_3);
	CreateCaptchaNumber(playerid,randomNumber[3],POSITION_4);
	CreateCaptchaNumber(playerid,randomNumber[4],POSITION_5);

	return 1;
}

CMD:testaudio(playerid)
{
	CreateCaptcha(playerid);
	return 1;
}