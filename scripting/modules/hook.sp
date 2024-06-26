void Hook_EnableStartTouchPost(int client) {
    SDKHook(client, SDKHook_StartTouchPost, UseCase_StartTouch);
}

void Hook_DisableStartTouchPost(int client) {
    SDKUnhook(client, SDKHook_StartTouchPost, UseCase_StartTouch);
}

void Hook_TakeDamage(int client, int other) {
    float hp = GetClientHealth(other) * 1.0;

    SDKHooks_TakeDamage(other, WORLD, client, hp, DMG_CRUSH);
}
