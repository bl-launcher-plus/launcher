import QtQuick 2.0
import QtQuick.Controls 2.3


MetroButton {
    property ButtonGroup btnGroup: null;
    property ViewPanel viewPanel: null;

    ButtonGroup.group: btnGroup;
    checkable: true;

    onCheckedChanged: {
        this.doColorCheck();
        this.setViewPanelVisible(this.checked);
    }

    function setViewPanelVisible(visible) {
        if (this.viewPanel === null) {
            return;
        }

        if (visible) {
            this.viewPanel.opacity = 1.0;
        }
        else {
            this.viewPanel.opacity = 0.0;
        }

        if (visible) {
            this.onShowViewPanel();
        }
        else {
            this.onHideViewPanel();
        }
    }

    // Callbacks
    function onShowViewPanel() {}
    function onHideViewPanel() {}
}
