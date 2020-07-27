// Nope
// ...except to show the animation on load
let c = document.getElementById('#bookmark-button');
setTimeout(() => c.focus(), 100);
setTimeout(() => c.blur(), 1000);