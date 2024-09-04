// script.js
document.addEventListener("DOMContentLoaded", () => {
    const regulationsSelection = document.getElementById('regulation-selection');

    fetch('includes/get_regulations.php')
    .then(response => response.json())
    .then(data => {
        data.forEach(reg => {
            const option = document.createElement("option");
            option.value = reg.id;
            option.innerHTML = reg.name;
            regulationsSelection.appendChild(option);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    })
});

// Contador para el número de análisis realizados
let analysisCounter = 0;

// Evento que se activa al hacer clic en el botón de validación
document.getElementById('validate-btn').addEventListener('click', function() {
    const fileInput = document.getElementById('file-input');
    const file = fileInput.files[0]; // Obtener el archivo seleccionado

    // Validación para verificar que se haya seleccionado un archivo
    if (!file) {
        alert("Por favor, seleccione un archivo.");
        return;
    }

    // Mostrar el indicador de carga
    const loadingDiv = document.getElementById('loading');
    loadingDiv.style.display = 'block';

    // Simular tiempo de carga aleatorio entre 3 y 5 segundos
    const tiempoCarga = Math.floor(Math.random() * (5000 - 3000 + 1)) + 3000;

    setTimeout(() => {
        // Si el archivo es un PDF, se lee utilizando la función leerPDF
        if (file.type === 'application/pdf') {
            leerPDF(file).then(content => {
                validarEstandares(content, file.name); // Validar estándares con el contenido del PDF
                loadingDiv.style.display = 'none'; // Ocultar el indicador de carga
            }).catch(error => {
                console.error("Error al leer el PDF:", error);
                loadingDiv.style.display = 'none'; // Ocultar el indicador de carga en caso de error
            });
        } else {
            // Crear un nuevo lector de archivos
            const reader = new FileReader();
            
            reader.onload = function(event) {
                const content = event.target.result; // Obtener el contenido del archivo
                validarEstandares(content, file.name); // Validar estándares con el contenido del archivo
                loadingDiv.style.display = 'none'; // Ocultar el indicador de carga
            };
            
            // Leer el archivo como texto si es de tipo .txt o .csv
            if (file.type === 'text/plain' || file.type === 'text/csv') {
                reader.readAsText(file);
            } else if (file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
                alert("La validación de archivos Excel no está soportada en esta versión.");
                loadingDiv.style.display = 'none'; // Ocultar el indicador de carga
            } else {
                alert("Formato de archivo no soportado.");
                loadingDiv.style.display = 'none'; // Ocultar el indicador de carga
            }
        }
    }, tiempoCarga);
});

// Función para leer archivos PDF utilizando pdfjsLib
function leerPDF(file) {
    return new Promise((resolve, reject) => {
        const fileReader = new FileReader();

        fileReader.onload = function() {
            const typedarray = new Uint8Array(this.result);

            // Obtener el documento PDF y extraer el texto de cada página
            pdfjsLib.getDocument(typedarray).promise.then(function(pdf) {
                let pagesPromises = [];

                for (let i = 0; i < pdf.numPages; i++) {
                    pagesPromises.push(pdf.getPage(i + 1).then(page => {
                        return page.getTextContent().then(textContent => {
                            return textContent.items.map(item => item.str).join(' ');
                        });
                    }));
                }

                // Combinar el texto de todas las páginas y resolver la promesa
                Promise.all(pagesPromises).then(pagesText => {
                    resolve(pagesText.join(' '));
                }).catch(reject);
            }).catch(reject);
        };

        // Leer el archivo como un ArrayBuffer
        fileReader.readAsArrayBuffer(file);
    });
}

// Función para validar estándares en el contenido del archivo
function validarEstandares(texto, fileName) {
    // Definir los requisitos de la norma y sus expresiones regulares correspondientes
    const regulationid = document.getElementById('regulation-selection').value;
    
    const requisitosNorma = {};
    fetch('det/get_det_regulations_patterns.php?regid='+regulationid)
    .then(response => response.json())
    .then(data => {
        data.forEach(reg => {
            try{
                requisitosNorma[reg.description] = new RegExp(reg.pattern, 'i');
            }catch(e){
                console.error(e, "error al convertir " + reg.pattern)
            }
        });

        validarConExpresiones(texto, fileName, requisitosNorma);
    });
}

let globalChartContainer = null;

function populateChart(labels, values) {

    const data = {
        labels: labels,
        datasets: [
            {
                label: 'Resultados',
                data: values,
                backgroundColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                hoverOffset: 4
            }
        ]
    }

    const config = {
        type: 'doughnut',
        data: data,
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: 'Resultados de la auditoría'
              }
            }
        }
    };

    const chartContainer = document.getElementById('chart-container');
    chartContainer.style.display = 'block';
    chartContainer.style.width = '400px';

    if(globalChartContainer){
        globalChartContainer.destroy();
    }
    globalChartContainer = new Chart (document.getElementById('chart-canvas'), config);
}


function validarConExpresiones(texto, fileName, requisitosNorma) {
    let resultados = '';
    let cumplidos = 0; // Contador de criterios cumplidos
    let noCumplidos = 0; // Contador de criterios no cumplidos

    // Validar el texto contra cada expresión regular
    for (const [requisito, regex] of Object.entries(requisitosNorma)) {
        if (regex.test(texto)) {
            resultados += `<p>${requisito}: <span style="color:green;">Cumple</span></p>`;
            cumplidos++;
        } else {
            resultados += `<p>${requisito}: <span style="color:red;">No Cumple</span></p>`;
            noCumplidos++;
        }
    }

    // Generar gráfica de los resultados
    populateChart(["Cumplidos", "No cumplidos"], [cumplidos, noCumplidos]);

    // Generar un resumen de los resultados
    const resumen = `<p><strong>Resumen:</strong> Cumple ${cumplidos} de ${cumplidos + noCumplidos} criterios.</p>`;
    resultados += resumen;

    // Mostrar los resultados en la interfaz de usuario
    document.getElementById('results').innerHTML = resultados;

    // Actualizar el contador de análisis
    analysisCounter++;
    const tableBody = document.querySelector('#results-table tbody');
    const newRow = document.createElement('tr');

    // Añadir una nueva fila a la tabla con los resultados del análisis
    newRow.innerHTML = `
        <td>${analysisCounter}</td>
        <td>${fileName}</td>
        <td>${new Date().toLocaleDateString()}</td>
        <td>Guatemala</td> <!-- Puedes cambiar esto por el país real si está disponible -->
        <td>
            <button class="button-action button-edit" onclick="guardarReporte('${fileName}', ${cumplidos}, ${noCumplidos})">Descargar</button>
            <button class="button-action button-delete" onclick="borrarResultado(this)">Borrar</button>
        </td>
    `;

    tableBody.appendChild(newRow);
}

// Función para guardar un reporte de validación como archivo de texto
// Sección Mejorada INICIO //

function guardarReporte(fileName, cumplidos, noCumplidos) {
    // Obtener los resultados mostrados en el HTML y convertirlo a texto plano
    const resultadosHTML = document.getElementById('results');
    const lines = resultadosHTML.children;
    // const parser = new DOMParser();
    // const doc = parser.parseFromString(resultadosHTML, 'text/html');
    // const resultadosTexto = doc.body.textContent || "";

    // Formatear los criterios cumplidos y no cumplidos en listas verticales
    // const lines = resultadosTexto.split('\n');
    let cumplidosList = '';
    let noCumplidosList = '';

    for(const p of lines){
        var line = p.innerHTML;
        if (line.includes('<span style="color:green;">Cumple</span>')) {
            cumplidosList += `✅ ${line.replace('<span style="color:green;">Cumple</span>', '').trim()}\r\n`;
        } else if (line.includes('<span style="color:red;">No Cumple</span>')) {
            noCumplidosList += `❌ ${line.replace(': <span style="color:red;">No Cumple</span>', '').trim()}\r\n`;
        }
    };

    // Generar comentario aleatorio del auditor
    const comentarios = [
        "Recomendación del Auditor: Mejorar la autenticación de usuarios y la protección de datos para cumplir con todos los estándares.",
        "Recomendación del Auditor: Fortalecer el control de acceso y la gestión de riesgos para evitar vulnerabilidades.",
        "Recomendación del Auditor: Se sugiere revisar la infraestructura y las comunicaciones para alinearse completamente con los requisitos.",
        "Recomendación del Auditor: Aumentar la concienciación y la formación del personal para cumplir con los estándares de seguridad."
    ];
    const comentarioAuditor = comentarios[Math.floor(Math.random() * comentarios.length)];

    // Crear el contenido del reporte con mejor formato
    const contenidoReporte = `
    ================================================
                Reporte de Validación de Estándares
    ================================================
    
    Documento: ${fileName}
    
    -----------------------------------------------
    Resumen:
    -----------------------------------------------
    ✅ Criterios Cumplidos     : ${cumplidos}
    ❌ Criterios No Cumplidos  : ${noCumplidos}
    
    -----------------------------------------------
    Criterios Cumplidos:
    -----------------------------------------------
    ${cumplidosList.trim()}
    
    -----------------------------------------------
    Criterios No Cumplidos:
    -----------------------------------------------
    ${noCumplidosList.trim()}

    -----------------------------------------------
    ${comentarioAuditor}
    -----------------------------------------------
    
    ================================================
    Fin del Reporte
    ================================================
    `;

    // Crear un Blob con el contenido del reporte
    const blob = new Blob([contenidoReporte], { type: 'text/plain;charset=utf-8' });
    const enlace = document.createElement('a');
    enlace.href = URL.createObjectURL(blob);
    enlace.download = `${fileName}_reporte_validacion.txt`; // Nombre del archivo de descarga
    document.body.appendChild(enlace);
    enlace.click(); // Descargar el archivo
    document.body.removeChild(enlace); // Eliminar el enlace del DOM
}
// Sección Mejorada FIN //

// Función para borrar un resultado de la tabla
function borrarResultado(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row); // Eliminar la fila de la tabla
}
