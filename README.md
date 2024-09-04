¡Claro! Aquí tienes un ejemplo de archivo `README.md` para el sistema que describes:

---

# Sistema de Gestión Regulatoria (SGR)

Este sistema está diseñado para gestionar y analizar requerimientos regulatorios utilizando PHP, JavaScript y MariaDB. Permite el análisis automático de reportes de auditoría, el análisis de auditorías mediante puntos listados, y la carga de nuevas normativas con sus respectivos puntos a cumplir.

## Características

1. **Análisis Automático de Reportería**
   - El sistema puede generar reportes automáticos basados en archivos .pdf que contengan la descripción de auditorías ya realizadas y los compara contra requisitos regulatorios aplicables.
   - Los reportes se pueden someter al análisis de las diferentes normativas cargadas en el sistema.

2. **Análisis de Auditoría**
   - Los auditores pueden analizar el cumplimiento de los requisitos a través de una interfaz que presenta los puntos listados.
   - Los puntos pueden ser clasificados como "Aplica", "No Aplica", "Cumple" o "No Cumple" según la evaluación del auditor.

3. **Carga de Nuevas Normativas**
   - Los administradores tienen la capacidad de agregar nuevas normativas al sistema.
   - Al cargar una nueva normativa, el administrador debe ingresar los puntos específicos que deben ser cumplidos para esa normativa.

4. **Reportería**
    - Al realizar una auditoría manual el sistema genera un reporte de los puntos con los que el cliente cumple, recomendaciones para los puntos con incumplimiento y un listado de los comentarios del auditor.
    - Las recomendaciones son dinamicas y el sistema permite asignar recomendaciones a cada regulación en caso de incumplimiento.

## Requisitos

- **Servidor Web**: Apache o Nginx.
- **PHP**: Versión 7.4 o superior.
- **MariaDB**: Versión 10.4 o superior.

## Instalación

1. **Clonar el Repositorio**

   ```bash
   git clone https://github.com/PabloVillagran/gestionRegulatoria
   cd repo
   ```

2. **Configuración del Entorno**

   - Copiar el archivo de configuración de ejemplo y modificarlo con tus credenciales:

     ```bash
     cp includes/db_connect.php includes/db_connect.php.bk
     ```

   - Editar `includes/db_connect.php` con tus detalles de conexión a la base de datos:

     ```php
         <?php
            $host = 'localhost'; // Cambia según tu configuración
            $db = 'compliance_tool_db'; // Nombre de la base de datos
            $user = 'root'; // Usuario de la base de datos
            $pass = ''; // Contraseña del usuario
            ...
        ?>;
     ```
    - Editar `navbar.php` con el directorio relativo de donde se coloca la instalación
     
     ```bash
     cp navbar.php navbar.php.bk
     ```

      ```php
         <?php
            $home =  getenv("HOME").'sub-carpeta-instalacion'; // 
            ...
        ?>;
     ```

3. **Crear la Base de Datos**

   - Importar el archivo de esquema SQL para crear las tablas necesarias:

     ```bash
     mysql -u root -p gestor_regulatorio < sqls/install.sql
     ```

## Uso

1. **Acceso al Sistema**

   - Abre tu navegador web y accede a `http://localhost/`.
        ###### **NOTA:** Si el repositiorio se encuentra en una subcarpeta, modificar la URL con el nombre adecuado

2. **Administración de Normativas**

   - Navega a la sección de Normativas y utiliza el formulario para agregar nuevas normativas y sus puntos de cumplimiento.

3. **Auditoría manual**

   - Coloca el nombre del cliente a auditar y selecciona la el nombre de la ley o acuerdo con el que se realizará la auditoría.
   - Marca los puntos como "Aplicar", "No Aplicar", "Cumplir" o "No Cumplir".
   - Agrega comentarios a discreción.
   - Guarda los resultados de la auditoría, puedes revisar cada punto antes de continuar a visualizar el reporte.

4. **Generación de Reportes**

   - Se visualiza el reporte al final de guardar una auditoría.

5. **Auditoría automatizada**
    - La auditoría automatizada requiere un documento que contenga los detalles de un reporte ya realizado por algún auditor.
    - Se carga el pdf adecuado.
    - Se selecciona la regulación contra la que se comparará el reporte.
    - Al finalizar el análisis se pueden descargar los resultados para ser entregados al cliente.

## Estructura de Archivos

- `./`: Contiene los archivos con las funcionalidades principales.
- `audit/`: Subdirectorio con las funcionalidades de auditorías manuales.
- `audit/report/`: Subdirectorio con las funcionalidades backend específicas de reportería.
- `det/`: contiene las funcionalidades para la creación manual de puntos a evaluar en una auditoría.
- `includes/`: contiene la funcionalidad principal para la gestión de regulaciones.
- `scripts/`: contiene los archivos `.js` para la funcionalidad frontend.
- `sqls/`: contiene los scripts de instalación completa y un historial de los cambios realizados en la data.
- `styles/`: carpeta que contiene los estilos `.css` para la funcionalidad frontend.
- `views/`: contiene las vístas específicas para funcionalidades de edicón. (*TODO*)

## Contribuidores
- [Pablo Villagrán](https://github.com/PabloVillagran)
- [Robinson López]()
- [Omar Ramirez]()
- [Luz Santos]()
- [Steicy Juarez]()