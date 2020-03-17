#include <sourcemod>
#include <sdktools>
#include <geoip>
#include <cstrike>

#pragma newdecls required

public void OnClientPutInServer(int client)
{
	char playerName[256];
	char playerID[32];
	char playerIP[2048];
	char playerCountry[64];
	
	GetClientName(client, playerName, sizeof(playerName));
	GetClientAuthId(client, AuthId_Steam2, playerID, sizeof(playerID));
	GetClientIP(client, playerIP, sizeof(playerIP), true);
	GeoipCountry(playerIP, playerCountry, sizeof(playerCountry));
	
	if (StrContains(playerID, "STEAM_", false) != -1)
	{
		if (CheckCommandAccess(client, "generic_admin", ADMFLAG_ROOT, false))
		{
			PrintToChatAll("\x02[SourceTurk] \x10%s \x01isimli oyuncu sunucuya \x06giriş yaptı. \x01[\x03%s \x01- \x0C%s \x01(\x0D%s\x01)]", playerName, playerID, playerCountry, playerIP);
		}
		else
		{
			PrintToChatAll("\x02[SourceTurk] \x10%s \x01isimli oyuncu sunucuya \x06giriş yaptı. \x01[\x03%s \x01- \x0C%s\x01]", playerName, playerID, playerCountry);
		}
	}
}

public void OnClientDisconnect(int client)
{
	char playerName[256];
	char playerID[32];
	char playerIP[2048];
	char playerCountry[64];
	
	GetClientName(client, playerName, sizeof(playerName));
	GetClientAuthId(client, AuthId_Steam2, playerID, sizeof(playerID));
	GetClientIP(client, playerIP, sizeof(playerIP), true);
	GeoipCountry(playerIP, playerCountry, sizeof(playerCountry));
	
	if (StrContains(playerID, "STEAM_", false) != -1)
	{
		if (CheckCommandAccess(client, "generic_admin", ADMFLAG_ROOT, false))
		{
			PrintToChatAll("\x02[SourceTurk] \x10%s \x01isimli oyuncu sunucuya \x0Fçıkış yaptı. \x01[\x03%s \x01- \x0C%s \x01(\x0D%s\x01)]", playerName, playerID, playerCountry, playerIP);
		}
		else
		{
			PrintToChatAll("\x02[SourceTurk] \x10%s \x01isimli oyuncu sunucuya \x0Fçıkış yaptı. \x01[\x03%s \x01- \x0C%s\x01]", playerName, playerID, playerCountry);
		}
	}
}
