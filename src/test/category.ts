import * as c from "./../data-access/category";

c.insert_category(22, "Cisco CCNA lesson 1.2", "Cisco lesson 2 in part 1").then(function(res: any){
	console.log(res);
}).catch(function(err){
	console.log(err);
});