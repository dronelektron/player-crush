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

    float otherHeight = (otherMaxBounds[Z] - otherMinBounds[Z]) * HEIGHT_PERCENT;
    float deltaZ = clientPosition[Z] - otherPosition[Z];
    bool isAbove = deltaZ > otherHeight;
    bool intersectsX = Intersects(clientMinBounds, clientMaxBounds, otherMinBounds, otherMaxBounds, X);
    bool intersectsY = Intersects(clientMinBounds, clientMaxBounds, otherMinBounds, otherMaxBounds, Y);

    return isAbove && intersectsX && intersectsY;
}

static bool Intersects(const float minA[3], const float maxA[3], const float minB[3], const float maxB[3], int axis) {
    return minB[axis] < maxA[axis] && maxB[axis] > minA[axis];
}
