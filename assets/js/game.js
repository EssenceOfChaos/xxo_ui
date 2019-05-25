console.log("Logging from game.js");

document.getElementById("top-left").addEventListener("click", logClick);

function logClick(event) {
  console.log(event.target.id);
}
