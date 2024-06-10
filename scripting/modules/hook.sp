void Hook_StartTouchPost(int client) {
    SDKHook(client, SDKHook_StartTouchPost, Hook_OnStartTouchPost);
}

public void Hook_OnStartTouchPost(int entity, int other) {
    UseCase_StartTouch(entity, other);
}

void Hook_TakeDamage(int client, int other) {
    float hp = GetClientHealth(other) * 1.0;

    SDKHooks_TakeDamage(other, WORLD, client, hp, DMG_CRUSH);
}
