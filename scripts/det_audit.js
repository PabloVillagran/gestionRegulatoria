document.addEventListener("DOMContentLoaded", () => {
    const auditTitle = document.getElementById('audit-title');
    const audit_id = new URLSearchParams(window.location.search).get('id');
    const auditsTableBody = document.querySelector("#audits-table tbody");
    const auditIdHidden = document.getElementById('audit_id');
    const reportLink = document.getElementById('report-link');

    auditIdHidden.value = audit_id;
    reportLink.href = `../audit/reports.html?auditid=${audit_id}`;

    fetch('./get_audit_details.php?id='+audit_id)
    .then(response => response.json())
    .then(data => {
        auditTitle.textContent = auditTitle.textContent+' '+data[0].institution_name;
        //populate the audit details with 
        /* <th>Descripci&oacute;n</th>
            <th>Aplica</th>
            <th>Comentarios</th>*/
        data.forEach(element => {
            const row = document.createElement("tr");
            row.innerHTML = `
            <td>${element.description}</td>
            <td><input id="applies-${element.id}" name="applies-${element.id}" type="checkbox" value=1 ${element.applies==1?'checked':''}></td>
            <td><input id="id-${element.id}" name="id-${element.id}" type="checkbox" value=1 ${element.check_mark==1?'checked':''}></td>
            <td><textarea id="comment-${element.id}" name="comment-${element.id}">${element.comments?element.comments:''}</textarea></td>
            `;
            auditsTableBody.appendChild(row);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    });

});
