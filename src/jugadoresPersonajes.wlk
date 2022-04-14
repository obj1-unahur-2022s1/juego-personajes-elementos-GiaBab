object luisa {
	
}


object floki {
	var arma
	
	method encontrar(elemento){
		arma = elemento
	}
}


object mario {
	var valorRecolectado = 0
	
	method encontrar(elemento){}
}

object ballesta {
	var flechas = 10
	
	method potencia() {return 4}
	method usar() {flechas -= 1}
	method estaCargada() {return flechas > 0}
}

object jabalina {
	var carga = true
	
	method potencia() {return 30}
	method usar() {carga=false}
	method estaCargada() {return carga}
}

object castillo {
	var defensa = 150
	
	method altrura(){return 20}
	method reciveDmg(arma){
		defensa = defensa-arma.potencia()
	}
}

object aurora {
	var vida = 1
	
	method altura() {return 1}
	method reciveDmg(arma){
		if(arma.potencia() > 9){vida -= 1}
		else{}
	}
}

object tipa {
	
	method altura(){return 8 }
}