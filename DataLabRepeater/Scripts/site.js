(function () {
    "use strict";
    var checks = Array.prototype.slice.call(document.querySelectorAll('#checklist input[type="checkbox"]'));
    var progressBar = document.getElementById('progressBar');
    var progressText = document.getElementById('progressText');
    var progressPercent = document.getElementById('progressPercent');

    function updateProgress() {
        var count = checks.filter(function (check) { return check.checked; }).length;
        var percent = checks.length ? Math.round((count / checks.length) * 100) : 0;
        progressBar.style.width = percent + '%';
        progressText.textContent = count + ' de ' + checks.length + ' requisitos completados';
        progressPercent.textContent = percent + '%';
    }

    checks.forEach(function (check) {
        check.addEventListener('change', updateProgress);
    });
    updateProgress();
}());
