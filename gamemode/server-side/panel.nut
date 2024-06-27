//---------------------------------------

function checkPermission(pid, level)
{
	if(Players[pid].rank >= level)
		return true;

	//sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie masz uprawnieñ do u¿ycia tej komendy!");
	return false;
}

//---------------------------------------

addEventHandler("onPlayerJoin", function(pid){
	local playerSerial = getPlayerSerial(pid);

	foreach(serial in ADMIN_SERIAL){
		if(serial == playerSerial){
			Players[pid].rank = LEVEL.ADMIN;
			setPlayerColor(pid, 100, 0, 0);
			return;
		}
	}
	foreach(serial in MOD_SERIAL){
		if(serial == playerSerial){
			Players[pid].rank = LEVEL.MOD;
			setPlayerColor(pid, 50, 100, 0);
			return;
		}
	}
	foreach(serial in LEADER_SERIAL){
		if(serial == playerSerial){
			Players[pid].rank = LEVEL.LEADER;
			setPlayerColor(pid, 0, 50, 100);
			return;
		}
	}
});

//---------------------------------------

addEventHandler("onPlayerCommand", function(pid, cmd, params){
	cmd = cmd.tolower();
	if(cmd == "panel" || cmd == "acp" || cmd == "help" || cmd == "pomoc"){
		if(checkPermission(pid, LEVEL.ADMIN)){
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== ADMIN ===========-");
			sendMessageToPlayer(pid, 150, 70, 0, "/ban id minutes reason - Zbanowanie gracza (0 minut = permanentnie)");
			sendMessageToPlayer(pid, 150, 70, 0, "/giveall instance amount - Danie przedmiotu wszystkim graczom");
			sendMessageToPlayer(pid, 150, 70, 0, "/kickall reason - Wyrzucenie wszystkich");
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== ADMIN ===========-");
		}
		if(checkPermission(pid, LEVEL.MOD)){
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== MOD ===========-");
			sendMessageToPlayer(pid, 150, 70, 0, "/color id r g b - Zmiana koloru gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/name id nickname - Zmiana nazwy gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/kick id reason - Wyrzucenie gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/tp from_id to_id - Teleportacja pierwszego gracza do drugiego");
			sendMessageToPlayer(pid, 150, 70, 0, "/tpall to_id - Teleportacja wszystkich graczy");
			sendMessageToPlayer(pid, 150, 70, 0, "/stats id (hp/mp/str/dex) value - Zmiana statystyk gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/give id instance amount - Danie przedmiotu graczowi");
			sendMessageToPlayer(pid, 150, 70, 0, "/time hour minute - Zmiana czasu serwera");
			sendMessageToPlayer(pid, 150, 70, 0, "/scale id x y z - Zmiana skali gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/vanish id - Zmiana widzialnoœci gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/tele pos - Teleportacja do wybranej lokacji (list = lista pozycji)");
			sendMessageToPlayer(pid, 150, 70, 0, "/spawn - Teleportacja na spawnpoint obecnej klasy");
			sendMessageToPlayer(pid, 150, 70, 0, "/instance name - Zmiana instancji");
			sendMessageToPlayer(pid, 150, 70, 0, "/kill id - Zabicie gracza");
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== MOD ===========-");
		}
		if(checkPermission(pid, LEVEL.LEADER)){
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== DOWO ===========-");
			sendMessageToPlayer(pid, 150, 70, 0, "/promote id class - Zmiana klasy gracza");
			sendMessageToPlayer(pid, 150, 70, 0, "/glist - Lista klas gildii");
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== DOWO ===========-");
		}
		if(checkPermission(pid, LEVEL.PLAYER)){
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== GRACZ ===========-");
			sendMessageToPlayer(pid, 150, 70, 0, "F8 - Zmiana wygl¹du");
			sendMessageToPlayer(pid, 150, 70, 0, "F10 - Menu animacji");
			sendMessageToPlayer(pid, 150, 70, 0, "/afk - Zmiana statusu");
			sendMessageToPlayer(pid, 150, 70, 0, "/chat - Czaty RP");
			sendMessageToPlayer(pid, 150, 70, 0, "/staff - Obecne osoby z uprawnieniami");
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== GRACZ ===========-");
		}
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "color"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dddd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /color id r g b");
			return;
		}

		local id = args[0];
		local r = args[1];
		local g = args[2];
		local b = args[3];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zmieniæ koloru niepo³¹czonemu graczowi!");
			return;
		}

		setPlayerColor(id, r, g, b);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieniono kolor " + getPlayerName(id) + " na (" + r + "," + g + "," + b + ")");
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ ci kolor na (" + r + "," + g + "," + b + ")");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "name" || cmd == "nick"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("ds", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /name id nickname");
			return;
		}

		local id = args[0];
		local name = args[1];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zmieniæ nicku niepo³¹czonemu graczowi!");
			return;
		}

		setPlayerName(id, name);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieniono nick " + getPlayerName(id) + " na " + name);
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ ci nick na " + name);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "kick"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("ds", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /kick id reason");
			return;
		}

		local id = args[0];
		local reason = args[1];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz wyrzuciæ niepo³¹czonego gracza!");
			return;
		}

		kick(id, reason);

		sendMessageToAll(250, 100, 100, "(PANEL) " + getPlayerName(pid) + " wyrzuci³ " + getPlayerName(id) + " za " + reason);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "ban"){
		if (!checkPermission(pid, LEVEL.ADMIN)) return;

		local args = sscanf("dds", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /ban id minutes reason");
			return;
		}

		local id = args[0];
		local minutes = args[1];
		local reason = args[2];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zbanowaæ niepo³¹czonego gracza!");
			return;
		}

		ban(id, minutes, reason);

		sendMessageToAll(250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zbanowa³ " + getPlayerName(id) + " za " + reason + " na " + minutes + "min");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "tp"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /tp from_id to_id");
			return;
		}

		local from_id = args[0];
		local to_id = args[1];

		if(!isPlayerConnected(from_id) || !isPlayerSpawned(from_id) || !isPlayerConnected(to_id) || !isPlayerSpawned(to_id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz teleportowaæ niepo³¹czonych graczy!");
			return;
		}

		local world = getPlayerWorld(to_id);
		if (world != getPlayerWorld(from_id))
			setPlayerWorld(from_id, world);

		local pos = getPlayerPosition(to_id);
		setPlayerPosition(from_id, pos.x, pos.y, pos.z);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Teleportowano " + getPlayerName(from_id) + " do " + getPlayerName(to_id));
		sendMessageToPlayer(from_id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " teleportowa³ ciê do " + getPlayerName(to_id));
		sendMessageToPlayer(to_id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " teleportowa³ do ciebie " + getPlayerName(from_id));
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "tpall"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /tpall to_id");
			return;
		}

		local to_id = params.tointeger();
		if(!isPlayerConnected(to_id) || !isPlayerSpawned(to_id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz teleportowaæ do niepo³¹czonych graczy!");
			return;
		}

		local world = getPlayerWorld(to_id);
		local pos = getPlayerPosition(to_id);

		for (local i = 0; i < getMaxSlots(); ++i){
			if(isPlayerConnected(i) && isPlayerSpawned(i)){
				if(world != getPlayerWorld(i))
					setPlayerWorld(i, world);

				setPlayerPosition(i, pos.x, pos.y, pos.z);
			}
		}

		sendMessageToAll(250, 100, 100, "(PANEL) " + getPlayerName(pid) + " teleportowa³ wszystkich do " + getPlayerName(to_id));
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "give"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dsd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /give id instance amount");
			return;
		}

		local id = args[0];
		local instance = args[1].toupper();
		local amount = args[2];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz daæ przedmiotu niepo³¹czonemu graczowi!");
			return;
		}

		if (amount < 1) amount = 1;
		giveItem(id, Items.id(instance), amount);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Da³eœ " + getPlayerName(id) + " przedmiot " + instance + " w iloœci " + amount);
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " da³ ci przedmiot " + instance + " w iloœci " + amount);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "heal"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /heal id");
			return;
		}

		local id = params.tointeger();
		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz uleczyæ niepo³¹czonego gracza!");
			return;
		}

		setPlayerHealth(id, getPlayerMaxHealth(id));

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Uleczono " + getPlayerName(id));
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " uleczy³ ciê");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "time"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /time hour min");
			return;
		}

		local hour = args[0];
		local min = args[1];

		if (hour > 23) hour = 23;
		else if (hour < 0) hour = 0;

		if (min > 59) min = 59;
		else if (min < 0) min = 0;

		setTime(hour, min);
		sendMessageToAll(250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ czas gry na " + format("%02d:%02d", hour, min));
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "scale"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local args = sscanf("dfff", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /scale id x y z");
			return;
		}

		local id = args[0];
		local x = args[1];
		local y = args[2];
		local z = args[3];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zmieniæ skali niepo³¹czonego gracza!");
			return;
		}

		setPlayerScale(id, x, y, z);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieniono skalê " + getPlayerName(id) + " na " + x + "," + y + "," + z);
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ ci skalê na " + x + "," + y + "," + z);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "vanish"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /vanish id");
			return;
		}

		local id = params.tointeger();
		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zmieniæ widzialnoœci niepo³¹czonego gracza!");
			return;
		}

		setPlayerInvisible(id, !getPlayerInvisible(id));

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieniono widzialnoœæ " + getPlayerName(id));
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ ci widzialnoœæ");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "giveall"){
		if(!checkPermission(pid, LEVEL.ADMIN)) return;

		local args = sscanf("sd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /giveall instance amount");
			return;
		}

		local instance = Items.id(args[0].toupper());
		local amount = args[1];

		for(local i = 0; i < getMaxSlots(); ++i){
			if(isPlayerConnected(i) && isPlayerSpawned(i))
				giveItem(i, instance, amount);
		}
			sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Dano wszystkim przedmiot " + instance + " w iloœci " + amount);
			sendMessageToAll(250, 100, 100, "(PANEL) " + getPlayerName(pid) + " da³ ci przedmiot " + instance + " w iloœci " + amount);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "kickall"){
		if(!checkPermission(pid, LEVEL.ADMIN)) return;

		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /kickall reason");
			return;
		}

		for(local i = 0; i < getMaxSlots(); ++i){
			kick(i, params);
		}
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "stats"){
		if(!checkPermission(pid, LEVEL.MOD)) return;
		
		local args = sscanf("dsd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /stats id (hp/mp/str/dex) value");
			return;
		}

		local id = args[0];
		local stat = args[1];
		local value = args[2];

			if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
				sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zmieniæ statystyk niepo³¹czonego gracza!");
				return;
			}

		if(stat == "hp"){
			setPlayerMaxHealth(id, value);
			setPlayerHealth(id, value);
		}
		if(stat == "mp"){
			setPlayerMaxMana(id, value);
			setPlayerMana(id, value);
		}
		if(stat == "str"){
			setPlayerStrength(id, value);
		}
		if(stat == "dex"){
			setPlayerDexterity(id, value);
		}

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieni³eœ statystykê " + getPlayerName(id) + " (" + stat + " = " + value + ")");
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zmieni³ ci statystykê (" + stat + " = " + value + ")");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "afk"){
		if(!checkPermission(pid, LEVEL.PLAYER)) return;

		if(!isPlayerSpawned(pid)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz u¿yæ AFK!");
			return;
		}

		if(!Players[pid].afk){
			setPlayerColor(pid, 0, 0, 0);

			setPlayerVirtualWorld(pid, 1);
			sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Jesteœ teraz AFK.");

			packet.reset();
			packet.writeUInt8(packets.afk);
			packet.writeBool(true);
			packet.send(pid, RELIABLE);
		} else {
			if(Players[pid].rank == LEVEL.ADMIN){
				setPlayerColor(pid, 100, 0, 0);
			}
			else if(Players[pid].rank == LEVEL.MOD){
				setPlayerColor(pid, 50, 100, 0);
			}
			else if(Players[pid].rank == LEVEL.LEADER){
				setPlayerColor(pid, 0, 50, 100);
			}
			else
				setPlayerColor(pid, 255, 255, 255);

			setPlayerVirtualWorld(pid, 0);
			sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Wróci³eœ z AFK.");

			packet.reset();
			packet.writeUInt8(packets.afk);
			packet.writeBool(false);
			packet.send(pid, RELIABLE);
		}

		Players[pid].afk = !Players[pid].afk;
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "promote"){
		if(!checkPermission(pid, LEVEL.LEADER)) return;

		local args = sscanf("dd", params);
		if(!args){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /promote id class");
			return;
		}

		local id = args[0];
		local clss = args[1];

		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz awansowaæ niepo³¹czonych graczy!");
			return;
		}

		Players[id].clss = clss;
			packet.reset();
			packet.writeUInt8(packets.promote);
			packet.send(id, RELIABLE);
		classes[clss].func(id);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Awansowano " + getPlayerName(id) + " na " + classes[clss].name);
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " awansowa³ ciê na " + classes[clss].name);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "glist"){
		if(!checkPermission(pid, LEVEL.LEADER)) return;

		local clss = Players[pid].clss;
		local guild = classes[clss].guild;

			sendMessageToPlayer(pid, 150, 100, 0, "-=========== " + guild + " ===========-");
			foreach(id, tier in classes){
				if(tier.guild == guild)
				sendMessageToPlayer(pid, 150, 70, 0, id + " - " + tier.name);
			}
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== " + guild + " ===========-");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "tele"){
		if(!checkPermission(pid, LEVEL.MOD)) return;
		
		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /tele pos");
			return;
		}

		if(params == "list"){
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== POZYCJE ===========-");
			foreach(id, loc in locations){
				sendMessageToPlayer(pid, 150, 70, 0, id + " - " + loc.name);
			}
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== POZYCJE ===========-");
		} else {
			local pos = params.tointeger();
			setPlayerPosition(pid, locations[pos].position[0], locations[pos].position[1], locations[pos].position[2]);
			setPlayerAngle(pid, locations[pos].position[3]);

			sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Teleportowa³eœ siê do " + locations[pos].name);
		}
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "spawn"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local clss = Players[pid].clss;
		setPlayerPosition(pid, classes[clss].spawn[0], classes[clss].spawn[1], classes[clss].spawn[2]);
		setPlayerAngle(pid, classes[clss].spawn[3]);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Teleportowa³eœ siê na spawn klasy " + classes[clss].name);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "instance"){
		if(!checkPermission(pid, LEVEL.MOD)) return;
		
		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /instance name");
			return;
		}

		setPlayerInstance(pid, params.toupper());

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zmieni³eœ instance na " + params);
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "staff"){
		if(!checkPermission(pid, LEVEL.PLAYER)) return;

			sendMessageToPlayer(pid, 150, 100, 0, "-=========== ADMINISTRACJA ===========-");
			for(local i = 0; i < getMaxSlots(); ++i){
				if(isPlayerConnected(i)){
					if(!checkPermission(i, LEVEL.MOD)) return;
					sendMessageToPlayer(pid, 150, 70, 0, i + " - " + getPlayerName(i));
				}
			}
			sendMessageToPlayer(pid, 150, 100, 0, "-=========== ADMINISTRACJA ===========-");
	}
//---------------------------------------//---------------------------------------//
	else if(cmd == "kill"){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		if(!params){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) U¿ycie: /kill id");
			return;
		}

		local id = params.tointeger();
		if(!isPlayerConnected(id) || !isPlayerSpawned(id)){
			sendMessageToPlayer(pid, 192, 64, 64, "(PANEL) Nie mo¿esz zabiæ niepo³¹czonego gracza!");
			return;
		}

		setPlayerHealth(id, 0);

		sendMessageToPlayer(pid, 250, 100, 100, "(PANEL) Zabito " + getPlayerName(id));
		sendMessageToPlayer(id, 250, 100, 100, "(PANEL) " + getPlayerName(pid) + " zabi³ ciê");
	}
//---------------------------------------//---------------------------------------//
});
