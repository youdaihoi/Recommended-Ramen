/*global $*/
$(function() {
  return $('#ramen_postal_code').jpostal({
    postcode: ['#ramen_postal_code'],
    address: {
      '#ramen_prefecture_name': '%3',
      '#ramen_city': '%4%5',
      '#ramen_street': '%6%7',
    },
  });
});