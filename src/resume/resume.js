import React, { Component } from "react";
 
class resume extends Component {
  render() {
    return (
      <div>
        <h2>Resume</h2>
        <object data="brentufkes.com/static/Resume.pdf?embed=true" type="application/pdf">
          <embed src="brentufkes.com/static/Resume.pdf?embed=true" type="application/pdf"/>
        </object> 
      </div>
    );
  }
}
 
export default resume;