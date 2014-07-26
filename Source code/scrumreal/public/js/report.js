function goToBurnDown() {
  var spid = $("#sprint-control-bar #sprint_filter").val();
  var tid = $("#sprint-control-bar #other_filter").val();
  var url = "/burndown/" + spid + "/" + tid + "/";
  window.location = url;
}

function initTeam(spid, tid) {
  $.ajax({
    url: "/burndown/sprint_each_team_burndown",
    type: "POST",
//    async: false,
    data: {spid: spid, tid: tid},
    success: function(response) {
      initializeChart("#team_report_" + tid, response);
    }
  });
}

function createIdealData(response) {
  //ideal line
  var data2 = [];
  data2[0] = [];
  data2[1] = [];
  data2[0][0] = response.xaxis.sprint_start_date * 1000;
  data2[0][1] = response.yaxis[0].days;
  data2[1][0] = response.xaxis.sprint_end_date * 1000;
  data2[1][1] = 0;
  return data2;
}

function initializeChart(selector, response) {
  var data1 = [];
  var i = 0;
  $.each(response.yaxis, function(key, value) {
    data1[i] = [];
    data1[i][0] = value.time * 1000;
    data1[i][1] = value.days;
    i++;
  });
  var data2 = createIdealData(response);
  //Initialize flot chart
  $.plot($(selector), [
    {
      label: "Days",
      data: data1,
      color: "#f36b6b"
    }
    ,
    {
      label: "Ideal line",
      data: data2,
      color: "#75FF47"
    }
  ], {
    xaxis: {
      min: response.xaxis.sprint_start_date * 1000,
      max: response.xaxis.sprint_end_date * 1000,
      mode: "time",
      tickSize: [2, "day"],
      timeformat: "%b%d",
    },
    yaxis: {
      min: 0
    },
    series: {
      lines: {
        show: true,
        fill: false,
      },
      points: {
        show: true,
      },
    },
    grid: {
      hoverable: true,
      clickable: true
    },
    legend: {
      show: true
    }
  });

  $(selector).bind("plothover", function(event, pos, item) {
    if (item) {
      if (typeof previousPoint !== "undefined") {
        if (previousPoint !== item.dataIndex) {
          previousPoint = item.dataIndex;
          $("#tooltip").remove();
          var y = item.datapoint[1].toFixed();
          showTooltip(item.pageX, item.pageY, item.series.label + " = " + y);
        }
      }
    } else {
      $("#tooltip").remove();
      previousPoint = null;
    }
  });
}

function initAllTeam(spid) {
  $.ajax({
    url: "/burndown/sprint_all_team_burndown",
    type: "POST",
//    async: false,
    data: {spid: spid},
    success: function(response) {
      initializeChart("#flot-all-team", response);
    }
  });
}

function updateSelectedSprint(select) {
  if (typeof select != "undefined" && select != "") {
    $("#sprint_filter").val(select);
  }

}

function updateOtherfilterReport(select) {
  if (typeof select != "undefined" && select != "") {
    $("#other_filter").val(select);
  }
}