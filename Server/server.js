var dgram = require("dgram");
var server = dgram.createSocket('udp4');
var clients = [];
server.on('listening',function() {console.log('listening')});
server.on('message',function(msg,remote) {
  var str = msg.toString();
if(str == 'connecting') {clients[clients.length] = remote.address.toString();
  console.log(remote.address.toString() + ' is connecting!');
}
else if(str == 'disconnecting') {
  console.log(remote.address.toString() + ' is disconnecting!');
  var toRemove = clients.indexOf(remote.address.toString());
  clients.splice(toRemove,1);
}
else {
  console.log(msg.toString());
  for(i=0;i<clients.length;i++) {
    var toSend = remote.address + ":" + msg.toString();
    toSend = new Buffer(toSend);
    server.send(toSend,0,toSend.length,8075,clients[i],function(err) {});
  }
}
});
server.bind(8075);
