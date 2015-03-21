_deadtargets = count DEADTARGETS;
_alltargets = CACHESNUMBER;

HintSilent format["\n"+(localize "STR_DAP_BF_MISSION_STATUS")+"\n\n"+(localize "STR_DAP_BF_MISSION_STATUS_TEXT")+"%1/%2\n ",_deadtargets,_alltargets];

sleep 5;

HintSilent "";
