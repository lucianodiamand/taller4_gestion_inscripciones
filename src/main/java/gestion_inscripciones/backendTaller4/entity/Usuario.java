package gestion_inscripciones.backendTaller4.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuarios")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, unique = true)
	private String username;
	
	@Column(nullable = false)
	private String password;
	
	@Enumerated(EnumType.STRING)
    @Column(nullable = false)
	private Rol rol; 
	
	@OneToOne(optional=true)
	@JoinColumn(name = "ingresante_id")
	private Ingresante ingresante;


	public Long getId() {
		return id;
	}
	public void setid(Long id) {
		this.id=id;
	}
	
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username=username;
	}
	
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password=password;
	}
	
	public Rol getrol() {
		return rol;
	}
	public void setrol(Rol rol) {
		this.rol=rol;
	}
	
	public Ingresante getingresante() {
		return ingresante;
	}
	public void setingresante(Ingresante ingresante) {
		this.ingresante = ingresante;
	}
	
	
	
}
