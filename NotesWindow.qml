import QtQuick 2.0
import QtQuick.Window 2.0
import "quartz-ui"

Window {
    title: "Presentation Notes"
    width: units.gu(80)
    height: units.gu(50)

    property date startTime
    property date now

    property string timeString: friendlyDuration(new Date(now) - new Date(startTime))
    property string estimatedTotalString: friendlyDuration(totalTime)
    property real totalTime: (new Date(now) - new Date(startTime))/progress

    Component.onCompleted: {

    }

    function start() {
        startTime = new Date()
        now = new Date()
        timer.start()
    }

    Timer {
        id: timer
        interval: 1000
        onTriggered: {
            now = new Date()
        }
        repeat: true
    }

    Label {
        id: titleLabel
        anchors {
            left: parent.left
            top: parent.top

            margins: units.gu(2)
        }

        font.pixelSize: units.gu(2.5)
        text: slides[currentSlide].title
        color: "#444"
    }

    Label {
        anchors {
            right: parent.right
            top: parent.top

            margins: units.gu(2)
        }

        font.pixelSize: units.gu(2.5)
        color: "#555"
        text: (currentSlide + 1) + "/" + slides.length
    }

    Label {
        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: footer.top
            margins: units.gu(2)
        }

        font.pixelSize: units.gu(2.3)
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        elide: Text.ElideRight
        text: slides[currentSlide].notes
        color: "#666"
    }

    Label {
        id: footer
        anchors {
            right: parent.right
            bottom: parent.bottom

            margins: units.gu(2)
        }

        font.pixelSize: units.gu(2.5)
        color: "#555"
        text: timer.running ? "Time: " + timeString + "    Estimated total: " + estimatedTotalString : ""
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton)
                goToPreviousSlide()
            else
                goToNextSlide()
        }
        onPressAndHold: goToPreviousSlide(); //A back mechanism for touch only devices

        focus: true

        Keys.onSpacePressed: goToNextSlide()
        Keys.onRightPressed: goToNextSlide()
        Keys.onDownPressed: goToNextSlide()
        Keys.onLeftPressed: goToPreviousSlide()
        Keys.onUpPressed: goToPreviousSlide()
        Keys.onEscapePressed: Qt.quit()
        Keys.onPressed: {
            if (event.key == Qt.Key_Backspace)
                goToPreviousSlide();
        }
    }

    function friendlyDuration(duration, type) {
        var hours = Math.floor(duration/(1000 * 60 * 60))
        var minutes = Math.floor(duration/(1000 * 60) - 60 * hours)
        var seconds = Math.floor(duration/1000 - 60 * minutes - 60 * 60 * hours)

        if (type === undefined)
            type = '?'

        var str = ''
        if (type === 's' || type === '?')
            str = "%1s".arg(seconds)
        if (type === 's' || type === 'm' || (type === '?' && (minutes >= 1 || hours >= 1)))
            str = "%1m %2".arg(minutes).arg(str)
        if (type === 's' || type === 'm' || type === 'h' || (type === '?' && hours >= 1))
            str = "%1h %2".arg(hours).arg(str)
        return str.trim()
    }

    Button {
        style: timer.running ? "danger" : "success"
        text: timer.running ? "Pause" : "Start"

        onClicked: {
            if (timer.running)
                timer.stop()
            else
                start()
        }

        anchors {
            left: parent.left
            bottom: parent.bottom

            margins: units.gu(2)
        }
    }

    ToolTip {
        id: appToolTip
        z: 3
        //anchors.centerIn: parent
    }
}
