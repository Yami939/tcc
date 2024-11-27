// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_estado_personagem(){
if normal = true{
#region movimentação
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

//andar esquerda e direita
hvelocidade = (direita - esquerda) * velocidade;

//andar cima e baixo
vvelocidade = (baixo - cima) * velocidade;

#endregion

#region colisão perfeita

//colisão horizontal
if place_meeting(x + hvelocidade,y,obj_parede){
	while !place_meeting(x + sign(hvelocidade), y, obj_parede){
		x += sign(hvelocidade);	
	}
	
		hvelocidade = 0;
	
}

x += hvelocidade;

//colisão vertical
if place_meeting(x,y + vvelocidade, obj_parede){
	while !place_meeting(x, y + sign(vvelocidade), obj_parede){
		y += sign(vvelocidade);
	}
	
	vvelocidade = 0;
	
}

y += vvelocidade;

//"seguir" cursor do mouse
var _dire = point_direction(x,y,mouse_x,mouse_y)+45/90;

image_angle = _dire

#endregion

#region trocar sprite

 if keyboard_check(ord("D")){
	 sprite_index = spr_personagem_andando
 }else if keyboard_check(ord("A")){
	 sprite_index = spr_personagem_andando
 }else if keyboard_check(ord("W")){
	 sprite_index = spr_personagem_andando
 }else if keyboard_check(ord("S")){
	 sprite_index = spr_personagem_andando
 }else{
	 sprite_index = spr_personagem
 }


#endregion
}else if revolver = true{
#region movimentação
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

//andar esquerda e direita
hvelocidade = (direita - esquerda) * velocidade;

//andar cima e baixo
vvelocidade = (baixo - cima) * velocidade;

#endregion

#region colisão perfeita

//colisão horizontal
if place_meeting(x + hvelocidade,y,obj_parede){
	while !place_meeting(x + sign(hvelocidade), y, obj_parede){
		x += sign(hvelocidade);	
	}
	
		hvelocidade = 0;
	
}

x += hvelocidade;

//colisão vertical
if place_meeting(x,y + vvelocidade, obj_parede){
	while !place_meeting(x, y + sign(vvelocidade),obj_parede){
		y += sign(vvelocidade);
	}
	
	vvelocidade = 0;
	
}

y += vvelocidade;



//"seguir" cursor do mouse
var _dire = point_direction(x,y,mouse_x,mouse_y)+45/90;

image_angle = _dire




#endregion

#region trocar sprite


 if keyboard_check(ord("D")){
	 sprite_index = spr_personagem_andando_revolver
 }else if keyboard_check(ord("A")){
	 sprite_index = spr_personagem_andando_revolver
 }else if keyboard_check(ord("W")){
	 sprite_index = spr_personagem_andando_revolver
 }else if keyboard_check(ord("S")){
	 sprite_index = spr_personagem_andando_revolver
 }else{
	 sprite_index = spr_personagem_revolver
 }
#endregion

#region jogar arma

if keyboard_check(ord("Q")) and revolver = true{
	var inst = instance_create_layer(x + 50, y, "Instances", obj_revolver);
	inst.direction = image_angle;
	inst.image_angle = image_angle;
	revolver = false
	normal = true;
}

#endregion

#region criar tiro
if mouse_check_button_pressed(mb_left){
	var inst = instance_create_layer(x, y, "Instances", obj_tiro);
	inst.speed = 6;
	inst.direction = _dire;
	inst.image_angle = _dire;

}
#endregion
}else if metralhadora = true{
#region movimentação
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

//andar esquerda e direita
hvelocidade = (direita - esquerda) * velocidade;

//andar cima e baixo
vvelocidade = (baixo - cima) * velocidade;

#endregion

#region colisão perfeita

//colisão horizontal
if place_meeting(x + hvelocidade,y,obj_parede){
	while !place_meeting(x + sign(hvelocidade), y, obj_parede){
		x += sign(hvelocidade);	
	}
	
		hvelocidade = 0;
	
}

x += hvelocidade;

//colisão vertical
if place_meeting(x,y + vvelocidade, obj_parede){
	while !place_meeting(x, y + sign(vvelocidade),obj_parede){
		y += sign(vvelocidade);
	}
	
	vvelocidade = 0;
	
}

y += vvelocidade;



//"seguir" cursor do mouse
var _dire = point_direction(x,y,mouse_x,mouse_y)+45/90;

image_angle = _dire




#endregion

#region trocar sprite


 if keyboard_check(ord("D")){
	 sprite_index = spr_personagem_andando_metralhadora
 }else if keyboard_check(ord("A")){
	 sprite_index = spr_personagem_andando_metralhadora
 }else if keyboard_check(ord("W")){
	 sprite_index = spr_personagem_andando_metralhadora
 }else if keyboard_check(ord("S")){
	 sprite_index = spr_personagem_andando_metralhadora
 }else{
	 sprite_index = spr_personagem_metralhadora
 }
#endregion

#region criar tiro
if mouse_check_button(mb_left){
	var inst = instance_create_layer(x, y, "Instances", obj_tiro);
	inst.speed = 6;
	inst.direction = _dire;
	inst.image_angle = _dire;
	

}
}
#endregion

#region jogar arma

if keyboard_check(ord("Q")) and metralhadora = true{
	var inst = instance_create_layer(x + 50, y, "Instances", obj_metralhadora);
	inst.direction = image_angle;
	inst.image_angle = image_angle;
	metralhadora = false
	normal = true;
}

#endregion
}