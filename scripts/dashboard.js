document.addEventListener("DOMContentLoaded", () => {
    const regulationsCount = document.getElementById('regulations-count');
    const actionsCount = document.getElementById('actions-count');
    const reportsCount = document.getElementById('reports-count');

    var regulations = [];
    var actions = [];
    var reports = [];

    regulationsCount.textContent = regulations.length;
    actionsCount.textContent = actions.length;
    reportsCount.textContent = reports.length;
});