-- Active: 1725171726718@@127.0.0.1@3306@compliance_tool_db
UPDATE det_regulations SET pattern = '.*nacionalidad.*' WHERE id = 7;
UPDATE det_regulations SET pattern = '.*país de nacimiento|país de constitución.*' WHERE id = 8;
UPDATE det_regulations SET pattern = '.*país de domicilio.*' WHERE id = 9;
UPDATE det_regulations SET pattern = '.*profesión|oficio.*' WHERE id = 10;
UPDATE det_regulations SET pattern = '.*zona geográfica.*' WHERE id = 11;
UPDATE det_regulations SET pattern = '.*actividad económica|actividad financiera.*' WHERE id = 12;
UPDATE det_regulations SET pattern = '.*tipo de estructura jurídica.*' WHERE id = 13;
UPDATE det_regulations SET pattern = '.*tipo|monto|frecuencia de las transacciones.*' WHERE id = 14;
UPDATE det_regulations SET pattern = '.*origen de los recursos financieros.*' WHERE id = 15;
UPDATE det_regulations SET pattern = '.*persona expuesta políticamente|PEP.*' WHERE id = 16;
UPDATE det_regulations SET pattern = '.*productos|servicios|canales utilizados.*' WHERE id = 17;
UPDATE det_regulations SET pattern = '.*perfil de riesgo.*' WHERE id = 18;
UPDATE det_regulations SET pattern = '.*debida diligencia|beneficiario final.*' WHERE id = 19;
UPDATE det_regulations SET pattern = '.*propósito de la relación comercial.*' WHERE id = 20;
UPDATE det_regulations SET pattern = '.*perfil financiero|perfil transaccional.*' WHERE id = 21;
UPDATE det_regulations SET pattern = '.*diligencias realizadas|identificación del cliente|beneficiario final.*' WHERE id = 22;
UPDATE det_regulations SET pattern = '.*clientes extranjeros|debida diligencia.*' WHERE id = 23;
UPDATE det_regulations SET pattern = '.*beneficiarios finales|fideicomiso.*' WHERE id = 24;
UPDATE det_regulations SET pattern = '.*información requerida|expediente.*' WHERE id = 25;
UPDATE det_regulations SET pattern = '.*dignatarios|directores|apoderados|representantes legales.*' WHERE id = 26;
UPDATE det_regulations SET pattern = '.*protector|asesores|personas en fideicomisos.*' WHERE id = 27;
UPDATE det_regulations SET pattern = '.*beneficiario final|personas jurídicas.*' WHERE id = 28;
UPDATE det_regulations SET pattern = '.*miembros provistos|agente residente.*' WHERE id = 29;
UPDATE det_regulations SET pattern = '.*accionistas|porcentaje igual o mayor al 10%|documentos válidos.*' WHERE id = 30;
UPDATE det_regulations SET pattern = '.*documentos|nombre del beneficiario final|titular de las acciones.*' WHERE id = 31;
UPDATE det_regulations SET pattern = '.*Declaración Jurada|propietarios de las acciones nominativas.*' WHERE id = 32;
UPDATE det_regulations SET pattern = '.*Copia del certificado de acción|nombre del propietario|acciones nominativas.*' WHERE id = 33;
UPDATE det_regulations SET pattern = '.*Copia del registro de acciones.*' WHERE id = 34;
UPDATE det_regulations SET pattern = '.*Certificación del agente residente|propietarios de las acciones nominativas.*' WHERE id = 35;
UPDATE det_regulations SET pattern = '.*políticas|procedimientos|risgo tecnológico|instituciones financieras.*' WHERE id = 36;
UPDATE det_regulations
SET pattern = '(estructuras organizacionales|TI|capacita|personal)'
WHERE id = 37;
UPDATE det_regulations
SET pattern = '(administración del riesgo|comité|gestión de riesgos)'
WHERE id = 38;
UPDATE det_regulations
SET pattern = '(políticas|procedimientos|administración de riesgo tecnológico)'
WHERE id = 39;
UPDATE det_regulations
SET pattern = '(políticas|manuales|administración de riesgo tecnológico)'
WHERE id = 40;
UPDATE det_regulations
SET pattern = '(propuestas de políticas|definen estrategias)'
WHERE id = 41;
UPDATE det_regulations
SET pattern = '(revisan|políticas|administración de riesgo)'
WHERE id = 42;
UPDATE det_regulations
SET pattern = '(apoya|comité|propuesta|procedimientos|políticas|administración de riesgo)'
WHERE id = 43;
UPDATE det_regulations
SET pattern = '(monitorean|analizan|riesgos tecnológicos)'
WHERE id = 44;
UPDATE det_regulations
SET pattern = '(verifica|cumplimiento|políticas|procedimientos)'
WHERE id = 45;
UPDATE det_regulations
SET pattern = '(gestiona|acceso|seguridad|bases de datos|administrador)'
WHERE id = 46;
UPDATE det_regulations
SET pattern = '(supervisa|administración del riesgo tecnológico|auditorías internas)'
WHERE id = 47;
UPDATE det_regulations
SET pattern = '(documentan|incidentes|riesgos tecnológicos|emiten reportes)'
WHERE id = 48;
UPDATE det_regulations
SET pattern = '(define|plan de contingencia|administración de riesgos tecnológicos)'
WHERE id = 49;
UPDATE det_regulations
SET pattern = '(implementan|controles|mitigar|riesgo|infraestructura tecnológica)'
WHERE id = 50;
UPDATE det_regulations
SET pattern = '(revisa|cumplimiento normativo|riesgos tecnológicos|operativos)'
WHERE id = 51;
UPDATE det_regulations
SET pattern = '(identifican|clasifican|riesgos asociados|seguridad de la información)'
WHERE id = 52;
UPDATE det_regulations
SET pattern = '(análisis de impacto|riesgos|continuidad del negocio)'
WHERE id = 53;
UPDATE det_regulations
SET pattern = '(gestiona|riesgo de terceros|contratos|auditorías)'
WHERE id = 54;
UPDATE det_regulations
SET pattern = '(establecen métricas|evaluar|riesgo tecnológico|impacto)'
WHERE id = 55;
UPDATE det_regulations
SET pattern = '(seguimiento|incidentes de seguridad|plan de acción)'
WHERE id = 56;
UPDATE det_regulations
SET pattern = '(mitigan|riesgos de continuidad|planes de recuperación)'
WHERE id = 57;
UPDATE det_regulations
SET pattern = '(analizan|riesgos operativos|infraestructura crítica)'
WHERE id = 58;
UPDATE det_regulations
SET pattern = '(gestionan|incidentes de ciberseguridad|SOC|Centro de Operaciones de Seguridad)'
WHERE id = 59;
UPDATE det_regulations
SET pattern = '(evalúan|proveedores críticos|impacto|seguridad tecnológica)'
WHERE id = 60;
UPDATE det_regulations
SET pattern = '(revisan|políticas de seguridad|actualizan regularmente)'
WHERE id = 61;
UPDATE det_regulations
SET pattern = '(auditoría externa|riesgos tecnológicos|anualmente)'
WHERE id = 62;
UPDATE det_regulations
SET pattern = '(desarrollan|estrategias de mitigación|riesgos tecnológicos emergentes)'
WHERE id = 63;
UPDATE det_regulations
SET pattern = '(capacita|personal|buenas prácticas|ciberseguridad)'
WHERE id = 64;
UPDATE det_regulations
SET pattern = '(monitorizan|sistemas críticos|detección temprana|amenazas)'
WHERE id = 65;
UPDATE det_regulations
SET pattern = '(auditan|operaciones tecnológicas|evaluar riesgos)'
WHERE id = 66;
UPDATE det_regulations
SET pattern = '(evalúan|controles de acceso|sistemas críticos)'
WHERE id = 67;
UPDATE det_regulations
SET pattern = '(implementan|herramientas de monitoreo|detectar vulnerabilidades)'
WHERE id = 68;
UPDATE det_regulations
SET pattern = '(validan|políticas de seguridad tecnológica|periódicamente)'
WHERE id = 69;
UPDATE det_regulations
SET pattern = '(revisan|actualizan|planes de respuesta|incidentes)'
WHERE id = 70;
UPDATE det_regulations
SET pattern = '(reportan|incidentes de seguridad|autoridades competentes)'
WHERE id = 71;
UPDATE det_regulations
SET pattern = '(supervisa|actividad de usuarios|privilegios)'
WHERE id = 72;
UPDATE det_regulations
SET pattern = '(auditan|accesos|infraestructura tecnológica crítica)'
WHERE id = 73;
UPDATE det_regulations
SET pattern = '(implementan|controles adicionales|acceso remoto seguro)'
WHERE id = 74;
UPDATE det_regulations
SET pattern = '(establecen|políticas de cifrado|proteger información sensible)'
WHERE id = 75;
UPDATE det_regulations
SET pattern = '(gestionan|parches de seguridad|manera periódica)'
WHERE id = 76;
UPDATE det_regulations
SET pattern = '(revisan|procedimientos de seguridad|garantizar|efectividad)'
WHERE id = 77;
UPDATE det_regulations
SET pattern = '(implementan|medidas de protección|datos en tránsito|reposo)'
WHERE id = 78;
UPDATE det_regulations
SET pattern = '(análisis de riesgos|nuevas tecnologías)'
WHERE id = 79;
UPDATE det_regulations
SET pattern = '(asegura|integridad de los datos|técnicas de validación)'
WHERE id = 80;


UPDATE det_regulations
SET pattern = '(informado|Superintendencia de Bancos|cajeros automáticos|POS|dispositivos tecnológicos)'
WHERE id = 81;

UPDATE det_regulations
SET pattern = '(sistema de gestión de riesgos|actividades de banca electrónica)'
WHERE id = 82;

UPDATE det_regulations
SET pattern = '(responsabilidades específicas|políticas|controles|gestión de riesgos|canales electrónicos)'
WHERE id = 83;

UPDATE det_regulations
SET pattern = '(aspectos esenciales|proceso de control de riesgos|canales electrónicos)'
WHERE id = 84;

UPDATE det_regulations
SET pattern = '(procesos de diligencia|supervisión|relaciones con proveedores externos)'
WHERE id = 85;

UPDATE det_regulations
SET pattern = '(integrar|manual de operaciones|políticas|procedimientos|gestión de activos tecnológicos)'
WHERE id = 86;

UPDATE det_regulations
SET pattern = '(naturaleza de las transacciones bancarias)'
WHERE id = 87;

UPDATE det_regulations
SET pattern = '(sistema de registro|transacciones|operaciones)'
WHERE id = 88;

UPDATE det_regulations
SET pattern = '(mecanismos|supervisión|riesgos de banca electrónica|políticas|controles)'
WHERE id = 89;

UPDATE det_regulations
SET pattern = '(mecanismos|evaluación de amenazas|vulnerabilidades|impactos)'
WHERE id = 90;

UPDATE det_regulations
SET pattern = '(mecanismos|gestión de incidentes|seguridad|activos tecnológicos)'
WHERE id = 91;

UPDATE det_regulations
SET pattern = '(pólizas|procedimientos de prevención|amenazas tecnológicas potenciales)'
WHERE id = 92;

UPDATE det_regulations
SET pattern = '(pólizas|procedimientos de respuesta|amenazas tecnológicas potenciales)'
WHERE id = 93;

UPDATE det_regulations
SET pattern = '(pólizas|procedimientos|violaciones a la seguridad|banca electrónica)'
WHERE id = 94;

UPDATE det_regulations
SET pattern = '(pólizas|procedimientos|mecanismos de seguridad|continuidad del negocio)'
WHERE id = 95;

UPDATE det_regulations
SET pattern = '(mecanismos de diligencia debida|vigilancia|relaciones con terceros)'
WHERE id = 96;

UPDATE det_regulations
SET pattern = '(plan de continuidad de negocio|recuperación ante desastres)'
WHERE id = 97;

UPDATE det_regulations
SET pattern = '(área de riesgos|identificación|evaluación|control de riesgos tecnológicos|banca electrónica)'
WHERE id = 98;

UPDATE det_regulations
SET pattern = '(auditorías periódicas|plan anual de auditoría)'
WHERE id = 99;

UPDATE det_regulations
SET pattern = '(programas necesarios|personal especializado|área de auditoría)'
WHERE id = 100;

UPDATE det_regulations
SET pattern = '(revisiones externas|riesgo|canales de banca electrónica)'
WHERE id = 101;

UPDATE det_regulations
SET pattern = '(pruebas de intrusión externa|proveedores externos|servicios de seguridad)'
WHERE id = 102;

UPDATE det_regulations
SET pattern = '(pruebas de intrusión interna|proveedores externos|servicios de seguridad)'
WHERE id = 103;

UPDATE det_regulations
SET pattern = '(pruebas de intrusión|personal interno capacitado)'
WHERE id = 104;

UPDATE det_regulations
SET pattern = '(información suministrada|internet|identificar al banco)'
WHERE id = 105;

UPDATE det_regulations
SET pattern = '(información publicada|servicios de banca electrónica|correcta|actualizada)'
WHERE id = 106;

UPDATE det_regulations
SET pattern = '(medidas técnicas|observancia de condiciones de privacidad|clientes|operaciones)'
WHERE id = 107;

UPDATE det_regulations
SET pattern = '(medidas de privacidad|productos|servicios|canales de banca electrónica)'
WHERE id = 108;

UPDATE det_regulations
SET pattern = '(programas|garantizar disponibilidad|sistemas|servicios de banca electrónica)'
WHERE id = 109;

UPDATE det_regulations
SET pattern = '(plans de respuesta|comunicación de incidentes|gestión|detención|mitigación|fallas de seguridad)'
WHERE id = 110;

UPDATE det_regulations
SET pattern = '(sistemas de administración|fraude|servicios de banca electrónica)'
WHERE id = 111;

UPDATE det_regulations
SET pattern = '(registro de manipulación|alteración de datos|hora|fecha de la operación)'
WHERE id = 112;

UPDATE det_regulations
SET pattern = '(bitácoras|registro de acceso|canales electrónicos|identificación de usuario|hora de acceso)'
WHERE id = 113;

UPDATE det_regulations
SET pattern = '(detalle de operaciones monetarias|fecha|hora|canal acceso|monto|cuenta origen|cuenta destino|tipo de transacción)'
WHERE id = 114;

UPDATE det_regulations
SET pattern = '(bitácoras|datos|investigaciones|canales electrónicos)'
WHERE id = 115;

UPDATE det_regulations
SET pattern = '(banca por internet|bitácoras de webserver|método HTTP|URI|timestamp)'
WHERE id = 116;

UPDATE det_regulations
SET pattern = '(registro de transacciones|código de comercio)'
WHERE id = 117;

UPDATE det_regulations
SET pattern = '(información|características|condiciones|costos|servicios electrónicos)'
WHERE id = 118;

UPDATE det_regulations
SET pattern = '(DMZ)'
WHERE id = 119;

UPDATE det_regulations
SET pattern = '(servidor de Logs)'
WHERE id = 120;

UPDATE det_regulations
SET pattern = '(sistemas IPS|IDS)'
WHERE id = 121;

UPDATE det_regulations
SET pattern = '(almacenan logs|IPS|IDS|1 año)'
WHERE id = 122;

UPDATE det_regulations
SET pattern = '(método digital|identificar el banco|actividades)'
WHERE id = 123;

UPDATE det_regulations
SET pattern = '(nombre completo|cuenta|última hora de ingreso|servicio)'
WHERE id = 124;

UPDATE det_regulations
SET pattern = '(plataformas de banca en internet|contraseñas|minimo 8 caracteres)'
WHERE id = 125;

UPDATE det_regulations
SET pattern = '(plataformas de banca en internet|otro factor de autenticación)'
WHERE id = 126;

UPDATE det_regulations
SET pattern = '(controles de autenticación|pago móvil)'
WHERE id = 127;

UPDATE det_regulations
SET pattern = '(controles de seguridad|transmisión de información sensible|plataformas de pago móvil)'
WHERE id = 128;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|identifican al cliente|número de tarjeta bancaria)'
WHERE id = 129;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|factor de autenticación|PIN)'
WHERE id = 130;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|sistema adecuado|circuito integrado)'
WHERE id = 131;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|mecanismos de protección|información confidencial)'
WHERE id = 132;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|cifran comunicaciones)'
WHERE id = 133;

UPDATE det_regulations
SET pattern = '(cajeros automáticos|cámaras de circuito cerrado|grabación de imágenes)'
WHERE id = 134;

UPDATE det_regulations
SET pattern = '(videos grabados|cajeros automáticos|12 meses)'
WHERE id = 135;

UPDATE det_regulations
SET pattern = '(POS|identifican al cliente|número de tarjeta bancaria)'
WHERE id = 136;

UPDATE det_regulations
SET pattern = '(POS|PIN de autenticación)'
WHERE id = 137;

UPDATE det_regulations
SET pattern = '(POS|mecanismos de protección|información confidencial)'
WHERE id = 138;

UPDATE det_regulations
SET pattern = '(POS|cifran comunicaciones)'
WHERE id = 139;

UPDATE det_regulations
SET pattern = '(POS|medidas de seguridad|medios de pago electrónico)'
WHERE id = 140;

UPDATE det_regulations
SET pattern = '(banca telefónica|audio-respuesta|identificador único|seis caracteres)'
WHERE id = 141;

UPDATE det_regulations
SET pattern = '(banca telefónica|audio-respuesta|factor de autenticación|contraseña|seis dígitos|transacciones a terceros)'
WHERE id = 142;

UPDATE det_regulations
SET pattern = '(banca telefónica|voz a voz|identificador único|seis caracteres)'
WHERE id = 143;

UPDATE det_regulations
SET pattern = '(banca telefónica|voz a voz|cuestionarios|autenticar|información sensible)'
WHERE id = 144;

UPDATE det_regulations
SET pattern = '(redes especializadas|certificados digitales|validar legitimidad|transacciones)'
WHERE id = 145;

UPDATE det_regulations
SET pattern = '(redes especializadas|enlaces cifrados|seguridad disponible)'
WHERE id = 146;

UPDATE det_regulations
SET pattern = '(redes especializadas|servidores de bastión|repositorios de información|banco)'
WHERE id = 147;

UPDATE det_regulations
SET pattern = '(redes especializadas|garantizan|integridad|no repudio|transacciones)'
WHERE id = 148;

UPDATE det_regulations
SET pattern = '(mensajería instantánea|redes sociales|correos electrónicos|información autorizada|contrato con el cliente)'
WHERE id = 149;

UPDATE det_regulations
SET pattern = '(banca electrónica|verifica identidad|autorización|nuevos clientes)'
WHERE id = 150;

UPDATE det_regulations
SET pattern = '(banca electrónica|preserva|confidencialidad|integridad|información transmitida)'
WHERE id = 151;

UPDATE det_regulations
SET pattern = '(banca electrónica|no renuncia|transacciones|confirma ejecución)'
WHERE id = 152;

UPDATE det_regulations
SET pattern = '(banca electrónica|segrega responsabilidades|reducción del riesgo de fraude|procesos|sistemas)'
WHERE id = 153;

UPDATE det_regulations
SET pattern = '(banca electrónica|estructura física|servidores|bases de datos)'
WHERE id = 154;

UPDATE det_regulations
SET pattern = '(banca electrónica|mantiene registros|transacciones|asegura integridad)'
WHERE id = 155;

UPDATE det_regulations
SET pattern = '(banca electrónica|controles internos|apertura|modificación|cancelación de cuentas)'
WHERE id = 156;

UPDATE det_regulations
SET pattern = '(banca electrónica|asignación de responsabilidades|irregularidades|servicio)'
WHERE id = 157;

UPDATE det_regulations
SET pattern = '(reportan incidentes de seguridad|Superintendencia de Bancos)'
WHERE id = 158;

UPDATE det_regulations
SET pattern = '(técnicas de control|criptografía|garantizar privacidad|información del cliente)'
WHERE id = 159;

UPDATE det_regulations
SET pattern = '(instruye a los clientes|protección|información bancaria personal)'
WHERE id = 160;

UPDATE det_regulations
SET pattern = '(proveedor de seguridad|banca electrónica|personal idóneo|autorizado por la Superintendencia)'
WHERE id = 161;

UPDATE det_regulations
SET pattern = '(remiten reportes|Superintendencia|banca electrónica)'
WHERE id = 162;

UPDATE det_regulations
SET pattern = '(pólizas|prevención|uso indebido|servicios de banca electrónica)'
WHERE id = 163;

UPDATE det_regulations
SET pattern = '(identificación|seguimiento|transacciones sospechosas|banca electrónica)'
WHERE id = 164;