// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from '../css/app.css';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html';
import game from './game';
// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from './socket';

// import and setup React
import React from 'react';
import ReactDOM from 'react-dom';

const Index = () => {
    return <div>Choose your character below to begin playing</div>;
};

window.addEventListener('DOMContentLoaded', event => {
    ReactDOM.render(<Index />, document.getElementById('react-mount'));
});
