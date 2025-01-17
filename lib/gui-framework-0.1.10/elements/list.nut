// TO DO: add getters & setters to GUI.ListRow, to allow auto upate the property when row is displayed on list
// TO DO: add alignment + offset support for list?

class GUI.ListRow
{
#public:
	parent = null
	id = -1

#protected:
	m_value = null
	
	m_color = null
	m_alpha = 255

	constructor(parent, id, value)
	{
		this.parent = parent
		this.id = id

		m_value = value
		m_color = {r = 255, g = 255, b = 255}
	}

	function getValue()
	{
		return m_value
	}

	function setValue(value)
	{
		m_value = value

		if (parent.isRowInVisibleRange(id))
			parent.updateVisibleRow(parent.getVisibleRowIdx(id))
	}

	function getColor()
	{
		return m_color
	}

	function setColor(r, g, b)
	{
		m_color.r = r
		m_color.g = g
		m_color.b = b

		if (parent.isRowInVisibleRange(id))
			parent.updateVisibleRow(parent.getVisibleRowIdx(id))
	}

	function getAlpha()
	{
		return m_alpha
	}

	function setAlpha(alpha)
	{
		m_alpha = alpha

		if (parent.isRowInVisibleRange(id))
			parent.updateVisibleRow(parent.getVisibleRowIdx(id))
	}
}

class GUI.VisibleListRow extends GUI.Button
{
	id = -1
}

class GUI.List extends classes(GUI.Texture, GUI.Margin)
{
#private:
	m_visibleRows = null
	m_visibleRowsCount = 0

	m_font = "FONT_OLD_10_WHITE_HI.TGA"
	m_rowHeightPx = 0

#public:
	rows = null
	scrollbar = null

	constructor(x, y, w, h, bodyBg, scrollBg, scrollIndicator, scrollIncreaseBtn, scrollDecreaseBtn, window = null)
	{
		m_visibleRows = []
		rows = []

		local scrollbarWidth = anx(SCROLLBAR_SIZE)
		scrollbar = GUI.ScrollBar(x + w - scrollbarWidth, y, scrollbarWidth, h, scrollBg, scrollIndicator, scrollIncreaseBtn, scrollDecreaseBtn, Orientation.Vertical)
		scrollbar.parent = this
		scrollbar.setMaximum(0)

		GUI.Margin.constructor.call(this)
		base.constructor(x, y, w, h, bodyBg, window)

		local oldFont = textGetFont()

		textSetFont(m_font)
		m_rowHeightPx = letterHeightPx()
		local rowHeight = anx(m_rowHeightPx)
		textSetFont(oldFont)

		for (local i = 0, end = getMaximumVisibleRows(); i < end; ++i)
			m_visibleRows.push(getVisibleRow(i))
	}

	function setPositionPx(x, y)
	{
		scrollbar.setPositionPx(x + getSizePx().width - scrollbar.getSizePx().width, y)
		base.setPositionPx(x, y)

		updateVisibleRows(m_visible)
	}

	function setPosition(x, y)
	{
		setPositionPx(nax(x), nay(y))
	}

	function setSizePx(width, height)
	{
		local position = getPositionPx()
		local size = getSizePx()

		scrollbar.setPositionPx(position.x + width - scrollbar.getSizePx().width, position.y)
		scrollbar.setSizePx(scrollbar.getSizePx().width, height - scrollbar.decreaseButton.getSizePx().height - scrollbar.increaseButton.getSizePx().height)

		base.setSizePx(width, height)

		updateVisibleRows(m_visible && (size.width != width || size.height != height))
	}

	function setSize(width, height)
	{
		setSizePx(nax(width), nay(height))
	}

	function setVisible(visible)
	{
		base.setVisible(visible)
		scrollbar.setVisible(visible)

		updateVisibleRows()
	}

	function setMarginPx(top, right, bottom, left)
	{
		local isMarginChanged = (
			   m_marginPx.top != top 
			|| m_marginPx.right != right
			|| m_marginPx.bottom != bottom
			|| m_marginPx.left != left
		)

		GUI.Margin.setMarginPx.call(this, top, right, bottom, left)
		updateVisibleRows(m_visible && isMarginChanged)
	}

	function setMargin(top, right, bottom, left)
	{
		setMarginPx(nay(top), nax(right), nay(bottom), nax(left))
	}

	function getFont()
	{
		return m_font
	}

	function setFont(font)
	{
		m_font = font

		local oldFont = textGetFont()

		textSetFont(m_font)
		setRowHeightPx(letterHeightPx())
		textSetFont(oldFont)	
	}

	function getRowHeightPx()
	{
		return m_rowHeightPx
	}

	function setRowHeightPx(rowHeight)
	{
		local isRowHeightChanged = (m_rowHeightPx != rowHeight)

		m_rowHeightPx = rowHeight
		updateVisibleRows(m_visible && isRowHeightChanged)
	}

	function getRowHeight()
	{
		return any(m_rowHeightPx)
	}

	function setRowHeight(rowHeight)
	{
		setRowHeightPx(nay(rowHeight))
	}

	function insertRow(rowId, value)
	{
		rows.insert(rowId, GUI.ListRow(this, rowId, value))

		for (local i = rowId + 1, end = rows.len(); i < end; ++i)
			++rows[i].id

		updateVisibleRows(m_visible && isRowInVisibleRange(rowId))
	}

	function addRow(value)
	{
		insertRow(rows.len(), value)
	}

	function removeRow(rowId)
	{
		rows.remove(rowId)

		for (local i = rowId, end = rows.len(); i < end; ++i)
			--rows[i].id

		updateVisibleRows(m_visible && isRowInVisibleRange(rowId))
	}

	function clear()
	{
		rows.clear()

		foreach(row in m_visibleRows)
			row.setVisible(false)

		m_visibleRowsCount = 0
		scrollbar.setMaximum(0)
	}

	function sort(func)
	{
		rows.sort(func)
		updateVisibleRows(m_visible)
	}

	function getVisibleRowsCount()
	{
		return m_visibleRowsCount	
	}

	function getCurrentVisibleRowsCount()
	{
		local maximumVisibleRows = getMaximumVisibleRows()
		local rowsLen = rows.len()

		if (rowsLen < maximumVisibleRows)
			return rowsLen

		return maximumVisibleRows
	}

	function getMaximumVisibleRows()
	{
		if (m_rowHeightPx == 0)
        	return 0

		return (getSizePx().height - m_marginPx.top - m_marginPx.bottom) / m_rowHeightPx
	}

	function getVisibleRowIdx(position)
	{
		return position - scrollbar.getValue()
	}

	function isRowInVisibleRange(rowId)
	{
		local currentPosition = scrollbar.getValue()
		local endPosition = currentPosition + getCurrentVisibleRowsCount()

		return rowId >= currentPosition && rowId < endPosition
	}

	function getVisibleRow(visibleRowId)
	{
		return (visibleRowId < m_visibleRows.len())
			? m_visibleRows[visibleRowId]
			: GUI.VisibleListRow(0, 0, 0, 0, "", "")
	}

	function updateVisibleRow(visibleRowId)
	{
		local position = getPositionPx()

		local rowId = visibleRowId + scrollbar.getValue()
		local row = rows[rowId]

		local visibleRow = m_visibleRows[visibleRowId]

		visibleRow.id = rowId

		visibleRow.setText(row.m_value)
		visibleRow.draw.setFont(m_font)

		visibleRow.draw.setColor(row.m_color.r, row.m_color.g, row.m_color.b)
		visibleRow.setAlpha(row.m_alpha)

		visibleRow.setPositionPx(position.x + m_marginPx.left, position.y + m_marginPx.top + visibleRowId * m_rowHeightPx)
		visibleRow.setSizePx(getSizePx().width - m_marginPx.left - m_marginPx.right - scrollbar.getSizePx().width, m_rowHeightPx)
	}

	function updateVisibleRows(updateRows = true)
	{
		local oldMaximumVisibleRows = m_visibleRowsCount
		local rowsLen = rows.len()

		m_visibleRowsCount = getCurrentVisibleRowsCount()

		local position = getPosition()
		local width = getSizePx().width

		local rowHeight = any(m_rowHeightPx)

		local scrollbarWidth = scrollbar.getSize().width
		local scrollbarValue = scrollbar.getValue()

		// insert loop
		for (local i = oldMaximumVisibleRows; i < m_visibleRowsCount; ++i)
		{
			local row = getVisibleRow(i)

			if (i >= m_visibleRows.len())
				m_visibleRows.push(row)

			if (m_visible && rowsLen > i)
				row.setVisible(true)
		}

		// remove loop
		for (local i = oldMaximumVisibleRows - 1; i >= m_visibleRowsCount; --i)
		{
			local row = m_visibleRows[i]

			if (m_visible && row.getVisible())
				row.setVisible(false)
		}

		// update scrollbar value & max
		local scrollbarMaximum = rowsLen - m_visibleRowsCount
		scrollbar.setMaximum(scrollbarMaximum)

		if (scrollbar.getValue() > scrollbarMaximum)
			scrollbar.setValue(scrollbarMaximum)

		// update loop
		if (updateRows)
		{
			for (local i = 0; i < m_visibleRowsCount; ++i)
			{
				m_visibleRows[i].setVisible(m_visible)
				updateVisibleRow(i)
			}
		}
	}

	static function onChange(self)
	{
		if (!(self instanceof GUI.ScrollBar))
			return

		local list = self.parent

		if (!(list instanceof this))
			return

		list.updateVisibleRows(list.m_visible)
	}
}

addEventHandler("GUI.onChange", GUI.List.onChange.bindenv(GUI.List))