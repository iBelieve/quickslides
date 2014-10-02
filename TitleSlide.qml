import QtQuick 2.0

BaseSlide {

    property string title
    property string subTitle

    property alias titleView: titleView.children

    Column {
        anchors.centerIn: parent
        width: parent.width - units.scale(20)
        spacing: units.scale(3)

        Column {
            id: titleView
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: title
            fontSize: "xx-large"
            color: textColor
            font.bold: true
        }

        Label {
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter

            text: subTitle
            fontSize: "x-large"
            color: "#777"
        }
    }
}
