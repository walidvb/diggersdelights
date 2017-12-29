import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import routes from './routes.js';

class App extends Component {
  componentDidMount() {
    window.fetch(routes.links.index, {
      credentials: 'same-origin',accept: 'application/json', headers: { "Content-Type": "application/json"}})
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.log(error))
  }
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;
