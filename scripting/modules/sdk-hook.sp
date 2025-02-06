bool SdkHook_StartTouchPost_Toggle(int client, bool enabled) {
    if (Client_IsStartTouchEnabled(client) == enabled) {
        return false;
    }

    Client_SetStartTouchEnabled(client, enabled);

    if (enabled) {
        SDKHook(client, SDKHook_StartTouchPost, UseCase_OnStartTouchPost);
    } else {
        SDKUnhook(client, SDKHook_StartTouchPost, UseCase_OnStartTouchPost);
    }

    return true;
}

void SdkHook_TakeDamage(int client, int other) {
    float hp = GetClientHealth(other) * 1.0;

    SDKHooks_TakeDamage(other, WORLD, client, hp, DMG_CRUSH);
}
