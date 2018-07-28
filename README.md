# Info
Para la parte 1, en los archivos .feature, las condiciones de datos de prueba se indican en los escenarios definidos.

Para la parte 2, considerar que en el archivo .Java se deben editar los datos: usuario, password y busqueda, dado que las pruebas se realizaron con mi cuenta personal de Linkedin
Se debe comentar las siguientes líneas, para que no se guarde la Experiencia, ya que son textos de prueba:

WebElement guardar =driver.findElement(By.cssSelector(".pe-form-footer__action--submit"));
		guardar.submit();
		pausa(driver, 5);
Se incorpora el driver para Internet explorer, pero dado que en mi computador personal tengo Linux instalado no fue posible probar si funcionaba con IE, por lo que esas líneas están comentadas
