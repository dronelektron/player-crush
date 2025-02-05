static const int VOID = 0;

void Native_Create() {
    CreateNative("PlayerCrush_Enable", Native_CrushEnable);
    CreateNative("PlayerCrush_Disable", Native_CrushDisable);
}

any Native_CrushEnable(Handle plugin, int numParams) {
    int client = GetNativeCell(1);

    SdkHook_EnableStartTouchPost(client);

    return VOID;
}

any Native_CrushDisable(Handle plugin, int numParams) {
    int client = GetNativeCell(1);

    SdkHook_DisableStartTouchPost(client);

    return VOID;
}
