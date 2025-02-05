void UseCase_StartTouch(int client, int target) {
    if (IsClient(target) && IsOnGround(target) && IsPlayerCrusher(client, target)) {
        Sound_RandomCrush(target);
        Hook_TakeDamage(client, target);
        Message_PlayerCrushed(client, target);
    }
}

static bool IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}

static bool IsOnGround(int client) {
    int groundEntity = GetEntPropEnt(client, Prop_Send, "m_hGroundEntity");

    return groundEntity == WORLD;
}

static bool IsPlayerCrusher(int client, int target) {
    float clientVelocity[3];

    GetEntPropVector(client, Prop_Data, "m_vecVelocity", clientVelocity);

    if (clientVelocity[Z] >= 0.0) {
        return false;
    }

    float clientPosition[3];
    float clientMins[3];
    float targetPosition[3];
    float targetMaxs[3];

    GetClientAbsOrigin(client, clientPosition);
    GetClientMins(client, clientMins);
    AddVectors(clientPosition, clientMins, clientMins);
    GetClientAbsOrigin(target, targetPosition);
    GetClientMaxs(target, targetMaxs);
    AddVectors(targetPosition, targetMaxs, targetMaxs);

    return clientMins[Z] >= targetMaxs[Z];
}
