document.addEventListener("DOMContentLoaded", () => {
    const chartContainer = document.getElementById('visualize');
    const audit_id = new URLSearchParams(window.location.search).get('auditid');
    const missingDetails = document.getElementById('missing-details');
    const recommendations = document.getElementById('recommendations');
    const commentList = document.getElementById('comment-list');

    fetch('./report/get_report.php?auditid='+audit_id)
    .then(response => response.json())
    .then(result => {
        populateChart(result, chartContainer);
    })
    .catch(error => {
        console.error('Error:', error);
    });

    fetch('./report/get_missing_details.php?auditid='+audit_id)
    .then(response => response.json())
    .then(result => {
        result.forEach(detail => {
            const li = document.createElement("li");
            li.innerHTML = detail.description;
            missingDetails.appendChild(li);
        });
    });

    fetch('./report/get_audit_recommendations.php?auditid='+audit_id)
    .then(response => response.json())
    .then(result => {
        result.forEach(rec => {
            const li = document.createElement("li");
            li.innerHTML = rec.description;
            recommendations.appendChild(li);
        });
    });

    fetch('./report/get_audit_comments.php?auditid='+audit_id)
    .then(response => response.json())
    .then(result => {
        result.forEach(comment => {
            const li = document.createElement("li");
            li.innerHTML = comment.comments;
            commentList.appendChild(li);
        });
    });
});

function populateChart(d, chartContainer) {
    const labels = d.labels;
    const values = d.data;

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

    new Chart (chartContainer, config);
}
