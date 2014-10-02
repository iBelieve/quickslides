import QtQuick 2.3
import "quartz-ui"
import "quartz-ui/ListItems" as ListItem

Popover {
    id: popover

    width: Math.max(units.gu(20), Math.min(implicitWidth, childrenRect.width))
    height: column.height + units.gu(2.2)

    property alias model: repeater.model
    property alias delegate: repeater.delegate

    Column {
        id: column
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: units.gu(1)
        }

        Repeater {
            id: repeater
        }
    }
}
