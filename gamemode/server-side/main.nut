Players <- {};

class Player {
	constructor(id) {
		logged = false;
		clss = 0;
		vis = ["Hum_Body_Naked0", 9, "Hum_Head_Pony", 18];
		afk = false;
		rank = 0;
	}
	logged = null;
	clss = null;
	vis = null;
	afk = null;
	rank = null;
}

// ======================================================= //

addEventHandler("onInit", function(){
	local savedtime = io.file("database/logs/time.log", "r");
	if(savedtime.isOpen){
		local _hour = savedtime.read(io_type.LINE).tointeger();
		local _min = savedtime.read(io_type.LINE).tointeger();
			setTime(_hour, _min);

	savedtime.close();
	}

	setTimer(function(){
		local hour = getTime().hour;
		local min = getTime().min;

		setTime(hour, min);
	}, 4000, 0);

	//print(getServerDescription());
});

addEventHandler("onExit", function(){
	local _hour = getTime().hour;
	local _min = getTime().min;

	local savedtime = io.file("database/logs/time.log", "w");
	if(savedtime.isOpen){
		savedtime.write(_hour + " \n" + _min);

		savedtime.close();
	}
});

// ======================================================= //

addEventHandler("onPlayerJoin", function(pid){
	Players[pid] <- Player(pid);
	if(getPlayerName(pid) != "Nickname"){
		loadPlayer(pid);
	} else
		kick(pid, "Zmieñ nick w launcherze Gothic 2 Online. Pamiêtaj aby pasowa³ do trybu gry.");

	setPlayerVirtualWorld(pid, 0);
});

addEventHandler("onPlayerDisconnect", function(pid, reason){
	if(Players[pid].logged == true)
		savePlayer(pid);

	Players.rawdelete(pid);
});

function loadPlayer(pid){
	local playerjoin = io.file("database/players/" + getPlayerName(pid), "r");
	if(playerjoin.isOpen){
		local pserial = playerjoin.read(io_type.LINE);
		if(getPlayerSerial(pid) == pserial){
			local pclass = playerjoin.read(io_type.LINE).tointeger();
				classes[pclass].func(pid);
				Players[pid].clss = pclass;
			local pvis = sscanf("sdsd", playerjoin.read(io_type.LINE));
				setPlayerVisual(pid, pvis[0], pvis[1], pvis[2], pvis[3]);
				Players[pid].vis = [pvis[0], pvis[1], pvis[2], pvis[3]];
			local ppos = sscanf("ffff", playerjoin.read(io_type.LINE));
				setPlayerPosition(pid, ppos[0], ppos[1], ppos[2]);
				setPlayerAngle(pid, ppos[3]);
		} else if(getPlayerSerial(pid) != pserial){
			kick(pid, "Jeœli to twoje konto a widzisz t¹ wiadomoœæ, skontaktuj siê z administratorem.");
			return;
		}
			packet.writeUInt8(packets.login);
			packet.send(pid, RELIABLE);
		playerjoin.close();
	} else {
			packet.writeUInt8(packets.register);
			packet.send(pid, RELIABLE);
		classes[0].func(pid);
		Players[pid].clss = 0;
			setPlayerPosition(pid, classes[0].spawn[0], classes[0].spawn[1], classes[0].spawn[2]); 
	}

	spawnPlayer(pid);
	Players[pid].logged = true;
	sendMessageToPlayer(pid, 0, 196, 255, "Witaj, " + getPlayerName(pid) + " na serwerze " + SERVER_NAME + ".");
}

function savePlayer(pid){
	local playerleave = io.file("database/players/" + getPlayerName(pid), "w+");
	if(playerleave.isOpen){
		playerleave.write(getPlayerSerial(pid) + "\n");
	local pclass = Players[pid].clss;
		playerleave.write(pclass + "\n");
	local pvis = getPlayerVisual(pid);
		playerleave.write(pvis.bodyModel + " " + pvis.bodyTxt + " " + pvis.headModel + " " + pvis.headTxt + "\n");
	local ppos = getPlayerPosition(pid);
	local pposa = getPlayerAngle(pid);
		playerleave.write(ppos.x + " " + ppos.y + " " + ppos.z + " " + pposa);
		playerleave.close();
	} else
	print(playerleave.errorMsg);

	unspawnPlayer(pid);
	Players[pid].logged = false;
}

// ======================================================= //

addEventHandler("onPlayerDead", function(pid, kid){
	unspawnPlayer(pid);
	setPlayerRespawnTime(pid, 2000);
});

addEventHandler("onPlayerRespawn", function(pid){
	spawnPlayer(pid);
	local clss = Players[pid].clss;
		classes[clss].func(pid);
		setPlayerPosition(pid, classes[clss].spawn[0], classes[clss].spawn[1], classes[clss].spawn[2]);
	local vis = Players[pid].vis;
		setPlayerVisual(pid, vis[0], vis[1], vis[2], vis[3]);
});

// ======================================================= //

//local pos_counter = 0;
addEventHandler("onPacket", function(pid, packet){
	local packetId = packet.readUInt8();
	if(packetId == packets.visual){
		local visHM = packet.readString();
		local visHT = packet.readUInt8();
		local visBM = packet.readString();
		local visBT = packet.readUInt8();
				setPlayerVisual(pid, visHM, visHT, visBM, visBT);
			Players[pid].vis = [visHM, visHT, visBM, visBT];
	}
	/*else if(packetId == packets.pos){
		if(!checkPermission(pid, LEVEL.MOD)) return;

		local pos = getPlayerPosition(pid);
		local angle = getPlayerAngle(pid);
		
		saveLog("pos.log", pos_counter + " -> " + pos.x + ", " + pos.y + ", " + pos.z + ", " + angle);
		print(pos_counter + " -> " + pos.x + ", " + pos.y + ", " + pos.z + ", " + angle);
	
		pos_counter++;
	}*/
});

// ======================================================= //

addEventHandler("onPlayerChangeWorld", function(pid, world){
	if(Players[pid].logged != false){
		if(world != getServerWorld())
			setPlayerWorld(pid, getServerWorld());
			setPlayerPosition(pid, 38601.9140625, 3911.5217285156, -1280.5793457031);
	}
});