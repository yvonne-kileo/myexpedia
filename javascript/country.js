$(document).ready(function(){

    const countrymodal = $("#countrydetailsmodal"),
        addnewcountrybutton = $("#addnewcountry"),
        countryidfield = $("#countryid"),
        countrynamefield = $("#countryname"),
        savecountrybutton = $("#savecountry"),
        notifications = $("#notifications"),
        countrytable=$("#countrytable"),
        countrynotifications=$("#countrynotifications");

    getcountrytable()
    addnewcountrybutton.on("click", function(){
        countrymodal.modal("show");
    });

    
    savecountrybutton.on("click", function(){
        const countryname = countrynamefield.val();
        const countryid = countryidfield.val();

        if (countryname == ""){
            notifications.html("<div class='alert alert-primary'>Please enter country name</div>");
            countrynamefield.focus();
        } 
        else 
        {
            $.post(
                "controllers/countryoperations.php",
                {
                    savecountry: true,
                    countryid: countryid,
                    countryname: countryname
                },
                function(data){
                    if(isJSON(data)){
                        data = JSON.parse(data);
                        if(data.status == "success"){
                            notifications.html("<div class='alert alert-success'>Country has been saved successfully</div>");
                            countrynamefield.val("");
                            countrynamefield.focus();
                            //Refresh countries list
                        } 
                        else if(data.status == "exists"){
                            notifications.html("<div class='alert alert-info'>Country already exists in the system</div>");
                            countrynamefield.focus();
                        }
                    } 
                    else 
                    {
                        notifications.html(`<div class='alert alert-danger'>Sorry an error occurred: ${data}</div>`);
                    }
                }
            );
        }
    });

    
    countrynamefield.on("input", function(){
        notifications.html("");
    });

    
    function isJSON(str){
        try {
            JSON.parse(str);
            return true;
        } catch (e) {
            return false;
        }
    }

    
    function getcountrytable(){
    $.getJSON(
        "controllers/countryoperations.php",
        { getcountry: true }
    )
    .done(function(data){

        let results = "";

        data.forEach(function(country, i){
            results += `<tr>`;
            results += `<td>${i + 1}</td>`;
            results += `<td>${country.countryname}</td>`;
            results += `<td>${country.cities}</td>`;
            results += `<td>${country.airports}</td>`;
            results += `<td>${country.airline}</td>`;
            results += `<td><a href='#'><i class='fas fa-edit fa-lg'></i></a></td>`;
            results += `</tr>`;
        });

        
        countrytable.find("tbody").html(results);

    })
    .fail(function(response, status, error){
        countrynotifications.html(`<div class='alert alert-danger'>${response.responseText}</div>`);
    });
}

    

});
