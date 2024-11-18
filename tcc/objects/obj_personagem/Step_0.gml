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

#endregion
