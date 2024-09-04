-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 09:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `compliance_tool_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_det_audit` (`audit_id` INT)   BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE reg_id INT;
    SELECT regulations_id INTO @reg_id FROM audits WHERE id = @audit_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` int(11) NOT NULL,
  `date_init` datetime NOT NULL DEFAULT current_timestamp(),
  `institution_name` text NOT NULL,
  `regulations_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audits`
--
-- --------------------------------------------------------

--
-- Table structure for table `det_audit`
--

CREATE TABLE `det_audit` (
  `id` int(11) NOT NULL,
  `applies` int(1) NOT NULL DEFAULT 1,
  `check_mark` int(1) NOT NULL,
  `comments` mediumtext DEFAULT NULL,
  `audit_id` int(11) NOT NULL,
  `det_regulations_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `det_regulations`
--

CREATE TABLE `det_regulations` (
  `id` int(11) NOT NULL,
  `Description` mediumtext NOT NULL,
  `regulations_id` int(11) NOT NULL,
  `recommendation_id` int(11) DEFAULT NULL,
  `pattern` text DEFAULT '*'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `det_regulations`
--

INSERT INTO `det_regulations` (`id`, `Description`, `regulations_id`, `recommendation_id`, `pattern`) VALUES
(7, 'Se incluye la Nacionalidad del cliente como parte de los datos almacenados', 6, 11, '.*nacionalidad.*'),
(8, 'Se incluye el País de nacimiento o país de constitución del cliente como parte de los datos almacenados', 6, 11, '.*país de nacimiento|país de constitución.*'),
(9, 'Se incluye el País de domicilio del cliente como parte de los datos almacenados', 6, 11, '.*país de domicilio.*'),
(10, 'Se incluye la Profesión u oficio del cliente como parte de los datos almacenados', 6, 11, '.*profesión|oficio.*'),
(11, 'Se incluye la Zona geográfica de las actividades del negocio del cliente', 6, 11, '.*zona geográfica.*'),
(12, 'Se incluye la Actividad económica y financiera del cliente', 6, 11, '.*actividad económica|actividad financiera.*'),
(13, 'Se incluye el Tipo de estructura jurídica utilizada por el cliente para el desarrollo de sus actividades', 6, 11, '.*tipo de estructura jurídica.*'),
(14, 'Se incluye el Tipo, monto y frecuencia de las transacciones del cliente como parte de los datos almacenados', 6, 11, '.*tipo|monto|frecuencia de las transacciones.*'),
(15, 'Se incluye el Origen de los recursos financieros del cliente como parte de los datos almacenados', 6, 11, '.*origen de los recursos financieros.*'),
(16, 'Se incluye si el cliente es una persona expuesta politicamente (PEP)', 6, 11, '.*persona expuesta políticamente|PEP.*'),
(17, 'Se incluyen los Productos, servicios y canales utilizados por el cliente para sus actividades financieras', 6, 11, '.*productos|servicios|canales utilizados.*'),
(18, 'Se elabora un perfil de riesgo del cliente antes de iniciar la relación comercial', 6, 12, '.*perfil de riesgo.*'),
(19, 'Se realiza la debida diligencia sobre el beneficiario final cuando el cliente actúe como intermediario', 6, 12, '.*debida diligencia|beneficiario final.*'),
(20, 'Se obtiene información sobre el propósito de la relación comercial', 6, 12, '.*propósito de la relación comercial.*'),
(21, 'Se cumple con la evaluación del perfil financiero y transaccional del cliente', 6, 12, '.*perfil financiero|perfil transaccional.*'),
(22, 'Se documentan todas las diligencias realizadas para identificar al cliente y/o beneficiario final', 6, 12, '.*diligencias realizadas|identificación del cliente|beneficiario final.*'),
(23, 'Se someten las relaciones con clientes extranjeros a medidas de debida diligencia', 6, 12, '.*clientes extranjeros|debida diligencia.*'),
(24, 'Se identifica a los beneficiarios finales del fideicomiso', 6, 13, '.*beneficiarios finales|fideicomiso.*'),
(25, 'Se consolida toda la información requerida en un solo expediente', 6, 13, '.*información requerida|expediente.*'),
(26, 'Se identifican a los dignatarios, directores, apoderados y representantes legales de personas jurídicas', 6, 13, '.*dignatarios|directores|apoderados|representantes legales.*'),
(27, 'Se identifica al protector, asesores u otras personas en fideicomisos', 6, 13, '.*protector|asesores|personas en fideicomisos.*'),
(28, 'Se conoce al beneficiario final de personas jurídicas', 6, 13, '.*beneficiario final|personas jurídicas.*'),
(29, 'Se identefica si la persona jurídica tiene miembros provistos por un agente residente', 6, 13, '.*miembros provistos|agente residente.*'),
(30, 'Se identifica a los accionistas con un porcentaje igual o mayor al 10% por medio de documentos válidos', 6, 13, '.*accionistas|porcentaje igual o mayor al 10%|documentos válidos.*'),
(31, 'Se solicitan documentos que evidencien el nombre del beneficiario final y titular de las acciones', 6, 13, '.*documentos|nombre del beneficiario final|titular de las acciones.*'),
(32, 'Se solicita Declaración Jurada en la cual se indique la información de los propietarios de las acciones nominativas', 6, 13, '.*Declaración Jurada|propietarios de las acciones nominativas.*'),
(33, 'Se solicita Copia del certificado de acción en el que se evidencia el nombre del propietario de las acciones nominativas', 6, 13, '.*Copia del certificado de acción|nombre del propietario|acciones nominativas.*'),
(34, 'Se solicita Copia del registro de acciones', 6, 13, '.*Copia del registro de acciones.*'),
(35, 'Se solicita Certificación del agente residente donde indique las personas naturales o beneficiarios finales propietarios de las acciones nominativas', 6, 13, '.*Certificación del agente residente|propietarios de las acciones nominativas.*'),
(36, 'Se establecen políticas y procedimientos para administrar el riesgo tecnológico de las instituciones financieras', 7, 12, '.*políticas|procedimientos|risgo tecnológico|instituciones financieras.*'),
(37, 'Se crean estructuras organizacionales de TI y se capacita al personal', 7, 12, '(estructuras organizacionales|TI|capacita|personal)'),
(38, 'Se dirige la administración del riesgo tecnológico a través del comité de gestión de riesgos', 7, 12, '(administración del riesgo|comité|gestión de riesgos)'),
(39, 'Se implementan políticas y procedimientos de administración de riesgo tecnológico', 7, 12, '(políticas|procedimientos|administración de riesgo tecnológico)'),
(40, 'Se proponen políticas y manuales de administración del riesgo tecnológico', 7, 12, '(políticas|manuales|administración de riesgo tecnológico)'),
(41, 'Se analizan propuestas de políticas y se definen estrategias', 7, 12, '(propuestas de políticas|definen estrategias)'),
(42, 'Se revisan las políticas de administración de riesgo', 7, 12, '(revisan|políticas|administración de riesgo)'),
(43, 'Se apoya al comité mediante la propuesta de procedimientos y políticas para la administración del riesgo', 7, 12, '(apoya|comité|propuesta|procedimientos|políticas|administración de riesgo)'),
(44, 'Se monitorean y se analizan los riesgos tecnológicos', 7, 14, '(monitorean|analizan|riesgos tecnológicos)'),
(45, 'Se verifica el nivel de cumplimiento de las políticas y procedimientos', 7, 8, '(verifica|cumplimiento|políticas|procedimientos)'),
(46, 'Se gestiona el acceso y seguridad de bases de datos a través de un administrador', 7, 13, '(gestiona|acceso|seguridad|bases de datos|administrador)'),
(47, 'Se mantiene un esquema actualizado de la interrelación del negocio con la infraestructura de TI', 7, 12, '(supervisa|administración del riesgo tecnológico|auditorías internas)'),
(48, 'Se documentan y se implementan procesos operativos para la adquisición, mantenimiento e implementación de sistemas y bases de datos', 7, 12, '(documentan|incidentes|riesgos tecnológicos|emiten reportes)'),
(49, 'Se gestiona adecuadamente los servicios de TI con un catálogo de servicios y acuerdos de niveles de servicio', 7, 12, '(define|plan de contingencia|administración de riesgos tecnológicos)'),
(50, 'Se gestionan incidentes y se implementan procesos de cambio en la infraestructura', 7, 8, '(implementan|controles|mitigar|riesgo|infraestructura tecnológica)'),
(51, 'Se documentan metodologías para análisis, diseño, desarrollo, pruebas, puesta en producción, mantenimiento, control de versiones y calidad', 7, 13, '(revisa|cumplimiento normativo|riesgos tecnológicos|operativos)'),
(52, 'Se gestiona la seguridad de la información para proteger su integridad, confidencialidad y disponibilidad', 7, 8, '(identifican|clasifican|riesgos asociados|seguridad de la información)'),
(53, 'Se mitigan riesgos de pérdida, extracción indebida o corrupción de la información', 7, 8, '(análisis de impacto|riesgos|continuidad del negocio)'),
(54, 'Se requiere un oficial de seguridad de información para coordinar el cumplimiento de políticas y procedimientos', 7, 12, '(gestiona|riesgo de terceros|contratos|auditorías)'),
(55, 'Se gestionan incidentes de seguridad de la información', 7, 8, '(establecen métricas|evaluar|riesgo tecnológico|impacto)'),
(56, 'Se mantienen copias de respaldo de la información considerando periodicidad y procedimientos de restauración', 7, 15, '(seguimiento|incidentes de seguridad|plan de acción)'),
(57, 'Se elabora un plan de recuperación ante desastres alineado con el plan de continuidad del negocio', 7, 6, '(mitigan|riesgos de continuidad|planes de recuperación)'),
(58, 'Se promueven políticas y procedimientos de cultura de seguridad mediante capacitación y concientización', 7, 12, '(analizan|riesgos operativos|infraestructura crítica)'),
(59, 'Se generan políticas y procedimientos para gestionar ciberseguridad, incluyendo funciones de identificación, protección, detección, respuesta y recuperación', 7, 12, '(gestionan|incidentes de ciberseguridad|SOC|Centro de Operaciones de Seguridad)'),
(60, 'Se desarrollan mecanismos para resistir, responder y recuperarse de ciberataques', 7, 15, '(evalúan|proveedores críticos|impacto|seguridad tecnológica)'),
(61, 'Se monitorean los activos en ciberespacio para detectar vulnerabilidades e incidentes', 7, 14, '(revisan|políticas de seguridad|actualizan regularmente)'),
(62, 'Se organizan equipos de respuesta ante incidentes cibernéticos, dirigidos por el oficial de seguridad', 7, 12, '(auditoría externa|riesgos tecnológicos|anualmente)'),
(63, 'Se implementan planes de recuperación ante desastres que incluyan procedimientos, tiempos de restauración y roles clave', 7, 6, '(desarrollan|estrategias de mitigación|riesgos tecnológicos emergentes)'),
(64, 'Se elabora un plan de pruebas de recuperación ante desastres, con alcance, escenarios y periodicidad', 7, 6, '(capacita|personal|buenas prácticas|ciberseguridad)'),
(65, 'Se capacita al personal clave para ejecutar el plan de acción ante desastres', 7, 12, '(monitorizan|sistemas críticos|detección temprana|amenazas)'),
(66, 'Se establece un centro de cómputo alterno para garantizar la continuidad de operaciones', 7, 15, '(auditan|operaciones tecnológicas|evaluar riesgos)'),
(67, 'Se gestionan servicios de terceros mediante políticas de seguridad de información y estándares internacionales', 7, 7, '(evalúan|controles de acceso|sistemas críticos)'),
(68, 'Se cumplen los requisitos de infraestructura y seguridad para el procesamiento y almacenamiento de información fuera del territorio nacional', 7, 11, '(implementan|herramientas de monitoreo|detectar vulnerabilidades)'),
(69, 'Se cifran las comunicaciones y la información en tránsito y reposo', 7, 9, '(validan|políticas de seguridad tecnológica|periódicamente)'),
(70, 'Se establecen controles de acceso y autenticidad sin limitaciones legales para auditorías', 7, 3, '(revisan|actualizan|planes de respuesta|incidentes)'),
(71, 'Se permite a la Superintendencia de Bancos el acceso libre a la infraestructura y sistemas', 7, 3, '(reportan|incidentes de seguridad|autoridades competentes)'),
(72, 'Se contrata personal capacitado localmente para garantizar la continuidad de operaciones', 7, 12, '(supervisa|actividad de usuarios|privilegios)'),
(73, 'Se verifica que los proveedores de servicios apliquen políticas de seguridad con certificaciones vigentes', 7, 7, '(auditan|accesos|infraestructura tecnológica crítica)'),
(74, 'Se establecen procedimientos para verificar SLA y auditorías independientes de tecnología', 7, 13, '(implementan|controles adicionales|acceso remoto seguro)'),
(75, 'Se garantiza la independencia de la información y la autenticación segura en los servicios contratados', 7, 3, '(establecen|políticas de cifrado|proteger información sensible)'),
(76, 'Se envía a la Superintendencia de Bancos el manual de administración de riesgo tecnológico y el plan de recuperación ante desastres actualizados', 7, 12, '(gestionan|parches de seguridad|manera periódica)'),
(77, 'Se tiene autorización de la Superintendencia de Bancos para operar en Panamá para los canales electrónicos a operar', 8, 12, '(revisan|procedimientos de seguridad|garantizar|efectividad)'),
(78, 'Se cuenta con autorización de la Superintendencia de Bancos para incorporar nuevos servicios electrónicos', 8, 12, '(implementan|medidas de protección|datos en tránsito|reposo)'),
(79, 'Se notifica a la Superintendencia de Bancos la integración de servicios similares a los ya existentes', 8, 12, '(.*superintendencia.*servicios.*existentes)'),
(80, 'Se han sometido los servicios electrónicos a inspecciones por parte de la Superintendencia de Bancos', 8, 12, '(asegura|integridad de los datos|técnicas de validación)'),
(81, 'Se ha informado a la Superintendencia de Bancos de todos los cajeros automáticos, POS y dispositivos tecnológicos administrados', 8, 12, '(informado|Superintendencia de Bancos|cajeros automáticos|POS|dispositivos tecnológicos)'),
(82, 'Se ha implementado un sistema de gestión de riesgos asociado a las actividades de banca electrónica', 8, 15, '(sistema de gestión de riesgos|actividades de banca electrónica)'),
(83, 'Se establecen responsabilidades específicas, políticas y controles para la gestión de riesgos de los canales electrónicos', 8, 12, '(responsabilidades específicas|políticas|controles|gestión de riesgos|canales electrónicos)'),
(84, 'Se revisan y aprueban los aspectos esenciales del proceso de control de riesgos de los canales electrónicos', 8, 5, '(aspectos esenciales|proceso de control de riesgos|canales electrónicos)'),
(85, 'Se establecen procesos de diligencia y supervisión para el manejo de relaciones con proveedores externos', 8, 7, '(procesos de diligencia|supervisión|relaciones con proveedores externos)'),
(86, 'Se asegura de integrar el manual de operaciones las políticas y procedimientos relacionados con la gestión de sus activos tecnológicos', 8, 5, '(integrar|manual de operaciones|políticas|procedimientos|gestión de activos tecnológicos)'),
(87, 'Se almacena la naturaleza de las transacciones bancarias', 8, 11, '(naturaleza de las transacciones bancarias)'),
(88, 'Se cuenta con un sistema de registro de las transacciones y operaciones', 8, 11, '(sistema de registro|transacciones|operaciones)'),
(89, 'Se cuenta con mecanismos para la supervisión de los riesgos de banca electrónica, sus políticas y controles', 8, 8, '(mecanismos|supervisión|riesgos de banca electrónica|políticas|controles)'),
(90, 'Se cuenta con mecanismos para la evaluación de amenazas, vulnerabilidades e impactos', 8, 8, '(mecanismos|evaluación de amenazas|vulnerabilidades|impactos)'),
(91, 'Se cuenta con mecanismos para la gestión de incidentes de seguridad para los activos tecnológicos', 8, 8, '(mecanismos|gestión de incidentes|seguridad|activos tecnológicos)'),
(92, 'Se definen políticas y procedimientos de prevensión aplicables en caso de amenazas tecnológicas potenciales', 8, 12, '(pólizas|procedimientos de prevención|amenazas tecnológicas potenciales)'),
(93, 'Se definen políticas y procedimientos de respuesta aplicables en caso de amenazas tecnológicas potenciales', 8, 12, '(pólizas|procedimientos de respuesta|amenazas tecnológicas potenciales)'),
(94, 'Se definen políticas y procedimientos que sean aplicables en caso de violaciones a la seguridad interna y externa a la banca electrónica', 8, 12, '(pólizas|procedimientos|violaciones a la seguridad|banca electrónica)'),
(95, 'Se definen políticas y procedimientos que incluyan mecanismos de seguridad para la continuidad del negocio', 8, 12, '(pólizas|procedimientos|mecanismos de seguridad|continuidad del negocio)'),
(96, 'Se definen mecanismos de diligencia debida y vigilancia de las relaciones con terceros', 8, 7, '(mecanismos de diligencia debida|vigilancia|relaciones con terceros)'),
(97, 'Se cuenta con un plan de contiuidad de negocio y recuperación ante desastres', 8, 6, '(plan de continuidad de negocio|recuperación ante desastres)'),
(98, 'Se cuenta con un área de rieesgos responsable de la identificación, evaluación y control de riesgos tecnológicos de banca electrónica', 8, 12, '(área de riesgos|identificación|evaluación|control de riesgos tecnológicos|banca electrónica)'),
(99, 'Se realizan auditorias periódicas incorporadas al plan anual de auditoría', 8, 12, '(auditorías periódicas|plan anual de auditoría)'),
(100, 'Se cuenta con programas necesarios y personal especializado en el área de auditoría', 8, 12, '(programas necesarios|personal especializado|área de auditoría)'),
(101, 'Se realizan revisiones externas de riesgo para los canales de banca electrónica', 8, 10, '(revisiones externas|riesgo|canales de banca electrónica)'),
(102, 'Se implementan pruebas de intrusión externa por proveedores externos de servicios de seguridad', 8, 10, '(pruebas de intrusión externa|proveedores externos|servicios de seguridad)'),
(103, 'Se implementan pruebas de intrusión interna por proveedores externos de servicios de seguridad', 8, 10, '(pruebas de intrusión interna|proveedores externos|servicios de seguridad)'),
(104, 'Se realizan pruebas de intrusión por personal interno capacitado', 8, 12, '(pruebas de intrusión|personal interno capacitado)'),
(105, 'La información suministrada en internet es adecuada y permite a los clientes identificar al banco', 8, 11, '(información suministrada|internet|identificar al banco)'),
(106, 'La información publicada sobre los servicios de banca electrónica es correcta y actualizada', 8, 11, '(información publicada|servicios de banca electrónica|correcta|actualizada)'),
(107, 'Se establecen medidas técnicas que aseguran la observancia de las condiciones de privacidad de los clientes y sus operaciones', 8, 1, '(medidas técnicas|observancia de condiciones de privacidad|clientes|operaciones)'),
(108, 'Se adoptan medidas de privacidad aplicable a los productos y servicios de los canales de banca electrónica', 8, 3, '(medidas de privacidad|productos|servicios|canales de banca electrónica)'),
(109, 'Se establecen programas que garanticen la disponibilidad de los sistemas y servicios de banca electronica', 8, 15, '(programas|garantizar disponibilidad|sistemas|servicios de banca electrónica)'),
(110, 'Se desarrollan planes de respuesta y comunicación de incidentes para la gestión, detención y metigación de fallas de seguridad', 8, 6, '(plans de respuesta|comunicación de incidentes|gestión|detención|mitigación|fallas de seguridad)'),
(111, 'Se cuenta con sistemas de administración para casos de fraude relacionados con los servicios de banca electrónica', 8, 11, '(sistemas de administración|fraude|servicios de banca electrónica)'),
(112, 'Los sistemas cuentan con un registro de manipulación o alteración de datos con hora y fecha de la operación', 8, 11, '(registro de manipulación|alteración de datos|hora|fecha de la operación)'),
(113, 'Las bitácoras contienen el registro de acceso a los canales electrónicos, con identificación de usuario y hora de acceso', 8, 11, '(bitácoras|registro de acceso|canales electrónicos|identificación de usuario|hora de acceso)'),
(114, 'Las bitácoras contienen Detalle de las operaciones monetarias realizadas, tales como fecha, hora, canal acceso, monto, cuenta origen y cuenta destino y el tipo de transacción', 8, 11, '(detalle de operaciones monetarias|fecha|hora|canal acceso|monto|cuenta origen|cuenta destino|tipo de transacción)'),
(115, 'Las bitacoras cuentan con datos que permitan realizar investigaciones sobre los canales electrónicos', 8, 11, '(bitácoras|datos|investigaciones|canales electrónicos)'),
(116, 'La banca por internet cuenta con bitacoras de webserver, el método HTTP, la URI, y el timestamp', 8, 11, '(banca por internet|bitácoras de webserver|método HTTP|URI|timestamp)'),
(117, 'Se lleva un registro de transacciones adecuado al código de comercio', 8, 11, '(registro de transacciones|código de comercio)'),
(118, 'Se informa al cliente de las características, condiciones y costos del uso de servicios electrónicos', 8, 12, '(información|características|condiciones|costos|servicios electrónicos)'),
(119, 'Se cuenta con DMZ', 8, 15, '(DMZ)'),
(120, 'Se cuenta con servidor de Logs', 8, 15, '(servidor de Logs)'),
(121, 'Se cuenta con sistemas IPS o IDS', 8, 15, '(sistemas IPS|IDS)'),
(122, 'Se almacenan los logs de los IPS o IDS por al menos 1 año', 8, 11, '(almacenan logs|IPS|IDS|1 año)'),
(123, 'Se cuenta con un método digital para que el cliente pueda identificar el banco al que corresponden sus actividades', 8, 11, '(método digital|identificar el banco|actividades)'),
(124, 'Se comparte al cliente el nombre completo de la cuenta y su última hora de ingreso al servcicio para su conocimiento', 8, 11, '(nombre completo|cuenta|última hora de ingreso|servicio)'),
(125, 'Las plataformas de banca en internet cuentan con contraseñas de como mínimo 8 caracteres', 8, 11, '(plataformas de banca en internet|contraseñas|minimo 8 caracteres)'),
(126, 'Las plataformas de banca en internet cuentan con otro factor de autenticación', 8, 11, '(plataformas de banca en internet|otro factor de autenticación)'),
(127, 'Se implementan controles de autenticación para pago móvil', 8, 11, '(controles de autenticación|pago móvil)'),
(128, 'Se implementan controles de seguridad para proteger la transmisión de la información sensible del cliente en plataformas de pago móvil', 8, 9, '(controles de seguridad|transmisión de información sensible|plataformas de pago móvil)'),
(129, 'Los cajeros automáticos identifican al cliente a través del número de la tarjeta bancaria', 8, 11, '(cajeros automáticos|identifican al cliente|número de tarjeta bancaria)'),
(130, 'Los cajeros automáticos cuentan con factor de autenticación de PIN', 8, 11, '(cajeros automáticos|factor de autenticación|PIN)'),
(131, 'Los cajeros automáticos cuentan con un sistema adecuado al circuito integrado', 8, 11, '(cajeros automáticos|sistema adecuado|circuito integrado)'),
(132, 'Los cajeros automáticos cuentan con mecanismos para proteger la información confidencial del cliente', 8, 11, '(cajeros automáticos|mecanismos de protección|información confidencial)'),
(133, 'Los cajeros automáticos cifran las comunicaciones', 8, 11, '(cajeros automáticos|cifran comunicaciones)'),
(134, 'Los cajeros automáticos cuentan con cámaras de circuito cerrado y grabación de imagenes', 8, 15, '(cajeros automáticos|cámaras de circuito cerrado|grabación de imágenes)'),
(135, 'Se conservan los videos grabados por los cajeros automáticos por 12 meses', 8, 15, '(videos grabados|cajeros automáticos|12 meses)'),
(136, 'Los POS identifican al cliente a través del número de tarjeta bancaria', 8, 11, '(POS|identifican al cliente|número de tarjeta bancaria)'),
(137, 'Los POS cuentan con PIN de autenticación', 8, 11, '(POS|PIN de autenticación)'),
(138, 'Los POS cuentan con mecanismos para proteger la información confidencial del cliente', 8, 3, '(POS|mecanismos de protección|información confidencial)'),
(139, 'Los POS cifran las comunicaciones', 8, 9, '(POS|cifran comunicaciones)'),
(140, 'Los POS cumplen con medidas de seguridad establecidas para los medios de pago electrónico', 8, 11, '(POS|medidas de seguridad|medios de pago electrónico)'),
(141, 'La banca telefónica con audio-respuesta asigna un identificador único de cliente con al menos seis caracteres', 8, 11, '(banca telefónica|audio-respuesta|identificador único|seis caracteres)'),
(142, 'La banca telefónica con audio-respuesta requiere un factor de autenticación con contraseña de al menos seis dígitos para transacciones a terceros', 8, 11, '(banca telefónica|audio-respuesta|factor de autenticación|contraseña|seis dígitos|transacciones a terceros)'),
(143, 'La banca telefónica voz a voz asigna un identificador único de cliente con al menos seis caracteres', 8, 11, '(banca telefónica|voz a voz|identificador único|seis caracteres)'),
(144, 'La banca telefónica voz a voz utiliza cuestionarios para autenticar la información sensible del cliente', 8, 11, '(banca telefónica|voz a voz|cuestionarios|autenticar|información sensible)'),
(145, 'Las redes especializadas emplean certificados digitales para validar la legitimidad de las transacciones', 8, 9, '(redes especializadas|certificados digitales|validar legitimidad|transacciones)'),
(146, 'Las redes especializadas establecen enlaces cifrados con el más alto nivel de seguridad disponible', 8, 9, '(redes especializadas|enlaces cifrados|seguridad disponible)'),
(147, 'Las redes especializadas cuentan con servidores de bastión para proteger los repositorios de información del banco', 8, 15, '(redes especializadas|servidores de bastión|repositorios de información|banco)'),
(148, 'Las redes especializadas garantizan la integridad y no repudio de las transacciones', 8, 9, '(redes especializadas|garantizan|integridad|no repudio|transacciones)'),
(149, 'La mensajería instantánea, redes sociales y correos electrónicos se limitan a suministrar información autorizada por contrato con el cliente', 8, 12, '(mensajería instantánea|redes sociales|correos electrónicos|información autorizada|contrato con el cliente)'),
(150, 'La banca electrónica verifica la identidad y autorización de nuevos clientes', 8, 12, '(banca electrónica|verifica identidad|autorización|nuevos clientes)'),
(151, 'La banca electrónica preserva la confidencialidad e integridad de la información transmitida', 8, 1, '(banca electrónica|preserva|confidencialidad|integridad|información transmitida)'),
(152, 'La banca electrónica garantiza la no renuncia de transacciones y confirma la ejecución de las mismas', 8, 11, '(banca electrónica|no renuncia|transacciones|confirma ejecución)'),
(153, 'La banca electrónica segrega responsabilidades para reducir el riesgo de fraude en procesos y sistemas', 8, 11, '(banca electrónica|segrega responsabilidades|reducción del riesgo de fraude|procesos|sistemas)'),
(154, 'La banca electrónica cuenta con una estructura física protegida para servidores y bases de datos', 8, 15, '(banca electrónica|estructura física|servidores|bases de datos)'),
(155, 'La banca electrónica mantiene registros de transacciones y asegura su integridad', 8, 11, '(banca electrónica|mantiene registros|transacciones|asegura integridad)'),
(156, 'La banca electrónica tiene controles internos para la apertura, modificación y cancelación de cuentas', 8, 11, '(banca electrónica|controles internos|apertura|modificación|cancelación de cuentas)'),
(157, 'La banca electrónica asegura la correcta asignación de responsabilidades en caso de irregularidades en el servicio', 8, 11, '(banca electrónica|asignación de responsabilidades|irregularidades|servicio)'),
(158, 'Se reportan incidentes de seguridad a la Superintendencia de Bancos', 8, 12, '(reportan incidentes de seguridad|Superintendencia de Bancos)'),
(159, 'Se emplean técnicas de control como criptografía para garantizar la privacidad de la información del cliente', 8, 1, '(técnicas de control|criptografía|garantizar privacidad|información del cliente)'),
(160, 'Se instruye a los clientes sobre la protección de su información bancaria personal', 8, 12, '(instruye a los clientes|protección|información bancaria personal)'),
(161, 'El proveedor de seguridad de la banca electrónica debe contar con personal idóneo y estar autorizado por la Superintendencia', 8, 10, '(proveedor de seguridad|banca electrónica|personal idóneo|autorizado por la Superintendencia)'),
(162, 'Se remiten a la Superintendencia reportes relacionados con la banca electrónica', 8, 12, '(remiten reportes|Superintendencia|banca electrónica)'),
(163, 'Se aplican políticas para prevenir el uso indebido de los servicios de banca electrónica', 8, 12, '(pólizas|prevención|uso indebido|servicios de banca electrónica)'),
(164, 'Se asegura la identificación y seguimiento de transacciones sospechosas en la banca electrónica', 8, 8, '(identificación|seguimiento|transacciones sospechosas|banca electrónica)');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `description` mediumtext DEFAULT NULL COMMENT 'Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`id`, `description`) VALUES
(1, 'Asegúrate de que el software almacene datos sensibles del cliente de forma segura, cumpliendo con normas de privacidad y confidencialidad.'),
(2, 'Integra la seguridad desde las primeras etapas del desarrollo, con controles de acceso, autenticación multifactor y protección contra ciberataques.'),
(3, 'Implementa mecanismos seguros de autenticación para servicios electrónicos y móviles'),
(4, 'Implementa mecanismos seguros de autenticación para cajeros automáticos'),
(5, 'Desarrolla políticas y manuales claros para la administración de riesgos tecnológicos.'),
(6, 'Elabora planes de recuperación alineados con la continuidad de negocio, y realiza pruebas regulares de estos planes para asegurar que el personal esté preparado.'),
(7, 'Establece estándares claros para la selección y monitoreo de proveedores, asegurando que cumplan con normativas de seguridad.'),
(8, 'Implementa mecanismos de reporte automático de incidentes de seguridad e información relevante para las auditorías de los canales electrónicos.'),
(9, 'Implementa políticas de encriptación en tránsito y reposo para proteger la información sensible del cliente.'),
(10, 'Busca apoyo de expertos en ciberseguridad para realizar pruebas de intrusión'),
(11, 'Realiza un proyecto de parcheo en las plataformas que incumplen con los requerimientos legales'),
(12, 'Ajusta las políticas empresariales para cumplir con los requisitos de información y documentación de la normativa'),
(13, 'Ajusta los procesos empresariales para cumplir con los requisitos de información y documentación de la normativa'),
(14, 'Implementa sistemas de monitoreo y alerta para detectar actividades en la infraestructura de la emrpesa'),
(15, 'Implementa sistemas e infraestructura para garantizar la disponibilidad de los sistemas y su información');

-- --------------------------------------------------------

--
-- Table structure for table `regulations`
--

CREATE TABLE `regulations` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `country` varchar(150) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regulations`
--

INSERT INTO `regulations` (`id`, `name`, `country`, `date`) VALUES
(6, 'Acuerdo No. 006-2022', 'Panamá', '2022-06-14'),
(7, 'Resolución JM-104-2021', 'Guatemala', '2022-11-30'),
(8, 'Acuerdo No. 006-2011', 'Panamá', '2011-12-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `det_audit`
--
ALTER TABLE `det_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `det_regulations`
--
ALTER TABLE `det_regulations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regulations`
--
ALTER TABLE `regulations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `det_audit`
--
ALTER TABLE `det_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `det_regulations`
--
ALTER TABLE `det_regulations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `regulations`
--
ALTER TABLE `regulations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
