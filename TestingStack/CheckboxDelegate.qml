import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    height: 20
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0

    property alias checkBox: cb
    property alias itemText: cb.text

    CheckBox {
        id: cb
        checked: false
    }
}
