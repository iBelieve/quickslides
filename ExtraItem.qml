import QtQuick 2.0

Rectangle {
    //----- STYLE PROPERTIES -----//
    property string style: "default"

    anchors.fill: parent

    property color background: getBackgroundColor(style)


    function getBackgroundColor(style) {
        return Qt.rgba(0.9,0.9,0.9,0.1)
    }

    property color borderColor: getBorderColor(style)

    function getBorderColor(style) {
        if (style === "default")
            return Qt.rgba(0,0,0,0.2)
        else {
            var color = Qt.darker(background, 1)  // Used to clone the color
            color.a = 0.4
            return color
        }
    }

    radius: units.gu(1)

    color: background
    border.color: borderColor

    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }

    Behavior on color {
        ColorAnimation { duration: 200 }
    }
}
