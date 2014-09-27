import QtQuick 2.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

Window {
    id: root

    width: initialWidth
    height: initialHeight

    title: "Presentation"

    default property alias contents: screen.children

    readonly property int initialWidth: units.gu(100)
    readonly property int initialHeight: 9/16 * initialWidth

    readonly property real scaleFactor: Math.min(width/initialWidth, height/initialHeight)

    readonly property alias units: _units

    readonly property int slideWidth: initialWidth * scaleFactor
    readonly property int slideHeight: initialHeight * scaleFactor

    property var slides
    property int currentSlide
    property real progress: (currentSlide + 1)/slides.length

    property color textColor: "#555"
    property color titleColor: "#555"
    property color linkColor: "#428bca"

    QtObject {
        id: _units

        function gu(units) {
            if (units === "xx-large")
                units = 5.5
            if (units === "x-large")
                units = 4
            if (units === "large")
                units = 3.5
            else if (units === "medium")
                units = 2

            return units * 8
        }

        function scale(units) {
            units = gu(units)

            return units * scaleFactor
        }
    }

    function switchSlides(from, to, forward) {
        from.showing = false
        to.showing = true
        return true
    }

    function goToNextSlide() {
        if (root.currentSlide + 1 < root.slides.length) {
            var from = slides[currentSlide]
            var to = slides[currentSlide + 1]
            if (switchSlides(from, to, true)) {
                currentSlide = currentSlide + 1;
                content.focus = true;
            }
        }
    }

    function goToPreviousSlide() {
        if (root.currentSlide - 1 >= 0) {
            var from = slides[currentSlide]
            var to = slides[currentSlide - 1]
           if (switchSlides(from, to, false)) {
                currentSlide = currentSlide - 1;
               content.focus = true;
           }
        }
    }

    NotesWindow {
        Component.onCompleted: show()
    }

    Rectangle {
        id: content
        focus: true

        anchors.fill: parent

        Component.onCompleted: {
            var slideCount = 0;
            var slides = [];
            for (var i=0; i<screen.children.length; ++i) {
                var r = screen.children[i];
                if (r.isSlide) {
                    slides.push(r);
                }
            }

            root.slides = slides;
            print(slides.length)

            // Make first slide visible...
            if (root.slides.length > 0) {
                root.currentSlide = 0;
                root.slides[root.currentSlide].showing = true;
            }
        }

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

        color: "gray"

        RectangularGlow {
            id: glowEffect

            opacity: 0.3 * screen.opacity
            anchors.fill: screen
            glowRadius: units.gu(1)
            //cornerRadius: 0
            color: "black"
        }

        Rectangle {
            id: screen

            width: slideWidth
            height: slideHeight
            anchors.centerIn: parent

            Rectangle {
                height: units.scale(0.25)
                anchors.bottom: parent.bottom
                color: "#5cb85c"
                width: parent.width * progress

                Behavior on width {
                    NumberAnimation { duration: 600 }
                }
            }
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
        }
    }
}
