/*global $*/
$(document).on('turbolinks:load', function(){
   $('#ramen_postal_code').jpostal({
    postcode: ['#ramen_postal_code'],
    address: {
      '#ramen_prefecture_code': '%3',
      '#ramen_city': '%4%5',
      '#ramen_street': '%6%7',
    },
  });
});