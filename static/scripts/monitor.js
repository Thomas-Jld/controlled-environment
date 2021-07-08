let sensorsIds = [];
let lastValues = {};

let margins = {
    top: 30,
    right: 60,
    bottom: 80,
    left: 60
}

let socket = io.connect('http://0.0.0.0:27170');

function getTimeValue() {
    var dateBuffer = new Date();
    var Time = dateBuffer.getTime();
    return Time;
}

let dataP = genData();

let chart_names = ["temperature", "pressure", "humidity", "gas"];
let chart_ranges = ["range", "range", "range", "range"];
let chart_scales = [1, 0.001, "range", "range"];
let charts = {};
chart_names.forEach((chart_name, i) => {
    console.log(chart_name);
    charts[chart_name] = genChart(chart_name, chart_ranges[i], dataP);
});
console.log(charts);

function updateData(newValues) {
    lastValues[newValues.id] = newValues;
    if (newValues.id in sensorsIds) {
        chart_names.forEach(chart_name => {
            let dataPoint = genPoint(chart_name);
            charts[chart_name].push(dataPoint);
        });
    } else {
        sensorsIds.push(newValues.id);
        chart_names.forEach(chart_name => {
            let data = genData(chart_name);
            charts[chart_name].update(data);
        });
    }
}

socket.on("update", updateData);


function genData(chart_name) {
    let data = [];
    for (let i = 0; i < sensorsIds.length; i++) {
        data.push({
            label: 'Layer ' + i,
            values: [{
                time: getTimeValue(),
                y: parseFloat(lastValues[sensorsIds[i]][chart_name])
            }]
        });
    }
    return data;
}


function genPoint(chart_name) {
    let dataPoint = [];
    for (let i = 0; i < sensorsIds.length; i++) {
        dataPoint.push({
            time: getTimeValue(),
            y: parseFloat(lastValues[sensorsIds[i]][chart_name])
        });
    }
    return dataPoint;
}


function genChart(name, range, data) {
    return $('#' + name).epoch({
        type: 'time.line',
        data: data,
        axes: ['left', 'right', 'bottom'],
        range: {
            left: range,
            right: range
        },
        tickFormats: { left: function(d) { return d.toFixed(2); } },
        margins: margins,
        width: document.getElementById(name).getBoundingClientRect().width,
        height: document.getElementById(name).getBoundingClientRect().height,
    });
}