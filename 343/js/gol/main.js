const prompt = require('prompt-sync')();
function printB(data){
	let hight=Number(data[1])+Number(data[0])*10;
	let width=Number(data[3])+Number(data[2])*10;
  data= data.match(/\S/g);
	for(let i=0 ;i<hight*2;i++){
		for(let j=0;j<width*2;j++){
			process.stdout.write(data[(i+4)*(j)]);
				}
				console.log();
			}
	}
function start(){
let contents=[];
let fs = require('fs');
fs.readFile('file','utf8',function(err, contents){
	printB(contents);
	});}

console.clear();
//usableBoard();
start();
