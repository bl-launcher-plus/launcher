import QtQuick 2.0
import QtQuick.Controls 2.3


Button {
    property string defaultColor: "#4E4F51";
    property string bgColor: defaultColor;
    property string pressedColor: "#59595B";
    property string hoveredColor: "#545456";
    property string textColor: "#FFFFFF";

    font.family: "MS Shell Dlg 2";
    font.pointSize: 11;

    contentItem: Text {
        text: parent.text;
        font.family: parent.font.family;
        font.pointSize: parent.font.pointSize;
        color: parent.textColor;
        opacity: 1.0;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        elide: Text.ElideRight;
    }

    background: Rectangle {
        id: background;
        x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        color: parent.bgColor;
    }

    onPressedChanged: {
        this.doColorCheck();
    }

    onCheckedChanged: {
        this.doColorCheck();
    }

    onHoveredChanged: {
        this.doColorCheck();
    }

    Behavior on bgColor {
        ColorAnimation {
            //This specifies how long the animation takes
            duration: 500
            //This selects an easing curve to interpolate with, the default is Easing.Linear
            easing.type: Easing.OutQuint
        }
    }

    function doColorCheck() {
        var type = "default";

        if (this.checked || this.pressed) {
            this.bgColor = this.pressedColor;
            type = "pressed";
        }
        else if (this.hovered && !this.pressed) {
            this.bgColor = this.hoveredColor;
            type = "hovered";
        }
        else {
            this.bgColor = this.defaultColor;
        }

        this.onColorCheck(type);
    }

    // Callbacks
    function onColorCheck(type) {}
}
