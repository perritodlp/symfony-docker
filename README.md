### Prueba técnica para desarrollador Evertec

Se lleva a cabo las actividades para la evalución técnica para ingreso a la compañía. Se verifica en entorno local, el cumplimiento de los criterios de evaluación.

La prueba se realiza usando el framework de PHP Symfony versión 5.1, MySql 5.7 para persistencia de datos, Nginx como servidor web y PhpMyAdmin para gestionar la base de datos.

Se crearon 5 productos que se cargan aleatoriamente en la página de inicio de la prueba. También se manejó aleatoreamente, el identificador del cliente. Algunos datos del cliente, como el documento de identidad, dirección, etc., fueron manejados dejándolos "fijos" en el código que realiza la petición de pago a la pasarela de pagos. 

### :cloud: Clonando el proyecto desde Github

```bash
# Desde la terminal
cd ~/ruta-deseada/
git clone https://github.com/perritodlp/symfony-docker.git
```

### :construction: Instalación del ambiente del proyecto


```bash
# Es necesario tener Docker instalado, incluyendo la opción Docker-compose
Instalar Docker, de acuerdo al sistema operativo usado.
# Cambiarse a la ruta
cd symfony-docker
# Estando allí, ejecutar Docker-compose y esperar a que se instale todo lo necesario
docker-compose up -d
```

### :alien: Visualización
```bash
# Abrir una pestaña de navegador, abrir la siguiente dirección y probar:
http://evertec-test.local:8086/
# Verificar usando PhpMyAdmin, la base de datos evertec con cuatro tablas, así:
http://localhost:8096/
usuario: root
contraseña: root
```

### :ambulance: Indicaciones necesarias
```bash
# Se versionó el proyecto Symfony, desde el contenedor PHP de Docker, usando el repo de la instalación de Symfony. 
Por tanto, para ver los commits, se debe hacer lo siguiente:
cd ~/ruta-deseada/symfony-docker
# Ejecutar: 
docker exec -it php7-evertec-test-sf bash
# Lo dejaría en la ruta: 
/var/www/symfony
# Estando allí, ejecutar: 
git log
```

### :construction_worker: Espero que todo funcione!! :fire: 