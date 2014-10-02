import QtQuick 2.0
import QtQuick.Window 2.0
import "quartz-ui"
import "quartz-ui/ListItems" as ListItem

Rectangle {
    id: widget
    height: units.gu(6)
    anchors {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
        bottomMargin: show || popover.showing ? 0 : -height

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

        Button {
            iconName: "list"
            selected: popover.showing
            onClicked: popover.open(caller)
        }
    }

    Label {
        anchors.centerIn: parent
        text: "Slide " + (currentSlide + 1) + " of " + slides.length
        font.pixelSize: units.gu(2.2)
        color: "#666"
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

    ListPopover {
        id: popover

        width: units.gu(32)

        model: slides
        delegate: ListItem.Standard {
            showDivider: false
            height: units.gu(3)
            highlightable: true
            text: index == 0 ? "<b>%1</b>".arg(modelData.title) : modelData.title
            onClicked: {
                popover.close()
                goToSlide(index)
            }

            Icon {
                name: "check-circle"
                visible: index == currentSlide
                color: "#888"
                anchors {
                    right: parent.right
                    rightMargin: units.gu(1.5)
                    verticalCenter: parent.verticalCenter
                }

                size: units.gu(2)
            }
        }
    }
}
