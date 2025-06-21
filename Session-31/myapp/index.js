import http from 'http'
const message= 'Hello from default config'

http.createServer((req,res)=>{
    res.writeHead(200);
    res.end(`Message: ${message}\n`);
}).listen(5000);