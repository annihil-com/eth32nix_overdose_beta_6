// ETH32 - an Enemy Territory cheat for windows
// Copyright (c) 2007 eth32 team
// www.cheatersutopia.com & www.nixcoders.org

#include "../eth32.h"

CRadarWindow::CRadarWindow(char *wlabel, int wx, int wy, int ww, int wh)
: CWindow(wlabel, wx, wy, ww, ww) // set width and height to ww to keep it square
{
	showTitle = false;

	numPoints = 0;
	memset(points, 0, sizeof(points));

	cx = x + (w >> 1);
	cy = y + (h >> 1);
}

const char *crosshairText[XHAIR_MAX] =
{
	"Off",
	"Sniper",
	"Open Cross",
	"Closed Cross",
	"Dot",
};

typedef struct fxphase_s {
	int clips_phase;
	int health_phase;
	vec4_t color[3];
} fxphase_t;
fxphase_t fxphase;

int isAimableWeapon() {
	int weapon = eth32.cg.snap->ps.weapon;
	switch (weapon) {
		case WP_KNIFE:
		return 0;
		break;
		case WP_GRENADE_PINEAPPLE:
		case WP_GRENADE_LAUNCHER:
		case WP_BINOCULARS:
		case WP_PANZERFAUST:
		case WP_MEDIC_SYRINGE:
		case WP_MEDIC_ADRENALINE:
		case WP_AMMO:
		case WP_MEDKIT:
		case WP_ARTY:
		case WP_DYNAMITE:
		case WP_MORTAR:
		case WP_MORTAR_SET:
		case WP_SATCHEL:
		case WP_LANDMINE:
			return 0;
			break;
		default:
			return 1;
			break;
	}
	return 1;
}

void CRadarWindow::Display(void)
{
	if (!show) return;

	CWindow::Display();

	vec4_t colorTeam, colorEnemy;
	vec3_t pt, my_ang, pt_ang;
	int px, py;
	float delta_ang;
	
	float distFactor = (cx - x - 5)/eth32.settings.radarRange;

	player_t *player;
	
	Vector4Set(colorTeam, eth32.settings.colorTeam[0]/255.f, eth32.settings.colorTeam[1]/255.f, eth32.settings.colorTeam[2]/255.f, 1);
	Vector4Set(colorEnemy, eth32.settings.colorEnemy[0]/255.f, eth32.settings.colorEnemy[1]/255.f, eth32.settings.colorEnemy[2]/255.f, 1);

	Tools.VectorAngles(eth32.cg.refdef->viewaxis[0], my_ang);
	
	Draw.RawFillRect(cx-2, cy-2, 5, 5, colorWhite);	//Radar (self)
	
	/** ---------------------------------------------------------
				WARNING MESSAGES	
	--------------------------------------------------------- **/
	int X = 320 * eth32.cg.screenXScale;	
	int Y = 240 * eth32.cg.screenYScale;
	int health = eth32.cg.snap->ps.stats[STAT_HEALTH];
	int clip = eth32.cg.snap->ps.ammoclip[orig_BG_FindClipForWeapon(eth32.cg.snap->ps.weapon)];;
	VectorCopy(colorWhite,fxphase.color[0]);
	VectorCopy(colorRed,fxphase.color[1]);
	VectorCopy(colorMdRed,fxphase.color[2]);
	fxphase.color[0][3]= 1.0f;
	fxphase.color[1][3]= 1.0f;
	fxphase.color[2][3]= 1.0f;
	
	if (eth32.settings.showReload) {
		if (isAimableWeapon()) {
			if (eth32.cg.snap->ps.weaponstate == WEAPON_RELOADING) {			
				fxphase.clips_phase++;
				if (fxphase.clips_phase == 2) 
					fxphase.clips_phase = 0;
				Draw.TextCenter(X, Y*2*0.40, 0.43f, "RELOADING!", fxphase.color[fxphase.clips_phase], qtrue, qfalse, GUI_FONT, true);
			}
		
			if (clip < 6 && eth32.cg.snap->ps.weaponstate != WEAPON_RELOADING) {
				fxphase.clips_phase++;
				if (fxphase.clips_phase == 2) 
					fxphase.clips_phase = 0;
				Draw.TextCenter(X, Y*2*0.40, 0.43f, "WARNING LOW AMMO!", fxphase.color[fxphase.clips_phase], qtrue, qfalse, GUI_FONT, true);
			}
		}
		
		if (health < 40 && health > 0) {
			fxphase.health_phase++;	
		
			if (fxphase.health_phase == 2) 
				fxphase.health_phase = 0;
	
			Draw.TextCenter(X, Y*2*0.35, 0.43f, "WARNING! LOW HEALTH!", fxphase.color[fxphase.health_phase], qtrue, qfalse, GUI_FONT, true); 
		}
	}  

	/** ---------------------------------------------------------
				CUSTOM CROSSHAIR	
	--------------------------------------------------------- **/	
	int W = eth32.settings.crossSize * eth32.cg.screenXScale;
	int H = eth32.settings.crossThick * eth32.cg.screenYScale;
	vec4_t xhairColor;
	VectorCopy(eth32.settings.xhairColor, xhairColor);
	xhairColor[3] = eth32.settings.xhairOpacity;

			  		//Width		//Height    	//W		//H		//Color

	switch(eth32.settings.customXhair) {
		case XHAIR_OFF:
			break;
		case XHAIR_SNIPER: {
			Draw.RawFillRect( X-H/2, 	Y, 		H, 		W*1.3, 		xhairColor );
			Draw.RawFillRect( ((X-W/2)-1), 	Y+H/2, 		- W*1, 		- H*1, 		xhairColor );
			Draw.RawFillRect( ((X+W/2)+1),  Y-H/2,		W, 		H, 		xhairColor );
			break;
		}
		case XHAIR_CROSS: {
			Draw.RawFillRect( X-H/2, 	Y-H/2, 		H, 		H, 		xhairColor );
			Draw.RawFillRect( X-7, 		Y+H/2, 		- W*1, 		- H*1, 		xhairColor );
			Draw.RawFillRect( X+7,        	Y-H/2,		W, 		H, 		xhairColor );
			Draw.RawFillRect( X+H/2, 	Y-7, 		- H*1, 		- W*1, 		xhairColor );
			Draw.RawFillRect( X-H/2,      	Y+7,		H, 		W, 		xhairColor );
			break;
		}
		case XHAIR_CROSS2: {
			Draw.RawFillRect( X, 	 	Y+H/2, 		- W*1, 		- H*1, 		xhairColor );
			Draw.RawFillRect( X,         	Y-H/2,		W, 		H, 		xhairColor );
			Draw.RawFillRect( X+H/2, 	Y, 		- H*1, 		- W*1, 		xhairColor );
			Draw.RawFillRect( X-H/2,        Y,		H, 		W, 		xhairColor );
			break;
		}
		case XHAIR_DOT: 
			Draw.RawFillRect( (X-((W/5)/2)), (Y-((W/5)/2)), W/5, 		W/5, 		xhairColor );
			break;
	}

	for (int i=0 ; i<numPoints ; i++) 
	{
		player = points[i];
		
		pt[0] = player->orHead.origin[0] - eth32.cg.refdef->vieworg[0];
		pt[1] = player->orHead.origin[1] - eth32.cg.refdef->vieworg[1];

		Tools.VectorAngles(pt, pt_ang);
		delta_ang = pt_ang[YAW] - my_ang[YAW] + 90.f;

		px = cx + cos(delta_ang * M_PI/180.f) * player->distance * distFactor;
		py = cy - sin(delta_ang * M_PI/180.f) * player->distance * distFactor;
	
		vec4_t color;
		player->friendly ? VectorCopy(colorTeam, color) : VectorCopy(colorEnemy, color);
		color[3] = 1;
		Syscall.R_SetColor(color);
		Draw.Pic(((px-2)/eth32.cg.screenXScale), ((py-2)/eth32.cg.screenYScale), 10, 10, eth32.cg.media.classIcons[player->CLASS]);
		Syscall.R_SetColor(NULL);
		//Draw.RawFillRect(px-2, py-2, 5, 5, (player->friendly) ? colorTeam : colorEnemy);
	}
	numPoints = 0;

	if (Gui.InputActive()) {
		char buf[64];
		sprintf(buf, "%i", (int)eth32.settings.radarRange);
		Draw.Text(x+GUI_SPACING, y2-GUI_FONTHEIGHT-GUI_SPACING, GUI_FONTSCALE, "Range", GUI_FONTCOLOR1, qtrue, qfalse, GUI_FONT, true);
		Draw.Text(x2-GUI_SPACING-TEXTWIDTH(buf), y2-GUI_FONTHEIGHT-GUI_SPACING, GUI_FONTSCALE, buf, GUI_FONTCOLOR2, qtrue, qfalse, GUI_FONT, true);
	}
}

int CRadarWindow::MouseWheel(int mx, int my, int wheel)
{
	if (!show) return 1; // not visible, can't process

	if (INBOUNDS(mx,my)) {
		eth32.settings.radarRange += -wheel * 100.f;

		if (eth32.settings.radarRange > 10000.f)
			eth32.settings.radarRange = 10000.f;
		else if (eth32.settings.radarRange < 100.f)
			eth32.settings.radarRange = 100.f;

		return 0;
	}
	return 1;
}

void CRadarWindow::SetOrigin(int ox, int oy)
{
	CControl::SetOrigin(ox, oy);

	cx = x + (w >> 1);
	cy = y + (h >> 1);
}

void CRadarWindow::Reposition(int ox, int oy)
{
	CWindow::Reposition(ox, oy);

	cx = x + (w >> 1);
	cy = y + (h >> 1);
}

void CRadarWindow::AddPlayer(player_t *player)
{
	if (numPoints < MAX_CLIENTS && player->distance < eth32.settings.radarRange) {
		points[numPoints] = player;
		numPoints++;
	}
}
