import QtQuick 2.0
import QtQuick.Window 2.0
import "quartz-ui"

Rectangle {
    id: widget
    height: units.gu(6)
    anchors {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
        bottomMargin: show ? 0 : -height

        Behavior on bottomMargin {
            NumberAnimation { duration: 200 }
        }
    }

    property bool show

    color: "#eee"

    Rectangle {
        width: parent.width
        height: units.gu(0.1)
        color: "#ccc"
    }

    Row {
        anchors.fill: parent
        anchors.margins: units.gu(1)

        spacing: units.gu(1)

        Button {
            iconName: "chevron-left"
        }

        Button {
            iconName: "chevron-right"
        }
    }

    Row {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: units.gu(1)
        }

        spacing: units.gu(1)

        Button {
            text: root.visibility == Window.FullScreen ? "Leave Fullscreen" : "Fullscreen"
            onClicked: {
                if (root.visibility == Window.FullScreen)
                    root.visibility = Window.Maximized
                else
                    root.visibility = Window.FullScreen
            }
        }
    }
}
