$(document).ready(function() {
  $.ajax({
    url: "/burnup/initialize",
    type: "GET",
    success: function(response) {
      initializeBurnUpChart("#report-burn-up", response);
    }
  });
});

function initializeBurnUpChart(selector, response) {
  var data1 = [];
  var i = 0;
  $.each(response.yaxis, function(key, value) {
    data1[i] = [];
    data1[i][0] = value.time * 1000;
    data1[i][1] = value.points;
    i++;
  });
  //total line
  var data2 = [];
  $.each(response.yaxis_total, function(key, value) {
    data2[i] = [];
    data2[i][0] = value.time * 1000;
    data2[i][1] = value.points;
    i++;
  });
  //ideal line
  var data3 = [];
  data3[0] = [];
  data3[1] = [];
  data3[0][0] = response.xaxis.project_start_date * 1000;
  data3[0][1] = 0;
  data3[1][0] = response.xaxis.project_end_date * 1000;
  var len = response.yaxis_total.length - 1;
  data3[1][1] = response.yaxis_total[len].points;
  //Initialize flot chart
  $.plot($(selector), [
    {
      label: "Points",
      data: data1,
      color: "#f36b6b"
    }
    ,
    {
      label: "Total line",
      data: data2,
      color: "#0066FF"
    }
    ,
    {
      label: "Ideal line",
      data: data3,
      color: "#75FF47"
    }
  ], {
    xaxis: {
      min: response.xaxis.project_start_date * 1000,
      max: response.xaxis.project_end_date * 1000,
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