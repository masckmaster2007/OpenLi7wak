const express = require('express');
const app = express();

app.use(express.urlencoded({ extended: true }));

app.all('/', function(req, res) {
  res.send(`
  <html>
  <head>
  <title>Successfully installed</title>
  <style>
  body {color: white; background-color: black}
  .center{
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  </style>
  </head>
  <body>
  <div class="center"><h1>
  OpenLi7wak has been successfully installed
  </h1>
  <img src="https://oplaadbarebatterijen.netlify.app/wth.png" style="height: 10%">
  </div>
  </body>
  </html>
  `);
});

app.post('/login/:id', (req, res) => {
  const pid = req.params.id;
  res.send(`${pid},${pid}`);
});

app.get('/login/:id', (req, res) => {
  const pid = req.params.id;
  res.send(`${pid},${pid}`);
});

app.post('/level/:pid/:lid', (req, res) => {
  const pid = req.params.pid;
  const level = proutte();
  const desc = 'Li7wak';
  const enc = Buffer.from(desc).toString('base64');
  const va = req.params.lid; // Assuming you have a body parser middleware set up
  const response = `1:${va}:2:${level}${va}:3:${enc}:4:H4sIAAAAAAAAC6WQwQ3DIAxFF3IlfxsIUU6ZIQP8AbJChy_GPSZqpF7-A4yfDOfhXcCiNMIqnVYrgYQl8rDwBTZCVbkQRI3oVHbiDU6F2jMF_lesl4q4kw2PJMbovxLBQxTpM3-I6q0oHmXjzx7N0240cu5w0UBNtESRkble8uSLHjh8nTubmYJZ2MvMrEITEN0gEJMxlLiMZ28frmj:5:1:6:${pid}:8:0:9:0:10:1:12:0:13:21:14:0:17::43:0:25::18:0:19:0:42:0:45:1:15:0:30:55610687:31:0:28:1 hour:29:1 hour:35:546561:36::37:0:38:0:39:50:46::47::40::27:AQcHBwEL#1bae6491cc87c72326abcbc0a7afaee139aa7088#f17c5a61f4ba1c7512081132459ddfaaa7c6f716`;
  res.send(response);
});

/* JS
if (process.argv.length < 2) {
  console.log("Port required (server.exe PORT)");
} else {
  const port = process.argv[2];
  app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
  });
}
*/


if (process.argv.length < 3) {
console.log("Port required (server.exe PORT)");
} else {
const port = process.argv[2];
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
}


function proutte() {
  const phrases = [
    "Li7wak ",
    "ta soeur ",
    "Clubette vs ta matchar v",
    "appser boss fight ",
    "cacaboudin ",
    "lunatic cirque ",
    "le wokisme ",
    "tools page where ",
    "Esi eisai ",
    "didnes real v",
    "le 18 25 ta pt ",
    "atlas accept my frq",
    "ichigo plus xyrr lore v",
    "Jean TaSoeur v",
    "update ur gdps ",
    "hcaptcha wen ",
    "cirqueman ",
    "ddos par clubette ",
    "ddos by jean ",
    "2.2 wen ",
    "gdps xploit fixr v",
    "nox gdps season ",
    "ta madre ",
    "ik heb jouw ip ",
    "sto parko ",
    "ego otan ekana raid v",
    "vges ekso esi ",
    "skotosa ton mattheo ",
    "skotosa ton ichigo",
    "ratio by ",
    "json parsed data ",
    "download ",
    "trianna sfw ",
    "yello 4 the lulz",
    "Black Women v",
    "explorers leak v",
    "xaxa ",
    "pie ",
    "sto github x",
    "robtop ",
  ];

  const randomPhrase = phrases[Math.floor(Math.random() * phrases.length)];
  return randomPhrase;
}