var socket = io.connect(host);
socket.on('events', function(data) {
  console.log(data);
  socket.emit('events', {my: 'data'});
});
