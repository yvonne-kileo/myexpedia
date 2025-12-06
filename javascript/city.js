$(document).ready(function() {

    const addnewbutton = $("#addnewcity"),
          citydetailsmodal = $("#citydetailsmodal"),
          citycountrylist = $("#citydetailscountry"),
          citynamefield = $("#citydetailscityname"),
          savecitybutton = $("#savecity"),
          citydetailnotifications = $("#citydetailsnotifications"),
          cityidfield = $("#cityid");

    // Open modal and reset fields
    addnewbutton.on("click", function() {
        cityidfield.val(0);
        citynamefield.val("");
        citydetailnotifications.html("");
        loadCountries();
        citydetailsmodal.modal("show");
    });

    // Load countries via AJAX
    function loadCountries() {
        $.getJSON("controllers/countryoperations.php", { getcountry: true })
        .done(function(data) {
            let options = `<option value="">Choose Country</option>`;
            data.forEach(function(country) {
                options += `<option value="${country.countryid}">${country.countryname}</option>`;
            });
            citycountrylist.html(options);
        })
        .fail(function(xhr) {
            citydetailnotifications.html(`<div class='alert alert-danger'>Failed to load countries: ${xhr.responseText}</div>`);
        });
    }

    // Save city
    savecitybutton.on("click", function() {
        const cityid = cityidfield.val();
        const countryid = citycountrylist.val();
        const cityname = citynamefield.val().trim();

        // Validation
        if (!countryid) {
            citydetailnotifications.html(`<div class='alert alert-info'>Please select a valid country first</div>`);
            citycountrylist.focus();
            return;
        }
        if (!cityname) {
            citydetailnotifications.html(`<div class='alert alert-info'>Please provide city name first</div>`);
            citynamefield.focus();
            return;
        }

        // AJAX POST to insert city
        $.post("controllers/cityoperations.php", {
            insertcity: true,
            cityid: cityid,
            cityname: cityname,
            countryid: countryid
        }, function(data) {
            if (isJSON(data)) {
                data = JSON.parse(data);
                if (data.status === "success") {
                    citydetailnotifications.html(`<div class='alert alert-success'>City saved successfully</div>`);
                    citynamefield.val("");
                    cityidfield.val(0);
                    loadCountries();
                } else if (data.status === "exists") {
                    citydetailnotifications.html(`<div class='alert alert-info'>City name already exists</div>`);
                } else {
                    citydetailnotifications.html(`<div class='alert alert-danger'>${data.message}</div>`);
                }
            } else {
                citydetailnotifications.html(`<div class='alert alert-danger'>Unexpected error: ${data}</div>`);
            }
        });
    });

    // Helper: Check if string is JSON
    function isJSON(str) {
        try { JSON.parse(str); return true; }
        catch(e){ return false; }
    }

});
