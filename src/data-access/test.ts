import { sql } from './../connection';

export function fetch_test(category: number){

	return new Promise(function(resolve, reject){

		let where = "WHERE type_id = 1 ";
		let params = [];

		if(!(category === 0)){
			where += "AND (category_id = ? OR category_id IN (SELECT id FROM category WHERE parent_id = ?))";
			params.push(category);
			params.push(category);
		}

		let query = "SELECT id FROM question " + where + " ORDER BY RAND() LIMIT 10";

		sql.query(
			query, 
			params,
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