package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.IngresanteDTO;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;


@Service // para la logica de negocio
public class IngresanteService { 
	@Autowired
    private IngresanteRepository ingresanteRepository; // para conectarse con la tabla ingresante 

    // Obtener todas las inscripciones (READ)
	public List<IngresanteDTO> obtenerTodos() {
        return ingresanteRepository.findAll()
                .stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    // Obtener por ID (READ)
	public Optional<IngresanteDTO> obtenerPorId(Long id) {
        return ingresanteRepository.findById(id)
                .map(this::convertirADTO);
    }
    
	// Guardar / Crear inscripción (CREATE)
	public IngresanteDTO guardar(IngresanteDTO dto) { // recibe el dto desde el controller 
		
		validarDocumento(dto); // primero validamos antes de crear
		
        Ingresante ingresante = new Ingresante(); // creamos el ingresante
        copiarAtributos(dto, ingresante); // metodo auxiliar para crear un ingresante 

        Ingresante guardado = ingresanteRepository.save(ingresante); // lo guardamos 
        return convertirADTO(guardado);
    }
	
	public IngresanteDTO actualizar(Long id, IngresanteDTO dto) { // recibe id del ingresante a actualizar y los nuevos datos 
		
		validarDocumento(dto); // verificamos modificaciones sean validas
		
        Ingresante ingresante = ingresanteRepository.findById(id) // lo buscamos por id 
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        copiarAtributos(dto, ingresante); // metodo auxiliar para crear un ingresante 

        Ingresante actualizado = ingresanteRepository.save(ingresante); // lo guardamos actualizado
        return convertirADTO(actualizado);
    }
    
	// Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	ingresanteRepository.deleteById(id);
    }
    
    //La validacion de documento la tomamos como una regla de negocio
    //ya que esta depende del tipo de documento a ingresar
    private void validarDocumento(IngresanteDTO dto) {
        String tipo = dto.getTipoDocumento(); // obtenemos tipo de DNI
        String numero = dto.getNumeroDocumento() != null ? dto.getNumeroDocumento().trim() : ""; // condicion ? si valor es true : si valor es false 

        // 1) DNI o Libreta Civica: Solo numeros de 7 u 8 digitos
        if ("DNI".equalsIgnoreCase(tipo) || "Libreta Cívica".equalsIgnoreCase(tipo)) { // para comprobar el tipo
            if (!numero.matches("^\\d{7,8}$")) { // debe tener entre 7 y 8 numeros o digitos
                throw new IllegalArgumentException("El " + tipo + " debe contener entre 7 y 8 números.");
            }
        }

        // 2) Pasaporte: 3 letras y 6 numeros (ej: ABC123456)
        if ("Pasaporte".equalsIgnoreCase(tipo)) {
            if (!numero.matches("^[a-zA-Z]{3}\\d{6}$")) { // exige 3 letras y luego seis numeros 
                throw new IllegalArgumentException("El Pasaporte debe tener 3 letras seguidas de 6 números.");
            }
        }
    }
    
    // Helper de mapeo
    private void copiarAtributos(IngresanteDTO dto, Ingresante entidad) { // para convertir una entidad a partir de un dto 
        entidad.setNombre(dto.getNombre());
        entidad.setApellido(dto.getApellido());
        entidad.setTipoDocumento(dto.getTipoDocumento());
        entidad.setNumeroDocumento(dto.getNumeroDocumento());
        entidad.setEdad(dto.getEdad());
        entidad.setEmail(dto.getEmail());
    }
    
    // Helper de mapeo
    private IngresanteDTO convertirADTO(Ingresante entidad) { // para crear un dto a partir de una entidad 
        IngresanteDTO dto = new IngresanteDTO();
        dto.setId(entidad.getId());
        dto.setNombre(entidad.getNombre());
        dto.setApellido(entidad.getApellido());
        dto.setTipoDocumento(entidad.getTipoDocumento());
        dto.setNumeroDocumento(entidad.getNumeroDocumento());
        dto.setEdad(entidad.getEdad());
        dto.setEmail(entidad.getEmail());
        return dto;
    }
}