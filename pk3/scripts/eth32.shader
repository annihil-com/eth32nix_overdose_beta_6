//eth32nix Shaders 
// Credits: *nixCoders Team 2008

keramicChams
{
	cull none
	deformVertexes wave 1 sin -0.2 0 0 1
	noPicmip
	surfaceparm trans
	{
  		map textures/sfx/construction.tga
  		blendFunc GL_SRC_ALPHA GL_ONE 
  		rgbGen entity
  		tcGen environment 
   		tcMod scroll 0.025 -0.07625 
 	} 
}

testChams
{
	q3map_surfacelight 1200
	deformVertexes wave 100 sin 0 0 0 0
		{
		map gfx/effects/test.tga
  		tcGen environment
		tcmod rotate 2
		tcmod scroll 2.3 0.4
 		rgbgen entity
		blendfunc GL_ONE GL_ONE
	}
}

plasticChams
{
		deformVertexes wave 100 sin 0 0 0 0
		{
			map gfx/effects/fx_white.tga
			rgbGen entity
			blendfunc GL_ONE GL_ONE
		}
}

CrispWaveChams
{
	q3map_globaltexture
	surfaceparm trans
	qer_trans .5
	q3map_surfacelight 1000
	nopicmip
	tesssize 128
	cull disable
	deformVertexes wave 150 sin -0.0 2 .15 0.3
	{
            	map textures/temperate_sd/rock_graynoise.tga
		rgbGen entity
	}
}

outChams
{
	deformVertexes wave 1 sin 2 0 0 0
	{
		map textures/sfx/construction.tga
		blendFunc GL_ONE GL_ONE 
		rgbGen entity
		tcGen environment 
		tcMod scroll 0.025 -0.07625 
	}
}

outChamsmarble
{
	deformVertexes wave 100 sin 1 0 0 0.1
	surfaceparm nodamage
	nopicmip
	{
		map $lightmap
		rgbGen identity
	}
	{
 	        map gfx/effects/marble.tga
		rgbGen entity
	}
	{
		map gfx/effects/shine.tga 
		rgbGen identity
		blendfunc GL_SRC_ALPHA GL_ONE 
		tcgen environment
	}
}

outChamscrystal
{
	cull none
	deformVertexes wave 100 sin 1 0 0 0.1
	noPicmip
	surfaceparm trans
	{
		map textures/sfx/construction.tga
		blendFunc GL_SRC_ALPHA GL_ONE 
		rgbGen entity
		tcGen environment 
		tcMod scroll 0.025 -0.07625 
	} 
}

outChamsthermal
{
	cull none
	deformVertexes wave 100 sin 1 0 0 0.1
	noPicmip
	surfaceparm trans
	{
		map gfx/effects/thermal.tga
  		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
		rgbgen entity
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_DST_ALPHA
	}
	{
		map gfx/effects/thermal.tga
		blendFunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
		rgbgen entity
	}
	{
		map gfx/effects/rain.tga
 		tcGen environment
		rgbgen entity
		tcmod rotate 8
		tcmod scroll 0.5 .1
		blendfunc GL_ONE GL_ONE
	}
} 

outChamsquad
{
	cull none
	deformVertexes wave 100 sin 1 0 0 0.1
	noPicmip
	surfaceparm trans
	{
		map gfx/effects/quad.tga
                depthWrite
  		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
 		rgbgen entity
		blendfunc GL_ONE GL_ONE
	}
}

outChamsplasma
{
	cull none
	deformVertexes wave 100 sin 1 0 0 0.1
	noPicmip
	surfaceparm trans
	{
		map gfx/effects/plasma.tga
		blendfunc GL_ONE GL_ONE
		rgbGen entity
		tcGen environment
		tcmod rotate 15
		tcmod scroll 1 .1
	}
}

outChamsplastic
{
	deformVertexes wave 100 sin 1 0 0 0.1
  	{
       	 	map menu/art/fx_white.tga
        	rgbGen entity
        	blendfunc GL_ONE GL_ONE
  	}
}

crystalChams
{
	cull none
	deformVertexes wave 1 sin -0.2 0 0 1
	noPicmip
	surfaceparm trans
	{
		map textures/sfx/construction.tga
		blendFunc GL_SRC_ALPHA GL_ONE 
		alphaFunc GE128
                depthWrite
		rgbGen entity
		tcGen environment 
		tcMod scroll 0.025 -0.07625 
	} 
}

glowChams
{
	deformVertexes wave 64 sawtooth 3 0 0 0 
	{
		map menu/art/fx_white.tga
		rgbGen entity
                depthWrite
		blendFunc GL_ONE GL_ONE 
	}
}

flameChams
{
	q3map_surfacelight 1800
	deformVertexes wave 1 sin -0.2 0 0 1  
	{
		animMap 10 gfx/effects/r.tga
		blendFunc GL_ONE GL_ONE
		depthWrite
		rgbGen entity
 		tcGen environment
                tcmod rotate 20
                tcmod scroll 1 .1
	}
	{
		animMap 10 gfx/effects/r.tga
		blendFunc GL_ONE GL_ONE
		depthWrite
		rgbGen entity
 		tcGen environment
                tcmod rotate 20
                tcmod scroll 1 .1
	}
	{

		map gfx/effects/quad.tga
		depthWrite
		blendFunc GL_ONE GL_ONE
 		tcGen environment
                tcmod rotate 20
                tcmod scroll 2 .1
		rgbGen entity
	}
}

solidAChams
{
	deformVertexes wave 100 sin 1.5 0 0 0
	{
		map *white
		rgbGen entity
	}
}

solidBChams
{
	q3map_surfacelight 1800
	deformVertexes wave 1 sin -0.2 0 0 1
 	surfaceparm trans
	cull none
	surfaceparm pointlight
	surfaceparm alphashadow
	{
		map gfx/effects/r.tga
		blendfunc GL_ONE GL_ONE
                depthWrite
		rgbgen entity
 		tcGen environment
                tcmod rotate 10
                tcmod scroll 0 .1
	}
}

quadAChams
{
	q3map_surfacelight 1800
	deformVertexes wave 1 sin -0.2 0 0 1      
	{
		map gfx/effects/quad.tga
                depthWrite
  		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
 		rgbgen entity
		blendfunc GL_ONE GL_ONE
	}
}

quadBChams
{
	q3map_surfacelight 1800
	deformVertexes wave 1 sin -0.2 0 0 1       
	{
		map gfx/effects/quad.tga
                depthWrite
  		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
 		rgbgen entity
		blendfunc GL_ONE GL_ONE
	}
	{
		map gfx/effects/quad.tga
                depthWrite
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 8
		tcmod scroll 0.5 .1
  		rgbgen entity
	}
	{
		map gfx/effects/quad.tga
		tcGen environment
		rgbgen entity
		tcmod rotate 16
		tcmod scroll 0.8 .1
		blendfunc GL_ONE GL_ONE
	}
}

quadCChams
{
	q3map_surfacelight 1800
       	deformVertexes wave 1 sin -0.2 0 0 1
	{
		map gfx/effects/x.jpg
		alphaFunc GE128
                depthWrite
 		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_DST_ALPHA
		tcGen environment
		tcmod rotate 15
		tcmod scroll 1 .1
	}
	{
		map gfx/effects/quad.tga
		alphaFunc GE128
                depthWrite
		blendFunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 15
		tcmod scroll 1 .1
		rgbGen entity
	}
}

quadDChams
{
	q3map_surfacelight 1800
	deformVertexes wave 1 sin -0.2 0 0 1       
	{
		map gfx/effects/quad.tga
		alphaFunc GE128
                depthWrite
  		tcGen environment
		tcmod rotate 8
		tcmod scroll 0.5 .1
 		rgbgen entity
 		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_DST_ALPHA
	}
	{
		map gfx/effects/quad.tga
		alphaFunc GE128
                depthWrite
 		blendFunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 18
		tcmod scroll 0.5 .1
	}
	{
		map gfx/effects/q.jpg
		alphaFunc GE128
                depthWrite
		tcGen environment
		rgbgen entity
		tcmod rotate 16
		tcmod scroll 0.5 .1
 		blendfunc GL_ONE GL_ONE
	}
}

matrixChams
{
	q3map_surfacelight 1800
       	deformVertexes wave 1 sin -0.2 0 0 1
	{
		map gfx/effects/matrix.tga
		blendFunc GL_SRC_ALPHA GL_ONE 
		alphaFunc GE128
                depthWrite
		rgbgen entity	
		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.3 .1
	}
	{
		map gfx/effects/q.jpg
		blendFunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 1
		tcmod scroll 0.1 .1
		rgbGen entity
	}
}



thermalChams
{
	q3map_surfacelight 400
	deformVertexes wave 1 sin -0.2 0 0 1       
	{
		map gfx/effects/thermal.tga
  		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
		rgbgen entity
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_DST_ALPHA
	}
	{
		map gfx/effects/thermal.tga
		blendFunc GL_ONE GL_ONE
		tcGen environment
		tcmod rotate 4
		tcmod scroll 0.5 .1
		rgbgen entity
	}
	{
		map gfx/effects/rain.tga
 		tcGen environment
		rgbgen entity
		tcmod rotate 8
		tcmod scroll 0.5 .1
		blendfunc GL_ONE GL_ONE
	}
} 

crystalBChams
{
	cull none
	deformVertexes wave 1 sin -0.2 0 0 1
	noPicmip
	surfaceparm trans
	{
		map textures/sfx/construction.tga
		blendFunc GL_SRC_ALPHA GL_ONE 
		rgbGen entity
		tcGen environment 
		tcMod scroll 0.025 -0.07625 
	} 
}

xrayChams
{
	cull none
	noPicmip
	surfaceparm trans
	{
		map gfx/effects/xray.tga
		blendFunc GL_SRC_ALPHA GL_ONE 
		rgbGen entity
		tcGen environment 
	} 
}

gridChams
{
	cull none
	noPicmip
	surfaceparm trans
	{
		map gfx/effects/grid.tga
		alphaFunc GE128
		rgbGen entity
	}
}

waveChams
{
	q3map_globaltexture
	surfaceparm trans
	qer_trans .5
	q3map_surfacelight 1000
	nopicmip
	tesssize 128
	cull disable
	deformVertexes wave 200 sin 4 3 .15 0.3
        {
		map gfx/effects/wave.tga
		blendfunc blend
		tcMod turb 0 .2 0 .05
		tcmod scale .4 .4
		blendfunc blend
		blendFunc GL_ONE GL_ONE
		rgbGen entity
	}
}

crispyChams
{
	deformVertexes wave 1 sin -2.0 0 0 1
	cull none
	noPicmip
	surfaceparm trans
	{
            	map textures/temperate_sd/rock_graynoise.tga
		rgbGen entity
	}
}

marbleChams
{
	surfaceparm nodamage
	nopicmip
	{
		map $lightmap
		rgbGen identity
	}
	{
 	        map gfx/effects/marble.tga
		rgbGen entity
	}
	{
		map gfx/effects/shine.tga 
		rgbGen identity
		blendfunc GL_SRC_ALPHA GL_ONE 
		tcgen environment
	}
}

plasmaChams
{
	q3map_surfacelight 1800
	deformVertexes wave 100 sin 0 0 0 0
	{
		map gfx/effects/plasma.tga
		blendfunc GL_ONE GL_ONE
		rgbGen entity
		tcGen environment
		tcmod rotate 15
		tcmod scroll 1 .1
	}
}

statbar
{
	nomipmaps
	nopicmip
	{
		map gui/common/statbar.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

statbar2
{
	nomipmaps
	nopicmip
	{
		map gui/common/statbar2.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

combtn_left
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_button_left.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

combtn_center
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_button_cen.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

combtn_right
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_button_right.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

comsel_left
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_select_left.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

comsel_center
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_select_cen.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

comsel_right
{
	nomipmaps
	nopicmip
	{
		map gui/common/com_select_right.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}

