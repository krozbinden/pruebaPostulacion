package com.krozbinden.webautomation;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.support.ui.Select;



public class PruebaCZ {
	
	private static WebDriver driver = null;
	
	@BeforeClass
	public static void initDriver() {
		System.setProperty("webdriver.chrome.driver", "drivers/chromedriver");
		driver = new ChromeDriver();
		// Driver para utilizar Internet Explorer
		//System.setProperty("webdriver.IE.driver", "drivers/IEDriverServer.exe");
		//driver = new InternetExplorerDriver();
		driver.manage().window().maximize();
	}

	@AfterClass
	public static void closeDriver() {
		driver.quit();
	}

	@Test
	public void Escenario1() {
		
		driver.get("https://www.google.com");
		
		WebElement buscar =driver.findElement(By.id("lst-ib"));
		pausa(driver, 2);
		buscar.sendKeys("linkedin");
		pausa(driver, 2);
		buscar.sendKeys(Keys.RETURN);
		
		WebElement linkAcceso = driver.findElement(By.xpath("//*[@id=\"rso\"]/div[1]/div/div/div/div/h3/a"));
		linkAcceso.click();
		pausa(driver, 2);
		
		WebElement usuario =driver.findElement(By.id("login-email"));
		pausa(driver, 1);
		usuario.sendKeys("tucorreo@mail.com"); // Ingresar email
		
		WebElement password =driver.findElement(By.id("login-password"));
		pausa(driver, 2);
		password.sendKeys("password"); // Ingresar clave
		
		WebElement ingresar = driver.findElement(By.id("login-submit"));
		ingresar.click();
		
		WebElement miRed = driver.findElement(By.xpath("//*[@id=\"mynetwork-tab-icon\"]"));
		miRed.click();
		pausa(driver, 2);
		WebElement verTodo =driver.findElement(By.cssSelector(".mn-connections-summary__see-all"));
		verTodo.click();
		pausa(driver, 2);
				
		WebElement busqueda =driver.findElement(By.cssSelector(".mn-connections__search-input"));
		busqueda.click();
		busqueda.sendKeys("Nombre"); //Ingresar nombre y apellido del contacto
		pausa(driver, 2);
		
		WebElement verContacto =driver.findElement(By.cssSelector(".mn-connection-card__name"));
		verContacto.click();
		pausa(driver, 2);
			
		WebElement verMiPerfil = driver.findElement(By.xpath("//*[@id=\"nav-settings__dropdown-trigger\"]/div/span[2]/li-icon"));
		verMiPerfil.click();
		pausa(driver, 2);
		driver.findElement(By.partialLinkText("perfil")).click();
		pausa(driver, 2);
		
		WebElement agregarSeccion =driver.findElement(By.cssSelector(".pe-hub-section__expand-button-icon"));
		agregarSeccion.click();
		pausa(driver, 2);
				
		WebElement abrirAgregarExp = driver.findElement(By.id("background-drawer"));
		abrirAgregarExp.click();
	
		pausa(driver, 2);
		
		WebElement agregarExp = driver.findElement(By.id("position-card"));
		agregarExp.click();
	
		pausa(driver, 2);
		
		WebElement cargo =driver.findElement(By.id("position-title-typeahead"));
		cargo.sendKeys("Cargo de prueba");
		pausa(driver, 2);
		
		WebElement empresa =driver.findElement(By.id("position-company-typeahead"));
		empresa.sendKeys("Empresa de prueba");
		pausa(driver, 2);
		
		WebElement ubicacion =driver.findElement(By.id("position-location-typeahead"));
		ubicacion.sendKeys("Ciudad de prueba");
		pausa(driver, 2);
		
		Select year = new Select (driver.findElement(By.name("startYear")));
		year.selectByVisibleText("2018");
		pausa(driver, 2);
				
		WebElement descripcion =driver.findElement(By.id("position-description"));
		descripcion.sendKeys("Descripción de prueba");
		pausa(driver, 2);
		
		WebElement compartir =driver.findElement(By.cssSelector(".toggle-switch"));
		compartir.click();
		pausa(driver, 2);
			
		WebElement guardar =driver.findElement(By.cssSelector(".pe-form-footer__action--submit"));
		guardar.submit();
		pausa(driver, 5);
			
				
	}
	
		
	   public void pausa(WebDriver driver, int segundos){
	       
		      synchronized(driver){
		         try {
		            driver.wait(segundos * 1000);
		         } catch (InterruptedException e) {
		             e.printStackTrace();
		         }
		      }
		   }
}
