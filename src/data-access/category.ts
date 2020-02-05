import { sql } from './../connection';

export function fetch_categories(){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, parent_id AS parent, name, description FROM category",
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

export function fetch_category(id: number){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, parent_id AS parent, name, description FROM category WHERE id = ? LIMIT 1",
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

export function insert_category(parent: number, name: string, description: string){

	return new Promise(function(resolve, reject){

		sql.query(
			"INSERT INTO category(parent_id, name, description) VALUES(?, ?, ?)",
			[parent, name, description],
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

export function fetch_question_category(id: number){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, parent_id AS parent, name, description FROM category WHERE id = (SELECT category_id FROM question WHERE id = ?) LIMIT 1",
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