window.onload = function() {
    var menuBar = document.getElementById("menuBar");
    menuBar.addEventListener('mouseover', function(){
        menuBar.classList.add('menuOver');
    });

    menuBar.addEventListener('mouseleave', function(){
        menuBar.classList.remove('menuOver');
    });
}