// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum SKILL
{
	RECREATE = 0,
	SWORD = 1,
	ARROW = 2,
	VOLLEYBALL = 3,
}

function InvokeSkill(instance, skill)
{
	switch(skill)
	{
		case SKILL.RECREATE:
			break;
		case SKILL.SWORD:
			SkillSword(instance);
			break;
		case SKILL.ARROW:
			break;
		case SKILL.VOLLEYBALL:
			break;
		default:
			show_debug_message("default");
			break;
	}
	
}

function SkillSword(_instance)
{
	instance_create_layer(_instance.x, _instance.y, "Instances", obj_sword, {image_xscale: 3, image_yscale: 7});
}