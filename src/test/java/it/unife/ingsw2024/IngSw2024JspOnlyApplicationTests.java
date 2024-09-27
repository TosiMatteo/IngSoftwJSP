package it.unife.ingsw2024;

import static org.junit.jupiter.api.Assertions.assertTrue;

import it.unife.ingsw2024.services.MyService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class IngSw2024JspOnlyApplicationTests {

	@Autowired
	private MyService myService; // Supponiamo che MyService sia un bean all'interno del contesto dell'applicazione

	@Test
	void contextLoads() {
		// Verifica che il bean MyService sia stato caricato correttamente nel contesto dell'applicazione
		assertTrue(myService != null);
	}
}
