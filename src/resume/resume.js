import React, { Component } from "react";
 
class resume extends Component {
  render() {
    return (
      <div>
        <h2>Resume</h2>
        <object data="../static/Resume.pdf" type="application/pdf">
          <embed src="../static/Resume.pdf" type="application/pdf"/>
        </object> 
      </div>
    );
  }
}
 
export default resume;