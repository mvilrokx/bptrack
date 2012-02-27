var chart; // globally available

$(document).ready(function() {
  var options = {
    chart: {
      renderTo: 'bp-chart',
      type: 'spline',
      zoomType: 'x',
      width: 960,
      height: 600
    },
    title: {
      text: 'Bloodpressure Readings'
    },
    xAxis: {
      type: 'datetime'
    },
    yAxis: [{ // Primary yAxis
          title: {
            text: 'Pressure (in mmHg)'
          },
          // labels: {
          //   formatter: function() {
          //     return this.value +' mmHg';
          //   }
          // }  
        }, { // Secondary yAxis
          title: {
            text: 'Heartrate (in bpm)'
          },
          // labels: {
          //   formatter: function() {
          //     return this.value +' bpm';
          //   }
          // },
          opposite: true
    }],
    tooltip: {
      crosshairs: true,
      shared: true,
      formatter: function() {
        var tooltip_content = '<b>' + Highcharts.dateFormat('%A, %B %e %Y, %H:%M', this.x) + '</b><br/>';
        $.each(this.points,  function(index, point) { 
          tooltip_content += '<span style="color:' + point.series.color + ';">' + point.series.name + '</span>: <b>' + point.y + '</b><br/>';
        });
        tooltip_content += '<br/><p>Comment: <em>' + this.points[0].point.name + '</em></p>';
        return tooltip_content;
      }
    },

    series: [{
      name: 'Systolic',
      //color: '#557260'
    }, {
      name: 'Diastolic',
      //color: '#6A8B92'
    }, {
      name: 'Heartrate',
      //color: '#3291B1',
      yAxis: 1
    }]
  };

  $.get(
    'bloodpressure_readings',
    {direction: "asc", sort_by: "recorded_at", per_page: "999"},
    function (readings) {
      var systolics = [], diastolics = [], heartrates = [];

      for(var i=0;i<readings.length;i++){
        var reading = readings[i];
        var d = Date.parse(reading.recorded_at);
        //alert(d);
        systolics.push({
          x: d, 
          y: reading.systolic_pressure,
          name: reading.comment //stuffing this here so I can show it in tooltip
        });
        diastolics.push([d, reading.diastolic_pressure]);
        heartrates.push({
          x: d, 
          y: reading.heart_rate
        });
      }
      options.series[0].data = systolics;
      options.series[1].data = diastolics;
      options.series[2].data = heartrates;
      chart = new Highcharts.Chart(options);
    },
    "json"
  );

});
