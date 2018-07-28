Feature: Aumento de Cupo
	Como usuario 
	Quiero realizar un aumento de cupo de tarjeta de crédito

Scenario: tarjeta de crédito se encuentra bloqueada
	Given la tarjeta se encuentra en estado bloqueada
	When ingreso a la funcionalidad de aumento de cupo
	Then se muestra mensaje indicando que no es posible realizar la operación

Scenario: sistema de solicitud de aumento de cupo no disponible
	Given se produce un error al generar la solicitud de aumento de cupo
	When realizo una solicitud de aumento de cupo
	Then se muestra mensaje de error de sistema, indicando que no es posible realizar la operación

Scenario: ingresar monto a solicitar en pesos y dólares que supere el máximo permitido
	Given existe un monto límite para solicitar aumento de cupo
	When ingreso monto a solicitar mayor al máximo permitido
	Then se muestra mensaje informativo, indicando que el monto ingresado supera el máximo permitido

Scenario: ingresar monto a solicitar en pesos y dólares inferior al cupo actual
	Given la tarjeta de crédito posee un cupo asignado en pesos y dólares
	When ingreso un monto inferior al actual
	Then se muestra mensaje informativo, indicando que el nuevo cupo debe ser superior al actual
	
Scenario: ingresar monto a solicitar en pesos y dólares para tarjeta con cupo máximo
	Given la tarjeta de crédito posee el cupo máximo disponible 
	When ingreso a la opción de aumento de cupo
	Then se muestra mensaje informativo, indicando que ya no es posible aumentar el cupo de la tarjeta

Scenario: ingresar monto a solicitar en pesos y dólares con valor cero
	Given se debe ingresar un cupo mayor a cero
	When ingreso un monto igual a cero para el cupo en pesos y dólares
	Then se muestra mensaje informativo, indicando que debe ingresar un monto mayor a cero

Scenario: ingresar caracteres distintos de número para cupo en pesos y dólares
	Given el cupo de tarjeta en pesos y dólares debe ser un monto
	When ingreso otros caracteres distintos de números
	Then la caja de texto no permite el ingreso de otros caracteres distintos de números
	
Scenario: solicitar aumento de cupo sólo en pesos/dólares
	Given se requiere aumentar el cupo de la tarjeta sólo en pesos (o sólo en dólares)
	When ingreso sólo un cupo
	Then permite continuar con la solicitud

Scenario: solicitud de aumento de cupo exitosa
	Given se ingresaron montos válidos para el cupo en pesos y dólares
	When he completado los datos de la solicitud
	And acciono la opción Enviar
	Then se muestra mensaje de éxito indicando que la solicitud de aumento de cupo fue cursada correctamente





