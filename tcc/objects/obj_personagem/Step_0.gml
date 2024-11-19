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

//mudar sprite na hora de andar
if hvelocidade > 0 {
	sprite_index = spr_personagem_andando
}else if hvelocidade <= -1{
	sprite_index = spr_personagem_andando
}else if vvelocidade > 0{
	sprite_index = spr_personagem_andando
}else if vvelocidade <= -1{
	sprite_index = spr_personagem_andando
}else{
	sprite_index = spr_personagem
}

//"seguir" cursor do mouse
var _dire = point_direction(x,y,mouse_x,mouse_y)+45/90;

image_angle = _dire


#endregion
