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
	
	method altrura() = 20
	method defensa() = defensa
	method valorQueOtorra() = defensa * 0.2
	method reciveDmg(arma){
		defensa = defensa-arma.potencia()
	}
	method recibirTrabajo() {defensa = 200.min(defensa + 20)}
}

object aurora {
	var vida = true
	
	method altura() {return 1}
	method reciveDmg(arma){
		if(arma.potencia() > 9){vida = false}
		else{}
	}
	method valorQueOtorra() = 15
	method recibirTrabajo() {}
}

object tipa {
	var tamanio = 8
	
	method altura(){return tamanio }
	method valorQueOtorra() = tamanio * 2
	method recibirTrabajo() {tamanio += 1}
}