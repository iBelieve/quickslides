import QtQuick 2.0

BaseSlide {
    id: slide

    property string title
    property var content: []
    property alias extra: extraContent.children

    property int contentWidth: width * 0.5 - units.scale(4)
    property real bulletSpacing: 1

    property alias icon: image.source

    property int count: content.length
    property bool oneAtATime: false
    property bool hasMore: index < count - 1

    property int index: -1

    onTransitionTo: {
        if (!oneAtATime) {
            index = -1
            timer.start()
        }
    }

    onTransitionAway: {
        index = -1
    }

    Timer {
        id: timer
        interval: 250
        repeat: true
        onTriggered: {
            index++
            if (!hasMore)
                timer.stop()
        }
    }

    Row {
        id: titleArea

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: units.scale(4)
        }

        spacing: units.scale(2)

        height: titleLabel.height * 1.5

        Image {
            id: image
            width: height
            height: status == Image.Ready ? titleLabel.height * 1.5 : 0
        }

        Label {
            id: titleLabel
            anchors.verticalCenter: parent.verticalCenter
            text: title
            fontSize: "large"
            font.bold: true
            color: titleColor
        }
    }

    Item {
        id: extraContent
        anchors {
            left: contentColumn.right
            right: parent.right
            top: titleArea.bottom
            bottom: parent.bottom
            margins: units.scale(4)
        }
    }

    Column {
        id: contentColumn
        anchors {
            left: parent.left
            top: titleArea.bottom
            bottom: parent.bottom
            margins: units.scale(4)
        }

        width: slide.contentWidth

        Repeater {
            model: slide.content
            delegate: Row {
                id: row

                function decideIndentLevel(s) { return s.charAt(0) == " " ? 1 + decideIndentLevel(s.substring(1)) : 0 }
                property int indentLevel: decideIndentLevel(content[index])
                property int nextIndentLevel: index < content.length - 1 ? decideIndentLevel(content[index+1]) : 0
                property real indentFactor: (10 - row.indentLevel * 2) / 10;

                height: text.height + (nextIndentLevel == 0 ? 1 : 0.3) * slide.baseFontSize * slide.bulletSpacing
                x: slide.index >= index
                   ? slide.baseFontSize * indentLevel
                   : - slide.contentWidth/2

                opacity: slide.index >= index ? 1 : 0

                Behavior on opacity {
                    NumberAnimation { duration: 500 }
                }

                Behavior on x {
                    NumberAnimation { duration: 500 }
                }

                Rectangle {
                    id: dot
                    y: (baseFontSize * row.indentFactor)/2 - height/3
                    width: baseFontSize * 0.4
                    height: baseFontSize * 0.4
                    color: "#772953"//"#dd4814"
                    radius: width / 2
                    smooth: true
                    opacity: text.text.length == 0 ? 0 : 1
                }

                Rectangle {
                    id: space
                    width: dot.width// * 2
                    height: 1
                    color: "#00ffffff"
                }

                Label {
                    id: text
                    width: slide.contentWidth - (slide.baseFontSize * indentLevel) - dot.width - space.width
                    font.pixelSize: baseFontSize * row.indentFactor
                    text: colorLinks(content[index].substring(row.indentLevel))
                    wrapMode: Text.WordWrap
                    color: index == slide.index && slide.oneAtATime ? "#dd4814" : textColor
                    horizontalAlignment: Text.AlignLeft

                    Behavior on color {
                        ColorAnimation { duration: 500 }
                    }
                }
            }
        }
    }

    function colorLinks(text) {
        return text.replace(/<a(.*?)>(.*?)</g, "<a $1><font color=\"" + linkColor + "\">$2</font><")
    }
}
