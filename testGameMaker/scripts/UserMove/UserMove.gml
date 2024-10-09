// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro NULL undefined

function InitUserMove()
{
	collision_obj_tile = NULL;
}


function GetCollositionTileObj()
{
	return collision_obj_tile;
}

function SetCollisionTileObj(collisionTile)
{
	collision_obj_tile = collisionTile;
}

function MoveLandAlongEdge(_dir)
{
	if(collision_obj_tile == NULL) return ;
	
	if(_dir < 0)
	{
		image_xscale = -2;
		var cx = collision_obj_tile.x;
		var cy = collision_obj_tile.y;
	
		// 원형 경계 따라 이동
		var radius = collision_obj_tile.sprite_width / 2;
		var dir = point_direction(cx, cy, x, y); // 플레이어와 중심 간의 각도 계산
		image_angle = dir - 90;
		
		var test_dir = dir + 2;
		
		x = cx + lengthdir_x(radius, test_dir);
		y = cy + lengthdir_y(radius, test_dir);
	}
	else if(_dir > 0)
	{
		image_xscale = 2;
		
		var cx = collision_obj_tile.x;
		var cy = collision_obj_tile.y;
	
		// 원형 경계 따라 이동
		var radius = collision_obj_tile.sprite_width / 2;
		var dir = point_direction(cx, cy, x, y); // 플레이어와 중심 간의 각도 계산
		image_angle = dir - 90;
		
		var test_dir = dir - 2;
		
		x = cx + lengthdir_x(radius, test_dir);
		y = cy + lengthdir_y(radius, test_dir);
	}
};

function MoveHorizontal(_dir)
{	
	if(_dir < 0) // 왼쪽으로 이동
	{
		hspeed = -8
		;
		image_angle = 0;
		image_xscale = -2;
	}
	else // 오른쪽으로 이동
	{
		hspeed = 8;
		image_angle = 0;
		image_xscale = 2;
	}
}

function Jump()
{
	if(GetIsOnGround())
	{
		var ground = GetCollositionTileObj();
	
		var cx = ground.x;
		var cy = ground.y;
	
			// 원형 경계 따라 이동
		var radius = ground.sprite_width / 2;
		var dir = point_direction(cx, cy, x, y); // 플레이어와 중심 간의 각도 계산
	
		if (dir >= 181 && dir <= 365) {
	        // 아래로 떨어지는 점프 처리
	        vspeed = 5;  // 아래로 떨어짐
	    } else {
	        // 일반 위쪽 점프 처리
	        vspeed = -10;  // 위로 점프
	    }
	
		SetIsOnGround(false);
		SetCanJump(false);
		SetCollisionTileObj(NULL);
		
		if(GetInputLeft())
		{
			MoveHorizontal(-1);
		}
		else if(GetInputRight())
		{
			MoveHorizontal(1);
		}
	}
}

function Stop()
{
	hspeed = 0;
}