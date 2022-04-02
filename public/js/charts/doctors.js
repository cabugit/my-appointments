const chart = Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Médicos mas activos'
    },
    xAxis: {
        categories: [],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Cantidad de citas'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {

    },
    series: []
});

let $start, $end;

function fetchData(){
    const startDate = $start.val();
    const endDate   = $end.val();
    url = '/charts/doctors/column/data?start='+startDate+'&end='+endDate;
    // fetch API
    fetch(url)
        .then(response => response.json())
        .then(data => {
        //.then(function(response) {
        //    return response.json();
        //})
        //.then(function(data){
            //console.log(data);
            chart.xAxis[0].setCategories(data.categories);
            if(chart.series.length > 0){
                chart.series[1].remove();
                chart.series[0].remove();
            }
            chart.addSeries(data.series[0]);
            chart.addSeries(data.series[1]);
        });
}

$(function(){
    $start = $('#startDate');
    $end   = $('#endDate');
    fetchData();
    $start.change(fetchData);
    $end.change(fetchData);
});
