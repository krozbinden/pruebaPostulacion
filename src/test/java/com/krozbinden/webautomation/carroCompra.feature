Feature: Carro de Compra
	Como usuario 
	Quiero realizar ua compra a través de un sitio web
	
Background
	Given como cliente de la tienda 
	And me encuentro autenticado en el sitio

Scenario: realizar búsqueda ingresando mayúsculas, minúsculas, y tildes
	Given necesito realizar la búsqueda de un producto
	When ingreso el nombre del producto con la primera letra mayúscula
	Or ingreso el nombre del producto con todas las letras en mayúscula
	Or ingreso el nombre del producto con todas las letras minúsculas
	Or ingreso el nombre del producto con tilde (ej. audífonos)
	Or ingreso el nombre del producto sin tilde (ej. audifonos)
	Then se obtiene el resultado de la búsqueda
	
Scenario: realizo búsqueda y cometo un error al digitar
	Given ingreso el nombre del producto, y omito una letra por error (ej. refrigerdor)
	When ingreso el texto y realizo la búsqueda
	Then Se muestran sugerencias relacionadas al texto ingresado
	
Scenario: realizar búsqueda de productos
	Given necesito comprar una maleta
	When digito "maleta" en el buscador
	Then se obtienen las categorías: Marca, Tamaño, Precio, Color
	
Scenario: ordenar productos por categoría
	Given se requiere buscar el mejor precio
	When selecciono ordenar por precio de menor a mayor
	Then se muestra el listado de maletas ordenadas por precio
	
Scenario: producto no posee stock
	Given maleta sin stock disponible
	When selecciono el producto
	Then el botón Agregar al carro se encuentra deshabilitado
	
Scenario: sistema para obtener el stock del producto no disponible
	Given se requiere agregar el producto al carro de compras
	When selecciono el producto
	And presiono la opción de agregar al carro de compras
	Then se muestra mensaje indicando que se produjo un error al obtener el stock del producto

Scenario: agregar el máximo de unidades de un producto
	Given ingreso el máximo de unidades para un producto (10 unidades)
	When intento agregar un nuevo producto 
	Then se muestra mensaje indicando que no es posible agregar más unidades del producto seleccionado

Scenario: agregar un producto al carro de compras
	Given he seleccionado la maleta
	When selecciono la opción de agregar al carro
	Then se muestra un popup con  los datos del producto agregado, y las opciones de Ver carro de compras o seleccionar más productos
	
Scenario: eliminar producto del carro de compras
	Given he desistido de la compra de la maleta
	When me encuentro en el carro de compras
	And selecciono la opción de Eliminar del carro
	Then se elimina el producto del carro de compras, pudiendo incorporar nuevos productos
	
Scenario: configurar pago del producto
	Given he agregado uno o más productos al carro de compras
	When selecciono la opción Pagar
	Then se listan los medios de pago: Tarjeta de la tienda, Tarjeta de Crédito, WebPay
	
Scenario: configurar cantidad de cuotas
	Given he seleccionado el medio de pago
	When selecciono la cantidad de cuotas 
	Then se visualiza el monto a pagar por cada cuota pactada, cada vez que cambie la cantidad de cuotas

Scenario: ingreso de datos de tarjeta incorrectos
	Given selecciono pago con tarjeta (de la tienda o Tarjeta de Crédito)
	When ingreso número de tarjeta incorrecto
	Then se muestra mensaje "Tarjeta no válida"
	
Scenario: monto de la compra supera el cupo disponible de la tarjeta
	Given he agregado productos en el carro de compras por un monto superior al disponible
	When ingreso los datos de la tarjeta y presiono "Pagar"
	Then se muestra mensaje "El monto de la compra excede el cupo actual de la tarjeta"

Scenario: se genera un error al procesar el pago de la compra
	Given se presenta un problema en el sistema de pagos
	When he seleccionado medio de pago
	And acciono el botón Pagar
	Then se muestra mensaje indicando que no fue posible finalizar la compra dado que el sistema no está disponible
	
Scenario: se realiza compra en forma exitosa
	Given he seleccionado el medio de pago
	When acciono el botón Pagar
	Then se muestra mensaje indicando que la compra finalizó exitosamente
		

