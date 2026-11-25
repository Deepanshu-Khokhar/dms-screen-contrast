import QtQuick
import qs.Common
import qs.DCommon.Widgets
import qs.Modules.Plugins
import qs.Services

PluginComponent {
    id: root

    readonly property bool supported: NightModeService.gammaAdjustAvailable
    readonly property int percent: Math.round(SessionData.displayContrast * 100)
    readonly property int normal: 100
    readonly property bool isNormal: SessionData.displayContrast === normal / 100

    ccWidgetIcon: "contrast"
    ccWidgetPrimaryText: "Contrast"
    ccWidgetSecondaryText: supported ? percent + "%" : "Unavailable"
    ccWidgetIsActive: supported && !isNormal
    ccWidgetIsToggle: false
    ccDetailHeight: supported ? 132 : 68

    function applyLevel(level: int): void {
        if (supported && level >= 50 && level <= 200 && level / 100 !== SessionData.displayContrast)
            NightModeService.setDisplayContrast(level / 100);
    }

    ccDetailContent: Component {
        Column {
            spacing: Theme.spacingS

            StyledText {
                width: parent.width
                text: root.supported ? "50% softer · 100% normal · 200% stronger" : "Display contrast is not available in this session."
                wrapMode: Text.WordWrap
            }

            DSlider {
                id: slider
                width: parent.width
                visible: root.supported
                enabled: root.supported
                Accessible.name: "Screen contrast"
                minimum: 50
                maximum: 200
                step: 5
                unit: "%"
                alwaysShowValue: true

                Binding {
                    slider.value: root.percent
                    when: !slider.isDragging
                    restoreMode: Binding.RestoreNone
                }

                onSliderDragFinished: finalValue => root.applyLevel(finalValue)
            }

            DButton {
                text: "Reset to 100%"
                variant: "outlined"
                visible: root.supported
                enabled: !root.isNormal
                onClicked: root.applyLevel(root.normal)
            }
        }
    }
}
