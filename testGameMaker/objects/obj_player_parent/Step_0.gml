/// @description Insert description here
// You can write your code in this editor

if(GetIsOnGround()) // 땅에 있을 때
{
	vspeed = 0;
	if(GetInputLeft())
	{
		MoveLandAlongEdge(-1);
	}
	else if(GetInputRight())
	{
		MoveLandAlongEdge(1);
	}
}
else // 공중에 있을 때
{
	 vspeed += gravity_strength; // 중력에 따른 속도 증가
	 y += vspeed;
	if(GetInputLeft())
	{
		MoveHorizontal(-1);
	}
	else if(GetInputRight())
	{
		MoveHorizontal(1);
	}
}
