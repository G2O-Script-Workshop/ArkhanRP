classes <- [
	{
		name = "Podró¿nik",
		guild = "Brak",
		spawn = [38609.4, 3910.47, -1259.92, 142.253],
		func = function(id) {
			setPlayerHealth(id, 100);
			setPlayerMaxHealth(id, 100);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 20);
			setPlayerDexterity(id, 20);
			setPlayerSkillWeapon(id, WEAPON_1H, 10);
			setPlayerSkillWeapon(id, WEAPON_2H, 10);
			setPlayerSkillWeapon(id, WEAPON_BOW, 10);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 10);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_LEATHER_L"));
		equipItem(id, Items.id("ITMW_1H_VLK_SWORD"));
		}
	},
//---------------------------------------
	{
		name = "Stra¿nik Miejski",
		guild = "Miasto",
		spawn = [4483.28, 848.047, 6580.23, 26.6093],
		func = function(id) {
			setPlayerHealth(id, 120);
			setPlayerMaxHealth(id, 120);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 30);
			setPlayerDexterity(id, 30);
			setPlayerSkillWeapon(id, WEAPON_1H, 20);
			setPlayerSkillWeapon(id, WEAPON_2H, 20);
			setPlayerSkillWeapon(id, WEAPON_BOW, 20);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 20);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_MIL_L"));
		equipItem(id, Items.id("ITMW_1H_VLK_SWORD"));
		equipItem(id, Items.id("ITRW_CROSSBOW_L_01"));
		giveItem(id, Items.id("ITRW_BOLT"), 50);
		}
	},
	{
		name = "Doœwiadczony Stra¿nik Miejski",
		guild = "Miasto",
		spawn = [2882.27, 848.125, 6572.34, 87.837],
		func = function(id) {
			setPlayerHealth(id, 150);
			setPlayerMaxHealth(id, 150);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 50);
			setPlayerDexterity(id, 50);
			setPlayerSkillWeapon(id, WEAPON_1H, 30);
			setPlayerSkillWeapon(id, WEAPON_2H, 30);
			setPlayerSkillWeapon(id, WEAPON_BOW, 30);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 30);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_MIL_M"));
		equipItem(id, Items.id("ITMW_SHORTSWORD5"));
		equipItem(id, Items.id("ITRW_MIL_CROSSBOW"));
		giveItem(id, Items.id("ITRW_BOLT"), 50);
		}
	},
	{
		name = "Paladyn",
		guild = "Miasto",
		spawn = [13516.8, 998.047, -2430.39, 252.03],
		func = function(id) {
			setPlayerHealth(id, 300);
			setPlayerMaxHealth(id, 300);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 70);
			setPlayerSkillWeapon(id, WEAPON_2H, 70);
			setPlayerSkillWeapon(id, WEAPON_BOW, 70);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 70);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_PAL_M"));
		equipItem(id, Items.id("ITMW_2H_PAL_SWORD"));
		}
	},
	{
		name = "Paladyn Zakonu",
		guild = "Miasto",
		spawn = [13708.6, 1198.12, -736.172, 186.798],
		func = function(id) {
			setPlayerHealth(id, 500);
			setPlayerMaxHealth(id, 500);
			setPlayerMana(id, 100);
			setPlayerMaxMana(id, 100);
			setPlayerStrength(id, 120);
			setPlayerDexterity(id, 120);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_PAL_H"));
		equipItem(id, Items.id("ITMW_2H_BLESSED_02"));
		}
	},
//---------------------------------------
	{
		name = "Zbuntowany Farmer",
		guild = "Farma",
		spawn = [72476.6, 3272.73, -11991.7, 45.2973],
		func = function(id) {
			setPlayerHealth(id, 120);
			setPlayerMaxHealth(id, 120);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 30);
			setPlayerDexterity(id, 30);
			setPlayerSkillWeapon(id, WEAPON_1H, 20);
			setPlayerSkillWeapon(id, WEAPON_2H, 20);
			setPlayerSkillWeapon(id, WEAPON_BOW, 20);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 20);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_BAU_M"));
		equipItem(id, Items.id("ITMW_1H_VLK_SWORD"));
		equipItem(id, Items.id("ITRW_CROSSBOW_L_01"));
		giveItem(id, Items.id("ITRW_BOLT"), 50);
		}
	},
	{
		name = "Najemnik",
		guild = "Farma",
		spawn = [73993.4, 3334.06, -10423.3, 242.807],
		func = function(id) {
			setPlayerHealth(id, 150);
			setPlayerMaxHealth(id, 150);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 50);
			setPlayerDexterity(id, 50);
			setPlayerSkillWeapon(id, WEAPON_1H, 30);
			setPlayerSkillWeapon(id, WEAPON_2H, 30);
			setPlayerSkillWeapon(id, WEAPON_BOW, 30);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 30);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_SLD_L"));
		equipItem(id, Items.id("ITMW_SHORTSWORD5"));
		equipItem(id, Items.id("ITRW_MIL_CROSSBOW"));
		giveItem(id, Items.id("ITRW_BOLT"), 50);
		}
	},
	{
		name = "Doœwiadczony Najemnik",
		guild = "Farma",
		spawn = [75281, 3612.19, -12553.4, 251.409],
		func = function(id) {
			setPlayerHealth(id, 300);
			setPlayerMaxHealth(id, 300);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 70);
			setPlayerSkillWeapon(id, WEAPON_2H, 70);
			setPlayerSkillWeapon(id, WEAPON_BOW, 70);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 70);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_SLD_M"));
		equipItem(id, Items.id("ITMW_STREITAXT1"));
		}
	},
	{
		name = "Elitarny Najemnik",
		guild = "Farma",
		spawn = [75500, 3612.19, -9449.69, 211.49],
		func = function(id) {
			setPlayerHealth(id, 500);
			setPlayerMaxHealth(id, 500);
			setPlayerMana(id, 100);
			setPlayerMaxMana(id, 100);
			setPlayerStrength(id, 120);
			setPlayerDexterity(id, 120);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_SLD_H"));
		equipItem(id, Items.id("ITMW_2H_SPECIAL_02"));
		}
	},
//---------------------------------------
	{
		name = "Nowicjusz",
		guild = "Klasztor",
		spawn = [48896.3, 4990.86, 19059.1, 271.355 ],
		func = function(id) {
			setPlayerHealth(id, 150);
			setPlayerMaxHealth(id, 150);
			setPlayerMana(id, 10);
			setPlayerMaxMana(id, 10);
			setPlayerStrength(id, 50);
			setPlayerDexterity(id, 50);
			setPlayerSkillWeapon(id, WEAPON_1H, 30);
			setPlayerSkillWeapon(id, WEAPON_2H, 30);
			setPlayerSkillWeapon(id, WEAPON_BOW, 30);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 30);
			setPlayerTalent(id, 0, 1);
			setPlayerMagicLevel(id, 1);
		equipItem(id, Items.id("ITAR_NOV_L"));
		equipItem(id, Items.id("ITMW_1H_NOV_MACE"));
		}
	},
	{
		name = "Mag Ognia",
		guild = "Klasztor",
		spawn = [51639.1, 5090.86, 19008, 262.533],
		func = function(id) {
			setPlayerHealth(id, 300);
			setPlayerMaxHealth(id, 300);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 70);
			setPlayerSkillWeapon(id, WEAPON_2H, 70);
			setPlayerSkillWeapon(id, WEAPON_BOW, 70);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 70);
			setPlayerTalent(id, 0, 1);
			setPlayerMagicLevel(id, 4);
		equipItem(id, Items.id("ITAR_KDF_L"));
		equipItem(id, Items.id("ITMW_1H_NOV_MACE"));
		}
	},
	{
		name = "Arcymag Ognia",
		guild = "Klasztor",
		spawn = [49853.2, 5090.86, 21943.7, 252.711],
		func = function(id) {
			setPlayerHealth(id, 500);
			setPlayerMaxHealth(id, 500);
			setPlayerMana(id, 100);
			setPlayerMaxMana(id, 100);
			setPlayerStrength(id, 120);
			setPlayerDexterity(id, 120);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
			setPlayerMagicLevel(id, 6);
		equipItem(id, Items.id("ITAR_KDF_H"));
		equipItem(id, Items.id("ITMW_ADDON_STAB05"));
		}
	},
//---------------------------------------
	{
		name = "£owca Smoków",
		guild = "VIP",
		spawn = [-23257.2, 1566.56, -4629.22, 109.382],
		func = function(id) {
			setPlayerHealth(id, 400);
			setPlayerMaxHealth(id, 400);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_DJG_M"));
		equipItem(id, Items.id("ITMW_RUBINKLINGE"));
		}
	},
	{
		name = "Najemnik Orków",
		guild = "VIP",
		spawn = [-17389.1, 2094.69, 15068.3, 254.453],
		func = function(id) {
			setPlayerHealth(id, 400);
			setPlayerMaxHealth(id, 400);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_RAVEN_ADDON"));
		equipItem(id, Items.id("ITMW_RUBINKLINGE"));
		}
	},
	{
		name = "Mag Wody",
		guild = "VIP",
		spawn = [-21066.1, 1496.33, -3869.69, 242.95],
		func = function(id) {
			setPlayerHealth(id, 400);
			setPlayerMaxHealth(id, 400);
			setPlayerMana(id, 100);
			setPlayerMaxMana(id, 100);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
			setPlayerMagicLevel(id, 6);
		equipItem(id, Items.id("ITAR_KDW_H"));
		equipItem(id, Items.id("ITMW_ADDON_STAB05"));
		}
	},
	{
		name = "Nekromanta",
		guild = "VIP",
		spawn = [-17351.3, 2357.73, 17654.8, 354.095],
		func = function(id) {
			setPlayerHealth(id, 400);
			setPlayerMaxHealth(id, 400);
			setPlayerMana(id, 100);
			setPlayerMaxMana(id, 100);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
			setPlayerMagicLevel(id, 6);
		equipItem(id, Items.id("ITAR_XARDAS"));
		equipItem(id, Items.id("ITMW_ADDON_STAB05"));
		}
	},
	{
		name = "Upad³y Paladyn",
		guild = "VIP",
		spawn = [-20336.6, 2407.73, 17546, 90.4353],
		func = function(id) {
			setPlayerHealth(id, 400);
			setPlayerMaxHealth(id, 400);
			setPlayerMana(id, 75);
			setPlayerMaxMana(id, 75);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);
			setPlayerTalent(id, 0, 1);
		equipItem(id, Items.id("ITAR_PAL_SKEL"));
		equipItem(id, Items.id("ITMW_ZWEIHAENDER1"));
		}
	}
];
