import { sql } from './../connection';

export function fetch_test(){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id FROM question ORDER BY RAND() LIMIT 10", 
			function (err, data){             
		        if(err){
		            reject(err);
		        }
		        else{
		            resolve(data);
		        }
		   }
		);

	});

}