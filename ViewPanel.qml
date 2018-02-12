import QtQuick 2.0
import QtQuick.Controls 2.2


ScrollView {
    visible: this.opacity > 0.0

    Behavior on opacity {
        NumberAnimation {
            //This specifies how long the animation takes
            duration: 500
            //This selects an easing curve to interpolate with, the default is Easing.Linear
            easing.type: Easing.OutQuint
        }
    }
}
