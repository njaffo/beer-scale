# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#weights_chart').highcharts({
    chart:
      renderTo: "weights_chart"
      type: "scatter"
    title:
      text: "Beer Over Time"
    xAxis: {
      title: {
        enabled: true,
        text: 'Date'
      },
      startOnTick: true,
      endOnTick: true,
      showLastLabel: true
    },
    yAxis: {
      title: {
        text: 'Beer'
      }
    },
    series: [{
        name: "Raw Weight"
        data: chart_data
      }]
    credits: false
    })
