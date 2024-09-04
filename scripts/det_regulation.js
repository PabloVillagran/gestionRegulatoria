document.addEventListener("DOMContentLoaded", () => {
    const addRegulationBtn = document.getElementById('add-regulation-btn');
    const modal = document.getElementById('regulation-modal');
    const regulationIdHidden = document.getElementById('regulation-id');
    const closeModal = document.querySelector('.close');
    
    const urlParams = new URLSearchParams(window.location.search);
    const rgParam = urlParams.get('rg');
    
    regulationIdHidden.setAttribute('value', rgParam);

    var regulations = [];
    fetch('./get_regulation_det.php?reg='+rgParam)
    .then(response => response.json())
    .then(data => {
        regulations.push(...data);
        let rownum = 1;
        regulations.forEach(reg => {
            const row = document.createElement("tr");
            row.innerHTML = `
            <td>${rownum++}</td>
            <td>${reg.Description}</td>
            `;
            // <td>${reg.id}</td>
            // <td><button>Editar</button> <button>Borrar</button></td>
            regulationsTableBody.appendChild(row);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    })

    // Rellena la tabla de normativas
    const regulationsTableBody = document.querySelector("#regulations-table tbody");

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
