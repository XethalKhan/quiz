import { sql } from './../connection';

export function fetch_question_type(id: number){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, name, description FROM type WHERE id = (SELECT type_id FROM question WHERE id = ?) LIMIT 1",
			id,
			function (err, data){             
		        if(err){
		            reject(err);
		        }
		        else{
		            resolve(data[0]);
		        }
		   }
		);

	});

}