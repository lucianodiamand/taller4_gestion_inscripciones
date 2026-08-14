package gestion_inscripciones.backendTaller4.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	private JavaMailSender mailSender; 
	
	public EmailService(JavaMailSender mailSender) {
		this.mailSender = mailSender; 
	}
	
	public void enviarConfirmacionInscripcionCarrera(String destinatario, String nombre, String carrera) {
		SimpleMailMessage mensaje = new SimpleMailMessage();
		
		mensaje.setTo(destinatario);
		mensaje.setSubject("Confirmación de inscripción a la carrera.");
		mensaje.setText("Hola " + nombre + ":\n" + 
		"Tu inscripción a la carrera " + carrera + 
		" fue realizada correctamente.");
		
		mailSender.send(mensaje);
	}

}
