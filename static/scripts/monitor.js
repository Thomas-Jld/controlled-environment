let sensorsIds = [];
let lastValues = {};

let margins = {
    top: 10,
    right: 60,
    bottom: 30,
    left: 60
}

let socket = io.connect('http://0.0.0.0:27170');

function getTimeValue() {
    var dateBuffer = new Date();
    return dateBuffer.getTime();
}

let time = getTimeValue()
let dataP = genData(time);

let chart_names = ["temperature", "pressure", "humidity", "gas"];
let chart_ranges = ["range", "range", "range", "range"];
let chart_scales = [2, 2, 2, 2];
let charts = {};
chart_names.forEach((chart_name, i) => {
    console.log(chart_name);
    charts[chart_name] = genChart(chart_name, chart_ranges[i], dataP);
});
console.log(charts);

function updateData(newValues) {
    lastValues[newValues.id] = newValues;
    time = getTimeValue();
    if (newValues.id in sensorsIds) {
        chart_names.forEach(chart_name => {
            let dataPoint = genPoint(time, chart_name);
            charts[chart_name].push(dataPoint);
        });
    } else {
        sensorsIds.push(newValues.id);
        chart_names.forEach(chart_name => {
            let data = genData(time, chart_name);
            charts[chart_name].update(data);
        });
    }
}

socket.on("update", updateData);


function genData(time, chart_name) {
    let data = [];
    for (let i = 0; i < sensorsIds.length; i++) {
        data.push({
            label: 'Layer ' + i,
            values: [{
                time: time,
                y: parseFloat(lastValues[sensorsIds[i]][chart_name])
            }]
        });
    }
    return data;
}


function genPoint(time, chart_name) {
    let dataPoint = [];
    for (let i = 0; i < sensorsIds.length; i++) {
        dataPoint.push({
            time: time,
            y: parseFloat(lastValues[sensorsIds[i]][chart_name])
        });
    }
    return dataPoint;
}


function genChart(name, range, data) {
    return $('#' + name).epoch({
        type: 'time.line',
        data: data,
        axes: ['right', 'bottom'],
        range: {
            left: range,
            right: range
        },
        ticks: {time: 8},
        tickFormats: { 
            bottom: function(d) { return new Date(d).toLocaleTimeString(); },
            right: function(d) { return d.toFixed(2); },
        },
        windowSize: 60,
        queueSize: 60,
        history: 180,
        margins: margins,
        width: document.getElementById(name).getBoundingClientRect().width,
        height: document.getElementById(name).getBoundingClientRect().height - 30,
    });
}