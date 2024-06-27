local activeWindow = null

class GUI.Window extends classes(GUI.Texture, GUI.Collection)
{
    static windowsList = []
	static m_cursorOffset = {x = 0, y = 0}

#public:
	constructor(x, y, w, h, texture, textureAlign = null, enabled = false)
	{
		GUI.Collection.constructor.call(this, x, y)
		GUI.Texture.constructor.call(this, x, y, w, h, texture)

		if (!enabled)
			setDisabled(true)

		windowsList.append(this)
	}

	function destroy()
	{
		foreach (index, window in windowsList)
		{
			if (window == this)
			{
				windowsList.remove(index)
				break
			}
		}

		GUI.Texture.destroy.call(this)
	}

	function isMouseAt()
	{
		foreach(item in childs)
		{
			if (item.pointer.isMouseAt())
				return false
		}

		return base.isMouseAt()
	}

	function top()
	{
		GUI.Texture.top.call(this)
		GUI.Collection.top.call(this)
	}

	function setVisible(visible, affectChilds = true)
	{
		GUI.Texture.setVisible.call(this, visible)

		if (affectChilds)
			GUI.Collection.setVisible.call(this, visible)
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function setPositionPx(x, y)
	{
		GUI.Texture.setPositionPx.call(this, x, y)
		GUI.Collection.setPositionPx.call(this, x, y)
	}

	function setColor(r, g, b, affectChilds = false)
	{
		base.setColor(r, g, b)

		if (affectChilds)
		{
			foreach(item in childs)
				item.pointer.setColor(r, g, b)
		}
	}

	function setAlpha(alpha, affectChilds = false)
	{
		base.setAlpha(alpha)

		if (affectChilds)
		{
			foreach(item in childs)
				item.pointer.setAlpha(alpha)
		}
	}

	static function hideAll()
	{
		foreach(window in GUI.Window.windowsList)
		{
			if(window.isVisible())
				window.setVisible(false)
		}
	}

	static function isOpen()
	{
		foreach(window in GUI.Window.windowList)
		{
			if(window.isVisible())
				return true
		}

		return false
	}

	static function onMouseMove(cursorX, cursorY, oldCursorX, oldCursorY)
	{
		if (!activeWindow)
			return

		local cursorPosition = getCursorPositionPx()
		activeWindow.setPositionPx(cursorPosition.x + activeWindow.m_cursorOffset.x, cursorPosition.y + activeWindow.m_cursorOffset.y)
	}

	static function onMouseDown(self, button)
	{
		if (button != MOUSE_LMB)
			return

		if (!(self instanceof GUI.Window))
			return

		local cursorPosition = getCursorPositionPx()
		local position = self.getPositionPx()

		self.m_cursorOffset.x = position.x - cursorPosition.x
		self.m_cursorOffset.y = position.y - cursorPosition.y

		activeWindow = self
	}

	static function onMouseUp(self, button)
	{
		if (button != MOUSE_LMB)
			return

		if (!activeWindow)
			return

		activeWindow = null
	}
}

addEventHandler("onMouseMove", GUI.Window.onMouseMove)
addEventHandler("GUI.onMouseDown", GUI.Window.onMouseDown)
addEventHandler("GUI.onMouseUp", GUI.Window.onMouseUp)
