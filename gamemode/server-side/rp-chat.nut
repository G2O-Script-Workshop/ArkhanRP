local CZAT_OOC = function(pid, params){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
				sendMessageToPlayer(i, 64, 178, 225, "(" + getPlayerName(pid) + " || " + pid + ") " + params);
			}
		}
	}
}

local CZAT_ME = function(pid, params){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
				sendMessageToPlayer(i, 232, 116, 8, "#" + getPlayerName(pid) + " " + params + "#");
			}
		}
	}
}

local CZAT_DO = function(pid, params){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
				sendMessageToPlayer(i, 32, 225, 127, "(" + getPlayerName(pid) + ") #" + params + "#");
			}
		}
	}
}

local CZAT_K = function(pid, params){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 2300){
				sendMessageToPlayer(i, 200, 32, 32, getPlayerName(pid) + " krzyczy " + params);
			}else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 2301 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 3000){
				sendMessageToPlayer(i, 127, 32, 32, "Ktoœ krzyczy " + params);
			}
		}
	}
}

local CZAT_SZ = function(pid, params){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 500){
				sendMessageToPlayer(i, 200, 200, 200, getPlayerName(pid) + " szepcze " + params);
			}else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 501 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 700){
				sendMessageToPlayer(i, 127, 127, 127, "Ktoœ szepcze " + params);
			}
		}
	}
}

local CZAT_PW = function(pid, params){
	local par = sscanf("ds", params);
	if(par){
		if(isPlayerConnected(par[0])){
			sendMessageToPlayer(par[0], 244, 144, 24, "(PW) (" + getPlayerName(pid) + "|"+pid+") << " + par[1]);
			sendMessageToPlayer(pid, 224, 144, 64, "(PW) (" + getPlayerName(par[0]) + "|"+par[0]+") >> " + par[1]);
		}
	}
}

local CZAT_IC = function(pid, text){
	local send = getPlayerPosition(pid);
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local pos = getPlayerPosition(i);
			if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1300){
				sendMessageToPlayer(i, 255, 255, 255, getPlayerName(pid) + " mówi " + text);
			}else if(getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) >= 1301 && getDistance3d(send.x, send.y, send.z, pos.x, pos.y, pos.z) <= 1500){
				sendMessageToPlayer(i, 127, 127, 127, "Ktoœ mówi " + text);
			}
		}
	}
}

local CZAT_GOOC = function(pid, params){
	if(!checkPermission(pid, LEVEL.LEADER)) return;

	sendMessageToAll(64, 148, 255, "(" + getPlayerName(pid) + " || " + pid + ") " + params);
}

local CZAT_GDO = function(pid, params){
	if(!checkPermission(pid, LEVEL.LEADER)) return;

	sendMessageToAll(32, 255, 107, "#" + params + "#");
}

local CZAT_GMSG = function(pid, params){
	for(local i = 0; i < getMaxSlots(); ++i){
		if(isPlayerConnected(i)){
			local from_clss = Players[pid].clss;
			local from_guild = classes[from_clss].guild;
			local to_clss = Players[i].clss;
			local to_guild = classes[to_clss].guild;
			if(from_guild == to_guild){
				sendMessageToPlayer(i, 64, 218, 205, "(" + getPlayerName(pid) + " || " + pid + ") " + params);
			}
		}
	}
}

addEventHandler("onPlayerMessage", function(pid, text){
	strip(text);
		local msgType = text.slice(0, 1);
		local params = text.slice(1);
	if(msgType == "@"){
		CZAT_OOC(pid, params);
	}
	else if(msgType == "#"){
		CZAT_ME(pid, params);
	}
	else if(msgType == "."){
		CZAT_DO(pid, params);
	}
	else if(msgType == ","){
		CZAT_SZ(pid, params);
	}
	else if(msgType == "!"){
		CZAT_K(pid, params);
	}
	else
		CZAT_IC(pid, text);
});

addEventHandler("onPlayerCommand", function(pid, cmd, params){
	cmd = cmd.tolower();
	if(cmd == "pw" || cmd == "pm"){
		CZAT_PW(pid, params);
	}
	else if(cmd == "ooc" || cmd == "b"){
		CZAT_OOC(pid, params);
	}
	else if(cmd == "me" || cmd == "ja"){
		CZAT_ME(pid, params);
	}
	else if(cmd == "do"){
		CZAT_DO(pid, params);
	}
	else if(cmd == "sz"){
		CZAT_SZ(pid, params);
	}
	else if(cmd == "k"){
		CZAT_K(pid, params);
	}
	else if(cmd == "g"){
		CZAT_GOOC(pid, params);
	}
	else if(cmd == "p"){
		CZAT_GDO(pid, params);
	}
	else if(cmd == "gmsg"){
		CZAT_GMSG(pid, params);
	}
	else if(cmd == "chat"){
		sendMessageToPlayer(pid, 150, 100, 0, "-=========== CZAT ===========-");
		sendMessageToPlayer(pid, 150, 70, 0, "/b /ooc @ - OOC");
		sendMessageToPlayer(pid, 150, 70, 0, "/ja /me # - Czynnoœæ");
		sendMessageToPlayer(pid, 150, 70, 0, "/do . - Otoczenie");
		sendMessageToPlayer(pid, 150, 70, 0, "/sz , - Szept");
		sendMessageToPlayer(pid, 150, 70, 0, "/k ! - Krzyk");
		sendMessageToPlayer(pid, 150, 70, 0, "/g - OOC Globalny");
		sendMessageToPlayer(pid, 150, 70, 0, "/p - Œwiat");
		sendMessageToPlayer(pid, 150, 70, 0, "/gmsg - OOC Gildyjny");
		sendMessageToPlayer(pid, 150, 70, 0, "/pw - OOC Prywatny");
		sendMessageToPlayer(pid, 150, 100, 0, "-=========== CZAT ===========-");
	}
});
