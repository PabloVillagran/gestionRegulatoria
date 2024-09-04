document.addEventListener("DOMContentLoaded", () => {
    const addRegulationBtn = document.getElementById('add-regulation-btn');
    const modal = document.getElementById('audit-modal');
    const closeModal = document.querySelector('.close');
    const regulationsSelection = document.querySelector("#regulation-selection");
    const auditsTableBody = document.querySelector("#audits-table tbody");
    
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

    var audits = [];
    fetch('audit/get_audits.php')
    .then(response => response.json())
    .then(data => {
        audits.push(...data);
        audits.forEach(aud => {
            const row = document.createElement("tr");
            row.innerHTML = `
            <td>${aud.institution_name}</td>
            <td>${aud.name}</td>
            <td>${aud.date_init}</td>
            <td><a href="/audit/audit_execution.html?id=${aud.id}"><button>Editar Auditor&iacute;a</button></a></td>
            <td><a href="/audit/reports.html?auditid=${aud.id}"><button>Ver Reporte</button></a></td>
            `;
            auditsTableBody.appendChild(row);
        });
    })

    // Abre el modal al hacer clic en el botón "Agregar Normativa"
    addRegulationBtn.addEventListener('click', () => {
        modal.style.display = "block";
    });

    // Cierra el modal al hacer clic en el botón de cerrar
    closeModal.addEventListener('click', () => {
        modal.style.display = "none";
    });

    // Cierra el modal si el usuario hace clic fuera del contenido del modal
    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
});
