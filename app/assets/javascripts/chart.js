jQuery(function ($) {
  google.load('visualization', '1.1', {packages: ['line', 'corechart']});
  google.setOnLoadCallback(drawChart);

  function drawChart() {
    var graph = $('#graph');
    var graph_data = JSON.parse($('#graph').attr('data-points')); 

    console.log(graph_data);

    var chartDiv = document.getElementById('chart_div');
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'Sprint End Date');
    data.addColumn('number', "PO");
    data.addColumn('number', "Team");
    data.addColumn('number', "Combined");
    data.addColumn({type:'string', role:'annotation'});
    data.addColumn({type:'string', role:'annotationText'});

    data.addRows(graph_data)

    var classicOptions = {
      //title: 'Average Temperatures and Daylight in Iceland Throughout the Year',
      curveType: 'function',
      width: "100%",
      height: 500,
      pointSize: 7,
      // Gives each series an axis that matches the vAxes number below.
      series: {
        0: {targetAxisIndex: 0},
        1: {targetAxisIndex: 1}
      },
      vAxes: {
        // Adds titles to each axis.
        0: {title: 'Sprint Rating'},
        1: {title: 'Sprint Rating'}
      },
      hAxis: {
        //ticks: [new Date(2014, 0), new Date(2014, 1), new Date(2014, 2), new Date(2014, 3),
          //      new Date(2014, 4),  new Date(2014, 5), new Date(2014, 6), new Date(2014, 7),
            //    new Date(2014, 8), new Date(2014, 9), new Date(2014, 10), new Date(2014, 11),
              //  new Date(2015, 0)
               //]
      },
      vAxis: {
        viewWindow: {
          max: 10
        }
      }
    };

    function drawClassicChart() {
      var classicChart = new google.visualization.LineChart(chartDiv);
      classicChart.draw(data, classicOptions);
    }

    drawClassicChart();
  }
}