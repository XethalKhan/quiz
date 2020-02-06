import { fetch_test } from './../data-access/test';
import { question } from './../model/question';

export function test(category: number){

	return new Promise(function(resolve, reject){

		fetch_test(category).then(function(ids: any){

			let q: any = [];

			for(let i = 0; i < ids.length; i++){

				q.push(question(ids[i].id));

			}

			Promise.all(q).then((proc) => {

				resolve(proc);

			});

		})
	});

}