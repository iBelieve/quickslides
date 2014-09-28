import QtQuick 2.3

Presentation {

    TitleSlide {
        title: "Ubuntu App Development"
        subTitle: "What Ubuntu Is, Developing for Ubuntu, And What I've Worked On"

        notes: "Good evening. My name is Michael Spencer, and I’ve been interested in software engineering ever since I first learned to program for a Calculus course about 5 years ago.

Software development is a facinating subject since you get to build an app, watch in come together, and then publish it and earn money from it. And if you do it well, you can earn a lot of money. Flappy bird, a iOS app was recently the top app and earned its developer $50,000 a day.

I’ve worked with over dozen or so different programming languages and technologies for Ubuntu, Mac, Windows, Android, and iOS. Today I’m going to be talking about App Development for Ubuntu Touch, including what Ubuntu is, developing for Ubuntu, and also some of the projects I’ve worked on.
"

        Column {
            anchors {
                left: parent.left
                top: parent.top
                margins: units.scale(1.5)
            }

            Label {
                text: "Michael Spencer"
                color: "#555"
                font.bold: true
                font.pixelSize: units.scale(2)
            }

            Label {
                text: "Software Engineer"
                color: "#555"
                font.pixelSize: units.scale(1.6)
            }
        }
    }

    Slide {
        title: "So... what is Ubuntu?"
        icon: "images/ubuntu-logo.png"

        content: [
            "Ubuntu is the powerful open-source operating system from Canonical",
            "Ubuntu Touch is the new vision for Ubuntu",
            "Focus on \"convergence\""
        ]

        extra: ImageItem {
            showShadow: false
            source: "images/ubuntu-devices.png"
        }

        notes: "Ok, so most if not all of you are probably wonder what Ubuntu even is. Ubuntu is an operating system, just like Mac OS or Windows, developed by a UK-based company named Canonical. There are many unique and awesome things about Ubuntu, but probably the biggest thing about it is that is open-source. What that means is that the entire source code that makes up the OS is public and available for anyone to look and even to make there own operating systems based on Ubuntu.

Last year, Mark Shuttleworth, the founder of Ubuntu and Canonical, announced a new version of Ubuntu known as Ubuntu Touch. The initial focus is for Touch based devices like phones and tablets, but within the next couple years, Canonical plans to merge Ubuntu Touch with the current version of Ubuntu to provide what is known as “convergence”

Wait - what is convergence? Convergence is the concept of having the same operating system run on all sorts of different devices, including traditional desktops and laptops, but also on phones and tablets.

Here’s a picture of what that will be like. The biggest thing about this is that for the user, they will be able to get the same apps on TVs, PCs, tablets, and phones. Now that’s awesome. Right now, my iPhone has lots of apps that my Ubuntu and Mac computers don’t have, simply because mobile devices have a higher market. But with convergence, I’ll be able to get the same apps on my laptop that I can get on my Ubuntu phone."
    }

    Slide {
        title: "Why Develop for Ubuntu?"
        icon: "images/ubuntu-logo.png"

        content: [
            "Cheaper to get started - no heavy fees",
            "Less competition",
            "Target phones, tablets, computers, and TVs with one codebase",
            "Ubuntu is a very open platform",
            "Access to all the source code"
        ]

        extra: ImageItem {
            showShadow: false
            source: "images/showdown.png"
        }

        notes: "Apple costs $100/year - many developers never break even

Instead of having to write separate apps for phones, tablets, and computers, and have to keep all the code matching, developers targeting Ubuntu can write one app that will work on any phone, tablet or computer running Ubuntu. I’ve worked with matching Android and iOS apps, and it is very confusing having to keep each app matching the other app

Ubuntu is a very open platform compared to other platforms. For example, to develop an iOS app, you must sign up with an expensive Apple developer account and get all sorts of certificates and such to get your app properly signed and distributed. On ubuntu, it is very simple. Just create a free developer account, package your app with a couple simple steps, and upload the resulting app to the app store. Done, easy as that!

Access to all the source code - several times Ubuntu hasn’t provided exactly what I need, so I’ve been able to go in and look at the code and copy out what I use and then make the changes so it works the way I need it to."
    }

    Slide {
        id: sdkSlide
        title: "The Ubuntu SDK"
        icon: "images/ubuntu-sdk.png"
        oneAtATime: true

        content: [
            "The Ubuntu SDK is the toolkit for developing for Ubuntu",
            "Based on a QtQuick, a declarative programming language",
            "Layouts based on anchors",
            "Property bindings"
        ]

        extra: ExtraItem {
            visible: sdkSlide.index == 2
            Image {
                id: icon1
                anchors {
                    left: parent.left
                    top: parent.top

                    margins: units.scale(2)
                }

                mipmap: true
                source: "images/ubuntu-logo.png"
                height: width

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    NumberAnimation {
                        target: icon1
                        property: "width"
                        from: units.scale(3)
                        to: units.scale(6)
                        duration: 1000
                    }

                    NumberAnimation {
                        target: icon1
                        property: "width"
                        from: units.scale(6)
                        to: units.scale(3)
                        duration: 1000
                    }
                }
            }

            Label {
                x: units.scale(6)
                y: units.scale(2)
                text: "Absolute positioning example"
            }

            Label {
                anchors {
                    left: parent.left
                    top: parent.top
                    topMargin: units.scale(9)

                    margins: units.scale(2)
                }
                text: "Label {\n    x: 48\n    y: 16\n}"
                font.pixelSize: units.scale(1.6)
                color: "#555"
            }

            Image {
                id: icon2
                anchors {
                    left: parent.left
                    top: parent.top
                    topMargin: units.scale(20)

                    margins: units.scale(2)
                }

                mipmap: true
                source: "images/ubuntu-logo.png"
                height: width

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    NumberAnimation {
                        target: icon2
                        property: "width"
                        from: units.scale(3)
                        to: units.scale(6)
                        duration: 1000
                    }

                    NumberAnimation {
                        target: icon2
                        property: "width"
                        from: units.scale(6)
                        to: units.scale(3)
                        duration: 1000
                    }
                }
            }

            Label {
                anchors.verticalCenter: icon2.verticalCenter
                anchors.left: icon2.right
                anchors.margins: units.scale(2)
                text: "Anchoring example"
            }

            Label {
                anchors {
                    left: parent.left
                    top: parent.top
                    topMargin: units.scale(27)

                    margins: units.scale(2)
                }
                text: "Label {\n    anchors.left: image.right\n    anchors.verticalCenter: image.verticalCenter\n}"
                font.pixelSize: units.scale(1.6)
                color: "#555"
            }
        }
    }

    Slide {
        title: "Ubuntu Core Apps"
        icon: "images/files-icon.png"
        content: [
            "Community-developed apps for Ubuntu",
            "I started contributing last June",
            "I worked as the one of the two lead UI developers for the File Manager",
            "I've fixed bugs, added new features, and handled feedback on social media"
        ]
        extra: ImageItem {
            source: "images/filemanager.png"
        }
    }

    Slide {
        id: appsSlide
        title: "Apps I've Developed"
        oneAtATime: true
        content: [
            "Project Dashboard",
            "Taskly",
            "uBible",
            "Weather Desktop",
            "Weekly Planner"
        ]

        extra: ImageSet {
            index: appsSlide.index
            showShadow: index >= 3
            sources: [
                "images/taskly-phone.png",
                "images/taskly-phone.png",
                "images/ubible-phone.png",
                "images/weather-desktop.png",
                "images/weekly-planner.png"
            ]
        }
    }

    Slide {
        title: "Project Dashboard"
        content: [
            "Manages your projects in one convenient app",
            "Winner of the 2014 Ubuntu App Showdown competition",
            "Runs on phone and PC",
            "Upcoming Features",
            " Porting to Mac and Windows",
            " Pro account subscriptions"
        ]
    }

    Slide {
        title: "Sonrise Software"
        content: [
            "My business developing and selling apps",
            "Named because Christ is Risen, and He is the foundation of my life",
            "Develop apps for Ubuntu and other OSes",
            "Website is <a href=\"www.sonrisesoftware.com\">www.sonrisesoftware.com</a>"
        ]

        extra: ImageItem {
            source: Qt.resolvedUrl("images/website.png")
        }
    }

    Slide {
        title: "Summary"
        content: [
            "Ubuntu is a powerful open-source operating system by Canonical",
            "Developing for Ubuntu is easy, exciting, and has a lot of potential",
            "Things I've worked on",
            " Developed several different apps",
            " Won 1st place in the 2014 Ubuntu App Showdown",
            " Run my own business developing and selling apps"
        ]
    }

    Image {
        source: Qt.resolvedUrl("images/logo.png")
        width: units.scale(20)
        height: width * sourceSize.height/sourceSize.width
        mipmap: true
        anchors {
            right: parent.right
            top: parent.top
            margins: units.scale(1.5)
        }
    }
}

