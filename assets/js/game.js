console.log('Logging from game.js');

const userCharacter = document.getElementById('userCharacter');

window.addEventListener('DOMContentLoaded', event => {
    console.log('DOM fully loaded and parsed');
});

if (window.location.href.includes('games/new')) {
    console.log('we have a new game !!');
}

// ----- define elements where a user will click ------ //

const topLeft = document.getElementById('top-left');
const topMid = document.getElementById('top-mid');
const topRight = document.getElementById('top-right');

const midLeft = document.getElementById('mid-left');
const midMid = document.getElementById('mid-mid');
const midRight = document.getElementById('mid-right');

const downLeft = document.getElementById('down-left');
const downMid = document.getElementById('down-mid');
const downRight = document.getElementById('down-right');
// ------- define event listeners ------- //

topLeft.addEventListener('click', handleClick);
topMid.addEventListener('click', handleClick);
topRight.addEventListener('click', handleClick);

midLeft.addEventListener('click', handleClick);
midMid.addEventListener('click', handleClick);
midRight.addEventListener('click', handleClick);

downLeft.addEventListener('click', handleClick);
downMid.addEventListener('click', handleClick);
downRight.addEventListener('click', handleClick);

// ----- define callback handlers ----- //

function handleClick(event) {
    let userSelection = document.getElementById(event.target.id);
    let userImage = getCharacterImage(userCharacter.innerHTML);

    let image = document.createElement('IMG');
    image.setAttribute('src', userImage);
    image.setAttribute('alt', 'A flat monster icon');
    image.setAttribute('width', '100');
    image.setAttribute('height', '100');
    console.log(userImage);
    userSelection.appendChild(image);
}

// use the character name to get the image
function getCharacterImage(characterName) {
    let imgObj = {
        aaargh: '/images/characters/aaargh.svg',
        abby: '/images/characters/abby.svg',
        billy: '/images/characters/billy.svg',
        casper: '/images/characters/casper.svg',
        oscar: '/images/characters/oscar.svg',
        pika: '/images/characters/pika.svg',
        robert: '/images/characters/robert.svg',
        stanley: '/images/characters/stanley.svg'
    };

    return imgObj[characterName];
}
