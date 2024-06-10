void UseCase_StartTouch(int client, int other) {
    if (client == WORLD) {
        return;
    }

    if (IsClient(other) && IsOnGround(other) && IsPlayerCrusher(client, other)) {
        Sound_RandomCrush(other);
        Hook_TakeDamage(client, other);
        Message_PlayerCrushed(client, other);
    }
}

static bool IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}

static bool IsOnGround(int client) {
    int groundEntity = GetEntPropEnt(client, Prop_Send, "m_hGroundEntity");

    return groundEntity == WORLD;
}

static bool IsPlayerCrusher(int client, int other) {
    float clientPosition[3];
    float clientMinBounds[3];
    float clientMaxBounds[3];
    float otherPosition[3];
    float otherMinBounds[3];
    float otherMaxBounds[3];

    GetClientAbsOrigin(client, clientPosition);
    GetClientMins(client, clientMinBounds);
    GetClientMaxs(client, clientMaxBounds);
    AddVectors(clientPosition, clientMinBounds, clientMinBounds);
    AddVectors(clientPosition, clientMaxBounds, clientMaxBounds);

    GetClientAbsOrigin(other, otherPosition);
    GetClientMins(other, otherMinBounds);
    GetClientMaxs(other, otherMaxBounds);
    AddVectors(otherPosition, otherMinBounds, otherMinBounds);
    AddVectors(otherPosition, otherMaxBounds, otherMaxBounds);

    bool isAbove = clientPosition[Z] > otherPosition[Z];
    bool intersectsX = otherMinBounds[X] < clientMaxBounds[X] && otherMaxBounds[X] > clientMinBounds[X];
    bool intersectsY = otherMinBounds[Y] < clientMaxBounds[Y] && otherMaxBounds[Y] > clientMinBounds[Y];

    return isAbove && intersectsX && intersectsY;
}
