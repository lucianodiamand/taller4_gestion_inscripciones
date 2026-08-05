
export interface UsuarioRequestDTO {
	username:string;
	password:string;
	
}
    
export interface UsuarioResponseDTO {
	id:number;
	username:string;
	rol:string;
	token:string;
}

export interface UsuarioRegisterRequestDTO {
	username:string;
	password:string;
	nombre:string;
	apellido:string;
	email:string;
	edad:number;
	tipoDocumento:string;
	numeroDocumento:string;
}