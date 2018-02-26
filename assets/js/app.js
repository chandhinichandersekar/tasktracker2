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
  var timeblock;

  function start_click(ev) {
    let btn = $(ev.target);
    let task_id = btn.data('task-id');
    var start_working = btn.data('start-time');
    console.log("start working",start_working)
    let text = JSON.stringify({
      timeblock: {
          timeblock_id: task_id,
          start: start_working,
          end: start_working
        },
    });

    $.ajax(timeblock_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => { timeblock = resp.data.id;},
    });
  }

    function stop_click(ev) {
      console.log(timeblock);
      let btn = $(ev.target);
      let task_id = btn.data('task-id');
      var stop_working = btn.data('stop-time');
      console.log("stop working",stop_working)
      let text = JSON.stringify({
        timeblock: {
            end: stop_working
          },
      });

      $.ajax(timeblock_path + "/" + timeblock, {
      method: "patch",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => {console.log("stop timer"); },
    });
  }

  function save_time_click(ev) {
    let btn = $(ev.target);
    let task_id = btn.data('task-id');
    var start = new Date($('.start-time').val()).toISOString();
    alert(start);
    var end = new Date($('.end-time').val()).toISOString();
    console.log("start working",start)
    console.log("start working",end)
    let text = JSON.stringify({
      timeblock: {
          timeblock_id: task_id,
          start: start,
          end: end
        },
    });

    $.ajax(timeblock_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => { console.log("sucees");},
    });
  }

function init_time() {
  $(".start-button").click(start_click);
  $(".stop-button").click(stop_click);
  $(".time-button").click(save_time_click);
}

$(init_time);
