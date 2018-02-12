import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.4
import QtWebEngine 1.6

import "qrc:/request.js" as Request


Window {
    visible: true;
    width: 800;
    height: 480;
    color: "#4d5052"
    title: qsTr("Blockland Launcher")
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowTitleHint |
           Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint |
           Qt.MSWindowsFixedSizeDialogHint

    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width

    // Universal.theme: Universal.Dark
    // Universal.accent: Universal.Cobalt

    Pane {
        id: sidePanel_pane
        x: 0
        y: 0
        width: 160
        height: 480

        Rectangle {
            id: sidePanel_background
            x: -12
            y: -12
            width: sidePanel_pane.width
            height: sidePanel_pane.height
            color: "#424246"
        }

        ButtonGroup {
            id: sidePanel_buttonGroup
            exclusive: true
        }

        MetroPanelButton {
            id: sidePanel_button_launcher;
            x: -12;
            y: -12;
            width: sidePanel_pane.width;
            height: 56;

            text: qsTr("Launcher")
            font.family: "MS Shell Dlg 2"
            checked: false
            bgColor: sidePanel_background.color;
            defaultColor: sidePanel_background.color;
            pressedColor: "#59595B";
            hoveredColor: "#535456";

            textColor: "#FFFFFF";
            //textFont: "Segoe WP";
            font.pointSize: 12;

            btnGroup: sidePanel_buttonGroup;
            viewPanel: viewPanel_launcher;
        }

        MetroPanelButton {
            id: sidePanel_button_glass;
            x: -12;
            y: 44;
            width: sidePanel_pane.width;
            height: 56;

            text: qsTr("Blockland Glass");
            //textFont: qsTr("Segoe WP");
            checked: false;
            bgColor: sidePanel_background.color;
            defaultColor: sidePanel_background.color;
            pressedColor: "#59595B";
            hoveredColor: "#535456";

            textColor: "#FFFFFF";
            font.pointSize: 12;

            btnGroup: sidePanel_buttonGroup;
            viewPanel: viewPanel_glass;
        }

        MetroPanelButton {
            id: sidePanel_button_profiles;
            x: -12;
            y: 100
            width: sidePanel_pane.width;
            height: 56;

            text: qsTr("Profiles");

            checked: true
            bgColor: sidePanel_background.color;
            defaultColor: sidePanel_background.color;
            pressedColor: "#59595B";
            hoveredColor: "#535456";

            textColor: "#FFFFFF";
            font.pointSize: 12;

            btnGroup: sidePanel_buttonGroup;
            viewPanel: viewPanel_profiles;
        }
    }

    ViewPanel {
        id: viewPanel_profiles
        x: 160
        y: 0
        width: 640
        height: 480
        visible: true
        z: 1

        Rectangle {
            id: rectangle
            x: 0
            y: 56
            width: 640
            height: 424
            color: "#494a4c"
            z: -1
        }

        Rectangle {
            id: rectangle3
            x: 414
            y: 55
            width: 216
            height: 1
            color: "#575959"
            z: 1
            border.width: 0
            visible: true
        }

        ComboBox {
            id: profilesView_comboBox_profile
            x: 10
            y: 10
            width: 184
            height: 36
            textRole: "key"

            model: ListModel {
                ListElement { key: "Latest Release"; value: "profile_latest" }
            }
        }

        MetroPanelButton {
            id: profilesView_tab_configuration
            x: 404
            y: 16
            width: 118
            height: 40
            text: "Configuration"
            checkable: true
            checked: true
            bgColor: "#494A4C"
            hoveredColor: "#4F5051"
            pressedColor: "#545556"
            defaultColor: "#494A4C"
            highlighted: false

            btnGroup: profilesView_buttonGroup
            viewPanel: profilesView_viewPanel_configuration
        }

        MetroPanelButton {
            id: profilesView_tab_DLLs
            x: 522
            y: 16
            width: 118
            height: 40
            text: "DLLs"
            bgColor: "#494A4C"
            pressedColor: "#545556"
            defaultColor: "#494A4C"
            hoveredColor: "#4F5051"
            highlighted: false

            btnGroup: profilesView_buttonGroup
            viewPanel: profilesView_viewPanel_DLLs
        }

        ViewPanel {
            id: profilesView_viewPanel_configuration
            x: 0
            y: 56
            width: 640
            height: 424

            Text {
                id: text1
                x: 34
                y: 34
                color: "#ffffff"
                text: qsTr("Version: ")
                font.bold: false
                font.pixelSize: 18
            }

            ComboBox {
                id: profilesView_comboBox_version
                x: 110
                y: 27
                width: 184
                height: 36
                textRole: "key"

                model: ListModel {
                    ListElement { key: "Latest Version"; value: "version_latest" }
                }
            }

            CheckBox {
                id: profilesView_checkbox_blocklandLoader
                x: 300
                y: 27
                width: 232
                height: 36
                text: qsTr("Include BlocklandLoader")
                font.pixelSize: 14
                checkState: Qt.Checked
                tristate: false

                contentItem: Text {
                    // height: profilesView_checkbox_blocklandLoader.height
                    color: "#ffffff"
                    text: profilesView_checkbox_blocklandLoader.text
                    font.pixelSize: profilesView_checkbox_blocklandLoader.font.pixelSize
                    // horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: profilesView_checkbox_blocklandLoader.indicator.width +
                                 profilesView_checkbox_blocklandLoader.spacing
                }
            }

            Text {
                id: text2
                x: 34
                y: 90
                width: 58
                color: "#ffffff"
                text: qsTr("Name: ")
                font.bold: false
                font.pixelSize: 18
            }

            TextField {
                id: profilesView_textbox_name
                x: 110
                y: 84
                width: 270
                height: 36
                text: qsTr("")
                font.family: "MS Shell Dlg 2"
                font.pointSize: 12
                color: "#FFFFFF"
                selectByMouse: true

                background: Rectangle {
                    width: profilesView_textbox_name.width
                    height: profilesView_textbox_name.height
                    color: "#424246"
                }
            }

            Text {
                id: text3
                x: 35
                y: 146
                color: "#ffffff"
                text: qsTr("Folder: ")
                font.bold: false
                font.pixelSize: 18
            }

            TextField {
                id: profilesView_textbox_folder
                x: 110
                y: 140
                width: 342
                height: 36
                color: "#ffffff"
                text: qsTr("")
                background: Rectangle {
                    width: profilesView_textbox_folder.width
                    height: profilesView_textbox_folder.height
                    color: "#424246"
                }
                font.family: "MS Shell Dlg 2"
                selectByMouse: true
                font.pointSize: 12
            }

            MetroButton {
                id: profilesView_button_selectFolder
                x: 462
                y: 140
                width: 54
                height: 36
                text: "..."
                pressedColor: "#303233"
                hoveredColor: "#515254"
                textColor: "#FFFFFF"
                defaultColor: "#3A3B3D"
            }

            MetroButton {
                id: profilesView_button_deleteProfile
                x: 490
                y: 370
                width: 132
                height: 36
                text: "Delete Profile"
                pressedColor: "#895252"
                defaultColor: "#9E5D5D"
                hoveredColor: "#AD6B6B"
            }

        }

        ViewPanel {
            id: profilesView_viewPanel_DLLs
            x: 0
            y: 56
            width: 640
            height: 424
            opacity: 0
        }

        ButtonGroup {
            id: profilesView_buttonGroup
            exclusive: true
        }

        MetroButton {
            id: profilesView_button_addProfile
            x: 204
            y: 10
            width: 102
            height: 36
            text: "Add New"
            pressedColor: "#5A9B62"
            defaultColor: "#6BB478"
            hoveredColor: "#81C18B"
        }
    }

    ViewPanel {
        id: viewPanel_glass
        x: 160
        y: 0
        width: 640
        height: 480
        opacity: 0

        Rectangle {
            id: webViewer_glass_container
            x: 0
            y: 0
            width: 640
            height: 400
            color: "#4d5052"
            opacity: 1
            border.width: 0

            Text {
                id: webViewer_glass_loadingText
                x: 286
                y: 193
                width: 139
                height: 20
                color: "#ffffff"
                text: qsTr("Loading...")
                visible: this.opacity > 0.0
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                Behavior on opacity {
                    NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 500
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.OutQuint
                    }
                }
            }

            WebEngineView {
                id: webViewer_glass
                opacity: 0
                visible: this.opacity > 0.0
                anchors.fill: parent
                url: "http://electrk.rocks/BlocklandLauncher/site/glass.html"

                onLoadingChanged: {
                    var status = loadRequest.status;

                    if (status === WebEngineView.LoadStartedStatus) {
                        webViewer_glass_loadingText.opacity = 1.0;
                    }
                    else if (status === WebEngineView.LoadSucceededStatus) {
                        webViewer_glass_loadingText.opacity = 0.0;
                        this.opacity = 1.0;
                    }
                }
            }
        }

        Rectangle {
            id: rectangle2
            x: 10
            y: 400
            width: 620
            height: 1
            color: "#676a6a"
            visible: true
            border.width: 0
        }
    }

    ViewPanel {
        id: viewPanel_launcher
        x: 160
        y: 0
        width: 640
        height: 480
        z: 2
        opacity: 0
        visible: this.opacity > 0.0

        Behavior on opacity {
            NumberAnimation {
                //This specifies how long the animation takes
                duration: 500
                //This selects an easing curve to interpolate with, the default is Easing.Linear
                easing.type: Easing.OutQuint
            }
        }

        Rectangle {
            id: webViewer_news_container
            x: 0
            y: 0
            width: 640
            height: 400
            color: "#4d5052";
            visible: true
            border.width: 0;

            Text {
                id: webViewer_news_loadingText
                x: 286
                y: 193
                width: 139
                height: 20
                color: "#ffffff"
                text: qsTr("Loading...")
                visible: this.opacity > 0.0
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16

                Behavior on opacity {
                    NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 500
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.OutQuint
                    }
                }
            }

            WebEngineView {
                id: webViewer_news
                opacity: 0
                visible: this.opacity > 0.0
                anchors.fill: parent;
                url: "http://electrk.rocks/BlocklandLauncher/site/news.html"

                onLoadingChanged: {
                    var status = loadRequest.status;

                    if (status === WebEngineView.LoadStartedStatus) {
                        webViewer_news_loadingText.opacity = 1.0;
                    }
                    else if (status === WebEngineView.LoadSucceededStatus){
                        webViewer_news_loadingText.opacity = 0.0;
                        this.opacity = 1.0;
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 500
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.OutQuint
                    }
                }
            }

        }

        Rectangle {
            id: rectangle1
            x: 10
            y: 400
            width: 620
            height: 1
            color: "#676a6a"
            visible: true
            border.width: 0
        }

        MetroButton {
            id: launcher_button_launchGame
            x: 444
            y: 412
            width: 184
            height: 56
            text: "Launch Game"
            font.family: "MS Shell Dlg 2"
            pressedColor: "#5A9B62"
            hoveredColor: "#81C18B"
            defaultColor: "#6BB478"
            font.pointSize: 14
        }

        ComboBox {
            id: comboBox
            x: 10
            y: 416
            width: 184
            height: 48

            /*background: Rectangle {
                id: aids
                width: comboBox.width
                height: comboBox.height
                color: "#FF00FF"
                visible: true
                border.width: 0
            }*/
        }
    }
}
