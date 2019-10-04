import React, { Component } from "react";
import {
  Route,
  NavLink,
  HashRouter
} from "react-router-dom";
import home from "./home/home";
import resume from "./resume/resume";
import contact from "./contact/contact";

class Main extends Component {
    render() {
      return (
        <HashRouter>
          <div className="mainContent">
            <ul className="sidenav">
              <li><NavLink to="/">Home</NavLink></li>
              <li><NavLink to="/resume">Resume</NavLink></li>
              <li><NavLink to="/contact">Contact</NavLink></li>
            </ul>
            <div className="sidenav-drawer">Test</div>
            <div className="content">
                <Route exact path="/" component={home}/>
                <Route path="/resume" component={resume}/>
                <Route path="/contact" component={contact}/>
            </div>
          </div>
        </HashRouter>
      );
    }
  }

  export default Main;