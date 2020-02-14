import { sql } from './../connection';

export function fetch_categories(){

	return new Promise(function(resolve, reject){

		sql.query(
			"SELECT id, parent_id AS parent, name, description FROM category ORDER BY name ASC",
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

/*
 * Using closure table for tree structure inside "category_tree" table
 */
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

	}).then(function(created: any){

		console.log(created);

		return new Promise(function(resolve, reject){

			sql.query(
				"INSERT INTO category_tree(ancestor, descendant, depth) " +
				"VALUES(?, ?, 0)",
				[created.insertId, created.insertId],
				function (err, data){             
			        if(err){
			            reject(err);
			        }
			        else{
			            resolve(created);
			        }
			   }
			);
		});

	}).then(function(created: any){

		return new Promise(function(resolve, reject){

			sql.query(
				"INSERT INTO category_tree(ancestor, descendant, depth) " +
				"SELECT p.ancestor, c.descendant, p.depth + c.depth + 1 " +
				"FROM category_tree p " +
				"INNER JOIN category_tree c " +
				"ON p.descendant = ? and c.ancestor = ?",
				[parent, created.insertId],
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

	});
	//SELECT p.ancestor, c.descendant, p.depth + c.depth + 1 FROM category_tree p INNER JOIN category_tree c ON p.descendant = 22 and c.ancestor = 23

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