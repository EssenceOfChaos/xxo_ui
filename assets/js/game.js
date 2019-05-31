console.log('Logging from game.js');

// document.getElementById('top-left').addEventListener('click', logClick);

function logClick(event) {
    // console.log(event.target);
    new_game(event.target);
}

window.addEventListener('DOMContentLoaded', event => {
    console.log('DOM fully loaded and parsed');
    console.log(window.location.href);
    // document
    //     .getElementById('character-list')
    //     .addEventListener('click', logClick);
});

// new game
// create a new game with a players choosen character
function new_game(character) {
    // call elixir code to start game
    console.log(character);
}

// window.addEventListener('phoenix.link.click', function (e) {
//     // Introduce custom behaviour
//     var message = e.target.getAttribute("data-prompt");
//     var answer = e.target.getAttribute("data-prompt-answer");
//     if(message && answer && (answer != window.prompt(message))) {
//       e.preventDefault();
//     }
//   }, false);

if (window.location.href.includes('games/new')) {
    console.log('we have a new game !!');
}
