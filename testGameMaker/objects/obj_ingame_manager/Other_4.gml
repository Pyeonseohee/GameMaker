/// @description Insert description here
// You can write your code in this editor

show_debug_message("InGameRoom start!!!!");

// 맵 무작위 생성
// 랜덤 맵 0-2 뽑고
// case에 따라서 obj_tile 생성

var random_map_idx = irandom(2);
var center_x = room_width/2;
var center_y = room_height/2;
		
switch(random_map_idx)
{
	
	case 0:
		
		instance_ground_tile1 = instance_create_layer(center_x, center_y, "Environments", obj_tile);
		break;
	case 1:
		instance_ground_tile1 = instance_create_layer(center_x, center_y, "Environments", obj_tile);
		instance_ground_tile1 = instance_create_layer(center_x, center_y, "Environments", obj_tile);
		break;
	case 2:
		break;
}
global.instance_player1 = instance_create_layer(960, 100, "Instances", obj_player1, {image_xscale: 2, image_yscale: 2});
global.instance_player2 = instance_create_layer(960, 100, "Instances", obj_player1, {image_xscale: 2, image_yscale: 2});
//global.instance_player2 = instance_create_layer(200, 200, "Instances", obj_player2, {image_xscale: 2, image_yscale: 2, image_blend: c_yellow});
//var instance_player2 = instance_create(test_x, test_x, obj_player2);