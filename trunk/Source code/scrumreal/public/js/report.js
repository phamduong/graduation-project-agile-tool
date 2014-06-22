$(document).ready(function(){
	init1();
	init2();
});
function init1() {
    if ($("#flot-all-team").length > 0) {
        var data = [
            [1262304000000, 100],
            [1264982400000, 90],
            [1267401600000, 78],
            [1270080000000, 67],
            [1272672000000, 50],
            [1275350400000, 41],
            [1277942400000, 30],
            [1280620800000, 21],
            [1283299200000, 10],
            [1285891200000, 5],
            [1288569600000, 0]            
        ];
        $.plot($("#flot-all-team"), [{
            label: "Days",
            data: data,
            color: "#f36b6b"
        }], {
            xaxis: {
//                min: (new Date(2009, 12, 1)).getTime(),
//                max: (new Date(2010, 11, 2)).getTime(),
                mode: "time",
                tickSize: [2, "day"],
                timeformat: "%b%d"
                //monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
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
                show: false
            }
        });
        
        $("#flot-all-team").bind("plothover", function(event, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed();
                    showTooltip(item.pageX, item.pageY, item.series.label + " = " + y);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    }
}

function init2() {
    if ($("#flot-hdd").length > 0) {
        var data = [
            [1364598000000, 10],
            [1364601600000, 12],
            [1364605200000, 14],
            [1364608800000, 14],
            [1364612400000, 10],
            [1364616000000, 16],
            [1364619600000, 18],
            [1364623200000, 15],
            [1364626800000, 16],
            [1364630400000, 18],
            [1364634000000, 20],
            [1364637600000, 22],
            [1364641200000, 24],
            [1364644800000, 25],
            [1364648400000, 27],
            [1364652000000, 31],
            [1364655600000, 33],
            [1364659200000, 36],
            [1364662800000, 37],
            [1364666400000, 38],
            [1364670000000, 39],
            [1364673600000, 42],
            [1364677200000, 45],
            [1364680800000, 47],
            [1364684400000, 50]
        ];
        $.plot($("#flot-hdd"), [{
            label: "HDD usage",
            data: data,
            color: "#f36b6b"
        }], {
            xaxis: {
                min: (new Date("2013/03/30")).getTime(),
                max: (new Date("2013/03/31")).getTime(),
                mode: "time",
                tickSize: [3, "hour"],
            },
            series: {
                lines: {
                    show: true,
                    fill: true
                },
                points: {
                    show: true,
                }
            },
            grid: {
                hoverable: true,
                clickable: true
            },
            legend: {
                show: false
            }
        });
        $("#flot-hdd").bind("plothover", function(event, pos, item) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed();
                    showTooltip(item.pageX, item.pageY, item.series.label + " = " + y + "%");
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    }
}