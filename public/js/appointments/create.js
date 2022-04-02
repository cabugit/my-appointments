$(function() {
    const specialtyId_ini = document.getElementById("specialty").value;
    const url_ini = '/api/specialties/'+specialtyId_ini+'/doctors';
    const doctor = $('#doctor');
    const date = $('#date');

    //$.getJSON(url_ini, onDoctorsLoaded);
    //loadHours();

    const $specialty = $('#specialty');
    $specialty.change(() => {
        const specialtyId = document.getElementById("specialty").value;
        const url = '/api/specialties/'+specialtyId+'/doctors';
        $.getJSON(url, onDoctorsLoaded);
    });
    doctor.change(loadHours);
    date.change(loadHours);
});

function onDoctorsLoaded(doctor) {
    let htmlOptions = '';
    doctor.forEach(function(element) {
        //console.log(element.id + ' - ' + element.name);
        htmlOptions += '<option value ="'
            + (element.id.toString())
            + '">'
            + (element.name.toString()) + '</option>';
    });
    document.getElementById('doctor').innerHTML = htmlOptions;
    loadHours();
}

function loadHours(){
    let doctor = document.getElementById("doctor").value;
    let date = document.getElementById("date").value;
    const urlx = '/api/schedule/hours?date=' + date.toString() + '&doctor_id=' + doctor.toString();
    $.getJSON(urlx, displayHours);
}

function displayHours(data) {
    if(!data.morning && !data.afternoon ||
        data.morning.lenght == 0 && data.afternoon.lenght == 0){
        const noHoursAlert = '<div class="alert alert-secondary text-muted" role="alert"><strong>Lo sentimos!</strong> No se encontraron horas disponibles para el médico y fecha actualmente seleccionados. <span><b> Para obtener las horas disponibles! - </b> Seleccione una Especialidad, un Médico y una fecha de atención.</span></div>';
        document.getElementById('hours').innerHTML = noHoursAlert;
        return;
    }

    let htmlHours = '<div class="row justify-content-left text-muted pr-4 ml-4">';
    if(data.morning){
        const morning_intervals = data.morning;
        buttonNumber = 1;
        morning_intervals.forEach(interval => {
            //console.log(interval.start.toString() + ' - ' + interval.end.toString());
            htmlHours += getRadioHtml(interval.start.toString() , interval.end.toString(), buttonNumber);
            buttonNumber++;
        });
    }
    if(data.afternoon){
        const afternoon_intervals = data.afternoon;
        afternoon_intervals.forEach(interval => {
            //console.log(interval.start.toString() + ' - ' + interval.end.toString());
            htmlHours += getRadioHtml(interval.start.toString(), interval.end.toString(), buttonNumber);
            buttonNumber++;
        });
    }
    const noHoursAlert = '<div class="alert alert-secondary text-muted" role="alert"><strong>Lugares disponibles: &nbsp;</strong>(Seleccione una hora para su cita).' + '<br><br>' + htmlHours + '</div></div>';
    document.getElementById('hours').innerHTML = noHoursAlert;
}

function getRadioHtml(interval_start, interval_end, buttonNum){
    let interval = interval_start + ' - ' + interval_end;
    return '<div class="custom-control custom-radio mb-3 ml-4"><input name="scheduled_time" class="custom-control-input" id="interval'+buttonNum.toString()+'" type="radio" value="'+interval_start+'" required><label class="custom-control-label" for="interval'+buttonNum.toString()+'">'+interval+'</label></div>';
}
