///achievements_init()
/*
*  This system is used to set retrieve an achievements.
*  
*  You can add an achievement using the script achievement_add(id, name, description, sprite , secret, activated).
*  The id of the achievement should identify the achievement and the same id shouldn't be used twice.
*  The name of the achievement is you wat it to be.
*  The description should describe the achievement or should give an hint on how to optain it.
*  The sprite should be size 64x64
*  Secret determines whether the description and the image of this achievement should be visible when it is not optained
*  Secret is optional 
*  
*  You can remove an achievement using the script achievement_remove(id).
*  
*/

globalvar achievements;

achievements = ds_map_create();
