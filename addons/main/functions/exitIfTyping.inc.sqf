// ace_interact_menu_fnc_keydown

private _focusedTextIndex = allDisplays findIf {(ctrlType (focusedCtrl _x)) == 2};
private _isTextEditing = _focusedTextIndex != -1;

if (_isTextEditing) then {
    if (ctrlIDD (allDisplays select _focusedTextIndex) == 12) then {
        _isTextEditing = visibleMap;
    };
};

if (_isTextEditing) exitWith {};
