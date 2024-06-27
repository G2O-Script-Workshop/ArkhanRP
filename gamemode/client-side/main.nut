rpGUI <- {
	collection = GUI.Collection(0,0)
}
local arkhandraw = GUI.Draw(7000, 7800, "ArkhanRP v1.0", rpGUI.collection);
	arkhandraw.setFont("FONT_OLD_20_WHITE.TGA");
	arkhandraw.setColor(150, 200, 200);
local gtimedraw = GUI.Draw(100, 7050, "Czas w grze (00:00)", rpGUI.collection);
local rtimedraw = GUI.Draw(100, 7250, "Czas realny (00:00)", rpGUI.collection);
	gtimedraw.setFont("FONT_OLD_10_WHITE.TGA");
	gtimedraw.setColor(200, 180, 140);
	rtimedraw.setFont("FONT_OLD_10_WHITE.TGA");
	rtimedraw.setColor(200, 180, 140);

// ======================================================= //

addEventHandler("onInit", function(){
	disableKey(KEY_N, true);
	disableKey(KEY_L, true);
	disableKey(KEY_M, true);
	//disableKey(KEY_B, true);
	disableKey(KEY_C, true);
	disableKey(KEY_ESCAPE, true);

	clearMultiplayerMessages();
	setKeyLayout(1);

	enableEvent_Render(true);

	rpGUI.collection.setVisible(true);
	setTimer(function(){
		gtimedraw.setText("Czas w grze (" + format("%02d:%02d", getTime().hour, getTime().min) + ")");
		rtimedraw.setText("Czas realny (" + format("%02d:%02d", date().hour, date().min) + ")");
	}, 4000, 0);
});

// ======================================================= //

addEventHandler("onPacket", function(packet){
	local packetId = packet.readUInt8();
	if(packetId == packets.login){
		Sound(SOUND_LOGIN).play();
	}
	else if(packetId == packets.register){
		Sound(SOUND_REGISTER).play();
	}
	else if(packetId == packets.afk){
		setFreeze(packet.readBool());
	}
	else if(packetId == packets.promote){
		clearInventory();
	}
});

// ======================================================= //

local exitGUI = GUI.Window(anx(760), any(400), anx(400), any(200), "MENU_INGAME.TGA", null, true);
local exittitle = GUI.Draw(anx(140), any(80), "Wyjœæ z gry?", exitGUI);
local exityes = GUI.Button(anx(125), any(120), anx(50), any(25), "INV_SLOT_FOCUS.TGA", "Tak", exitGUI);
local exitno = GUI.Button(anx(225), any(120), anx(50), any(25), "INV_SLOT_FOCUS.TGA", "Nie", exitGUI);

addEventHandler("onKey",function(key){
	if(key == KEY_ESCAPE){
		exitGUI.setVisible(true);
		setCursorVisible(true);
		setFreeze(true);
		Camera.enableMovement(false);
	}
	/*else if(key == KEY_P){
		if(!Chat.visible){
			packet.writeUInt8(packets.pos);
			packet.send(RELIABLE);
		}
	}*/
});

addEventHandler("GUI.onClick", function(self){
	switch (self)
	{
		case exityes:
			exitGame();
			break;

		case exitno:
			setCursorVisible(false);
			exitGUI.setVisible(false);
			setFreeze(false);
			Camera.enableMovement(true);
			break;
	}
});

addEventHandler("GUI.onMouseIn", function(self){
	if(!(self instanceof GUI.Button)) return;

	self.setColor(255, 0, 0);
})

addEventHandler("GUI.onMouseOut", function(self){
	if(!(self instanceof GUI.Button)) return;

	self.setColor(255, 255, 255);
})
