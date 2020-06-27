### Prueba técnica para desarrollador Evertec

Se lleva a cabo las actividades para la evalución técnica para ingreso a la compañía. Se verifica en entorno local, el cumplimiento de los criterios de evaluación.

La prueba se realiza usando el framework de PHP Symfony versión 5.1, MySql 5.7 para persistencia de datos, Nginx como servidor web y PhpMyAdmin para gestionar la base de datos.

Se crearon 5 productos que se cargan aleatoriamente en la página de inicio de la prueba. También se manejó aleatoreamente, el identificador del cliente. Algunos datos del cliente, como el documento de identidad, dirección, etc., fueron manejados dejándolos "fijos" en el código que realiza la petición de pago a la pasarela de pagos. 

Instrucciones para Mac Os o Linux. En Windows, podrían variar los comandos.

### :cloud: Clonando el proyecto desde Github

```bash
# Desde la terminal
cd ~/ruta-instalacion-prueba/
# Para Git 2.13 o superior
git clone --recurse-submodules https://github.com/perritodlp/symfony-docker.git
# Para Git 1.9 a 2.12
git clone --recursive https://github.com/perritodlp/symfony-docker.git
```

### :construction: Instalación del ambiente del proyecto


```bash
# Es necesario tener Docker instalado, incluyendo la opción Docker-compose
Instalar Docker, de acuerdo al sistema operativo usado.
# Cambiarse a la ruta
cd symfony-docker
# Estando allí, ejecutar Docker-compose y esperar a que se instale todo lo necesario
docker-compose up -d
# Luego de subir todos los contenedores, ejecutar:
docker exec -it php7-evertec-test-sf bash
# Lo dejaría en la ruta: 
/var/www/symfony
# Estando allí, ejecutar: 
composer install
```

### :alien: Visualización de la prueba 
```bash
# Se puede usar el proyecto sin necesidad del host virtual, así:
http://localhost:8086/
# Para usarlo con el hosts virtual, es necesario editar y modificar 
# el archivo /etc/hosts para agregar:
vi /etc/hosts
# Adicionar en alguna parte:
127.0.0.1 evertec-test.local
# Abrir una pestaña de navegador, abrir la siguiente dirección y probar:
http://evertec-test.local:8086/
# Usando PhpMyAdmin, verificar la base de datos evertec con cuatro tablas, así:
http://localhost:8096/
usuario: root
contraseña: root
```

### :ambulance: Algunas indicaciones necesarias

Se versionó el proyecto Symfony, internamente desde el contenedor PHP de Docker, usando el repositorio de la instalación de Symfony, quedando como submodulo de éste repositorio principal.
Por tanto, para ver los commits, se debe hacer lo siguiente:

```bash
# 1. Ingresar al contenedor y ver el historial de commits en la terminal, así:
cd ~/ruta-instalacion-prueba/symfony-docker
# Ejecutar: 
docker exec -it php7-evertec-test-sf bash
# Lo dejaría en la ruta: 
/var/www/symfony
# Estando allí, ejecutar: 
git log
# 2. Revisando el proyecto directamente en su repositorio del submodulo:
https://github.com/perritodlp/evertec-test
```

### :construction_worker: Espero que todo funcione bien!! :fire: 