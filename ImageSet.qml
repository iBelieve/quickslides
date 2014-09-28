import QtQuick 2.0

Item {
    anchors.fill: parent

    property var sources: []

    property int index

    onIndexChanged: if (index >= 0) animate.start()

    property bool showShadow

    SequentialAnimation {
        id: animate

        NumberAnimation { target: image; property: "opacity"; duration: 250; to: 0 }

        ScriptAction {
            script: {
                image.showShadow = showShadow
                image.source = sources[index]
            }
        }

        NumberAnimation { target: image; property: "opacity"; duration: 250; to: 1 }
    }

    ImageItem {
        id: image
    }
}
