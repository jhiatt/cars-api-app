/* global Vue */

document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      cars: [],
      newManufacture: "",
      newVin: "",
      errors: [],
      fun : ""
    },
    mounted: function() {
      $.get('/api/v2/cars.json', function(result) {
        this.cars = result;
      }.bind(this));
    },
    methods: {
      addCar: function() {
        this.errors = [];
        var params = {vin: this.newVin, manufacture: this.newManufacture};
        $.post('/api/v2/cars.json', params, function(result) {
          this.cars.push(result);
          this.newManufacture = "";
          this.newVin = "";
        }.bind(this)).fail(function(response) {
          this.errors = response.responseJSON.errors;
        }.bind(this));
      }
      // deleteCar: function() {
      //   $.delete('/api/v2/cars.json', function(result))
      // }
    }
  });
});