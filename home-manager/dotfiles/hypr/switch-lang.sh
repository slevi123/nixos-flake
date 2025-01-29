#!/usr/bin/env bash

LAST_LAYOUTS_KEY="/me/leswell/language/lang-order"
LAYOUT_SWITCH_INPROGRESS_KEY="/me/leswell/language/switch-inprogress"
SLEEP_TIME_TO_SWITCH_THIRD=1

DEVICE_NAME='hid-04f3:0103'

ORDER=$(dconf read "$LAST_LAYOUTS_KEY" | tr -d "[]' ")

if [ -z "$ORDER" ]; then
    ORDER="0,1,2"
fi

IFS=',' read -r LAST1 LAST2 THIRD <<< "$ORDER"
INP=$(dconf read "$LAYOUT_SWITCH_INPROGRESS_KEY")

if [ "$INP" == "true" ]; then
    hyprctl switchxkblayout $DEVICE_NAME $THIRD
    dconf write "$LAST_LAYOUTS_KEY" "['$THIRD','$LAST2','$LAST1']"

else
    hyprctl switchxkblayout $DEVICE_NAME $LAST2
    dconf write "$LAST_LAYOUTS_KEY" "['$LAST2','$LAST1','$THIRD']"

    dconf write "$LAYOUT_SWITCH_INPROGRESS_KEY" "true"
    sleep $SLEEP_TIME_TO_SWITCH_THIRD
    dconf write "$LAYOUT_SWITCH_INPROGRESS_KEY" "false"

fi

