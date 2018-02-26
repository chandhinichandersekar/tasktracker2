// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"



function time_click(ev) {
  let btn = $(ev.target);
  let task_id = btn.data('task-id');
  var dt = new Date();
  var utcDate = dt.toUTCString();
  alert(utcDate);
    let text = JSON.stringify({
      timeblock: {
          timeblock_id: task_id,
          start: "2000-01-01 23:00:07",
          end: "2000-01-01 23:00:07"
        },
    });
    console.log("here");
    $.ajax(timeblock_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => { console.log("success"); },
    });

}


function init_time() {


  $(".time-button").click(time_click);

}

$(init_time);
