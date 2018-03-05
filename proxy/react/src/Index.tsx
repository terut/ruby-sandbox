import * as React from 'react';
import * as ReactDOM from 'react-dom';
import {
  BrowserRouter as Router,
  Route,
  Link
} from 'react-router-dom'

const Home = () => (
  <div>
    <p>React Home!!</p>
  </div>
)
const About = () => (
  <div>
    <p>React About!!</p>
  </div>
)

ReactDOM.render(
  <Router>
    <div>
    <ul>
      <li><Link to="/">Home</Link></li>
      <li><Link to="/about">About</Link></li>
      <li><a href="/vue">Vue</a></li>
    </ul>

    <hr/>

    <Route exact path="/" component={Home} />
    <Route path="/about" component={About} />
    </div>
  </Router>
, document.getElementById('app'));
