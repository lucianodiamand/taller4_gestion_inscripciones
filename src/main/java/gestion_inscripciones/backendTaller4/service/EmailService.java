package gestion_inscripciones.backendTaller4.service;

import org.springframework.mail.SimpleMailMessage; // para poder utilizar su clase 
import org.springframework.mail.javamail.JavaMailSender; // interfaz de spring
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	private JavaMailSender mailSender; // objeto que permite enviar mails por medio de spring, que proporciona la implementación y no hace falta hacer new..
	
	public EmailService(JavaMailSender mailSender) { // inyeccion de dependencia por constructor
		this.mailSender = mailSender; 
	}
	
	public void enviarConfirmacionInscripcionCarrera(String destinatario, String nombre, String carrera) {
		SimpleMailMessage mensaje = new SimpleMailMessage(); // creamos un objeto de la clase..
		
		mensaje.setTo(destinatario); // setteamos destinatario
		mensaje.setSubject("Confirmación de inscripción a la carrera."); // setteamos asunto
		mensaje.setText("Hola " + nombre + ":\n" + // setteamos contenido del mensaje a enviar
		"Tu inscripción a la carrera " + carrera + 
		" fue realizada correctamente.");
		
		mailSender.send(mensaje); // se envia el mail 
	}

}
