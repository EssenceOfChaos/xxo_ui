import { Socket } from 'phoenix';

const userCharacter = document.getElementById('userCharacter').innerHTML;

let actionOn = userCharacter;

const squares = [
    'top-left',
    'top-mid',
    'top-right',
    'mid-left',
    'mid-mid',
    'mid-right',
    'down-left',
    'down-mid',
    'down-right'
];

let socket = new Socket('/socket', {
    params: {
        token: window.userToken,
        userCharacter: userCharacter
    }
});

socket.connect();

// Socket Hooks
socket.onClose(() => console.log('the connection dropped'));

let channel = socket.channel(`game:${userCharacter}`, {});

let match = document.location.pathname.match(/\/games\/new\/(\w+)$/);

if (match) {
    let userCharacter = match[1];
    channel
        .join()
        .receive('ok', resp => {
            console.log(
                `Joined successfully - User has choosen ${userCharacter}`,
                resp
            );
        })
        .receive('error', resp => {
            console.log('Unable to join', resp);
        });
}

/////////////////////////////////////////////
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
    let userImage = getCharacterImage(userCharacter);

    let image = document.createElement('IMG');
    image.setAttribute('src', userImage);
    image.setAttribute('alt', 'A flat monster icon');
    image.setAttribute('width', '100');
    image.setAttribute('height', '100');
    userSelection.appendChild(image);

    pushNewMove(userCharacter, event.target.id);
    removeSquareFromArr(event.target.id);
    moveActionForward();
}
////////////////////////////////////////

////////////////////////////////////////
function pushNewMove(userCharacter, location) {
    console.log(location);
    let params = { user: userCharacter, move: location };
    channel.push('new_move', params).receive('ok', response => {
        console.log(response);
    });

    removeSquareFromArr(location);
}

//

//
/////////////////////////////////////
/**
 * Remove the occupied square from the list of available squares
 * @param {string} square
 */
function removeSquareFromArr(square) {
    let index = squares.indexOf('square');
    squares.splice(index, 1);
}

function moveActionForward() {
    if (actionOn !== 'player2') {
        actionOn = 'player2';
    } else {
        actionOn = userCharacter;
    }
}

/////////////////////////////////////
// use the character name to get the image
/////////////////////////////////////
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

export default socket;
