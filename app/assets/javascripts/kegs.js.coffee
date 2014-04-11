# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO Need to work with the chart on date formatting, creating warning zone color, starting y axis at 0 pints

jQuery ->
  $('#weights_chart').highcharts({
    chart:
      renderTo: "weights_chart"
      type: "spline"
    title:
      text: "Beer Over Time"
    xAxis: {
      title: {
        enabled: true,
        text: 'Date'
      },
      type: 'datetime',
      dateTimeLabelFormats: {
        month: '%e. %b',
        year: '%b'
      }
    },
    yAxis: {
      min: 0,
      title: {
        text: 'Pints'
      }
    },
    series: [{
      name: "Pints"
      data: chart_data
    }]
    credits: false
  })
