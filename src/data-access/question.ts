import { sql } from './../connection';

export function fetch_questions(){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, text, category_id AS category, type_id AS type FROM question", 
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

export function fetch_question(id: number){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, text, category_id AS category, type_id AS type FROM question WHERE id = ? LIMIT 1",
			id,
			function (err, data){             
		        if(err){
		            reject(err);
		        }
		        else{
		        	if(data.length === 0){
		        		resolve(null);
		        	}
		            resolve(data[0]);
		        }
		   }
		);
	});

}

export function fetch_answers(id: number){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT type_id AS type FROM question WHERE id = ? LIMIT 1",
			id,
			function (err, type){            
		        if(err){
		            reject(err);
		        }
		        else{
		        	
		        	switch(type[0].type){
					case 1:{

						sql.query(
							"SELECT correct, text FROM mcq_answer WHERE question_id = ? ORDER BY RAND()",
							id,
							function (err, answers: any){             
						        if(err){
						            reject(err);
						        }
						        else{

						        	for(let i = 0; i < answers.length; i++){

						        		answers[i].correct = (answers[i].correct === 0 ? false : true);

						        	}

						        	resolve(answers);
						        }
						   });

						break;
					}
					case 2:{
						
						sql.query(
							"SELECT text FROM ftb_answer WHERE question_id = ?",
							id,
							function (err, answers: any){             
						        if(err){
						            reject(err);
						        }
						        else{

						        	resolve(answers[0]);
						        }
						   });

						break;
					}
					case 3:{
						resolve(3);
						break;
					}

				}

		        }
		   }
		);
	});

}