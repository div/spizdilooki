var opts = {
  lines: 10, // The number of lines to draw
  length: 5, // The length of each line
  width: 2, // The line thickness
  radius: 4, // The radius of the inner circle
  color: '#000', // #rgb or #rrggbb
  speed: 1, // Rounds per second
  trail: 60, // Afterglow percentage
  shadow: false // Whether to render a shadow
};
var target = document.getElementById('spin');
var spinner = new Spinner(opts).spin(target);