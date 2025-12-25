window.addEventListener('message', function(event) {
    if (event.data.type === "openWelcome") {
        document.getElementById('player-name').innerText = event.data.name;
        document.body.style.display = 'flex';
    }
});

function closeWelcome() {
    document.body.style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST'
    });
}