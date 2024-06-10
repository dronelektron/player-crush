# Player crush

Allows players to crush other players

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/player-crush/releases)
* Extract `plugins` and `translations` folders to `addons/sourcemod` folder of your server

### API

Enable crush mode for the `client`

```sourcepawn
native void PlayerCrush_Enable(int client);
```

Disable crush mode for the `client`

```sourcepawn
native void PlayerCrush_Disable(int client);
```
