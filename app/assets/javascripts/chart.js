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
            text: 'Pressure'
          },
          labels: {
            formatter: function() {
              return this.value +' mmHg';
            }
          }  
        }, { // Secondary yAxis
          title: {
            text: 'Heartrate'
          },
          labels: {
            formatter: function() {
              return this.value +' bpm';
            }
          },
          opposite: true
    }],
    tooltip: {
      crosshairs: true,
      shared: true
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
        systolics.push([d, reading.systolic_pressure]);
        diastolics.push([d, reading.diastolic_pressure]);
        heartrates.push({
          x: d, 
          y: reading.heart_rate, 
          events: {
            click: 
              function() {
                hs.htmlExpand(null, {
                  pageOrigin: {
                    x: this.pageX,
                    y: this.pageY
                  },
                  headingText: this.series.name,
                  maincontentText: Highcharts.dateFormat('%A, %b %e, %Y', this.x) +':<br/> '+
                    this.y +' visits',
                  width: 200
                });
              }

          }
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
