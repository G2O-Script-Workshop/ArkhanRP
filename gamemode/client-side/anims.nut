choiceAnimation <- false;

gridAnim <- GUI.GridList(0, 2440, 1800, 4800, "MENU_INGAME.TGA", "INV_SLOT.TGA", "INV_TITEL.TGA", "O.TGA", "U.TGA")
gridAnim.setMarginPx(35,35,35,35)

animNameColumn <- gridAnim.addColumn("***", anx(280), Align.Center)
animNameColumn.draw.setColor(145, 175, 205)

foreach(anim in anims){
	gridAnim.addRow(anim.name)
}

function animationPanel(toggle){
	choiceAnimation = toggle;

	setCursorVisible(toggle);
	setFreeze(toggle);
	gridAnim.setVisible(toggle);
	Camera.enableMovement(!toggle);
	Camera.modeChangeEnabled = !toggle;
}

addEventHandler("GUI.onClick", function(self){
	if(!choiceAnimation)
		return;

	if (!(self instanceof GUI.GridListCell))
		return;

	playAni(heroId, anims[self.parent.id].inst);
});

addEventHandler("GUI.onMouseIn", function(self){
	if(!choiceAnimation)
		return;

	if (!(self instanceof GUI.GridListCell))
		return;

  self.setColor(255, 0, 0);
	self.setFile("Menu_Choice_Back.TGA");
});

addEventHandler("GUI.onMouseOut", function(self){
	if(!choiceAnimation)
		return;

	if (!(self instanceof GUI.GridListCell))
		return;

	self.setColor(255, 255, 255);
	self.setFile("");
});

addEventHandler("onKey", function(key){
	if(key == KEY_F10)
		animationPanel(!choiceAnimation)
});
