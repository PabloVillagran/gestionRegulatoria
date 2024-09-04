document.addEventListener("DOMContentLoaded", () => {
    const addRegulationBtn = document.getElementById('add-regulation-btn');
    const modal = document.getElementById('regulation-modal');
    const closeModal = document.querySelector('.close');
    const regulationsTableBody = document.querySelector("#regulations-table tbody");
    
    var regulations = [];
    fetch('includes/get_regulations.php')
    .then(response => response.json())
    .then(data => {
        regulations.push(...data);
        regulations.forEach(reg => {
            const row = document.createElement("tr");
            row.innerHTML = `
            <td><a href="./det/regulation_det.html?rg=${reg.id}">${reg.name}</a></td>
            <td>${reg.country}</td>
            <td>${reg.date}</td>
            `;
            regulationsTableBody.appendChild(row);
        });
    })
    .catch(error => {
        console.error('Error:', error);
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
