import QtQuick 2.0

Item {
    id: slide

    width: slideWidth
    height: slideHeight

    property bool isSlide: true
    property bool showing: false

    property string notes

    opacity: 0

    property int baseFontSize: units.scale(2.5)

    onShowingChanged: {
        if (showing) {
            hideAnimation.stop()
            showAnimation.start()
        } else {
            showAnimation.stop()
            hideAnimation.start()
        }
    }

    ParallelAnimation {
        id: hideAnimation

        NumberAnimation {
            target: slide; property: "opacity";
            duration: 300; from: 1; to: 0
        }

        NumberAnimation {
            target: slide; property: "scale";
            duration: 300; from: 1; to: 0.8
        }
    }

    SequentialAnimation {
        id: showAnimation

        PauseAnimation { duration: 300 }

        ParallelAnimation {
            NumberAnimation {
                target: slide; property: "opacity";
                duration: 300; from: 0; to: 1
            }

            NumberAnimation {
                target: slide; property: "scale";
                duration: 300; from: 0.8; to: 1
            }
        }
    }
}
