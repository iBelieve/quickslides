import QtQuick 2.0

Text {
    property string fontSize: "medium"

    font.pixelSize: units.scale(fontSize)
    font.family: "Ubuntu"
}
