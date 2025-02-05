static bool g_startTouchEnabled[MAXPLAYERS + 1];

void Client_Reset(int client) {
    g_startTouchEnabled[client] = false;
}

bool Client_IsStartTouchEnabled(int client) {
    return g_startTouchEnabled[client];
}

void Client_SetStartTouchEnabled(int client, bool enabled) {
    g_startTouchEnabled[client] = enabled;
}
