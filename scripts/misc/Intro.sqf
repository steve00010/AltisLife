_handle=createdialog "AW_INTRO";
if (isServer) then {
    if (isNil "HeadlessVariable") then {
        closeDialog 1;
    };
};