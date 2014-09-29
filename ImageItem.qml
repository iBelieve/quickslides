import QtQuick 2.3
import QtGraphicalEffects 1.0

Item {
    anchors.fill: parent

    property alias source: image.source

    property bool showShadow: true

    RectangularGlow {
        id: glowEffect

        visible: showShadow

        opacity: 0.3
        anchors.fill: image
        glowRadius: units.gu(1)
        //cornerRadius: 0
        color: "black"
    }

    readonly property real scaleFactor: Math.min(width/image.sourceSize.width, height/image.sourceSize.height)


    Image {
        id: image
        anchors.centerIn: parent

        fillMode: Image.PreserveAspectFit
        width: sourceSize.width * scaleFactor
        height: sourceSize.height * scaleFactor

        smooth: true
        antialiasing: true
        mipmap: true
    }
}
