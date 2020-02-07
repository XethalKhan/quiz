import { fetch_question, fetch_questions, fetch_answers, insert_question, insert_mcq_answer } from './../data-access/question';
import { fetch_question_category } from './../data-access/category';
import { fetch_question_type } from './../data-access/type';

export function question(id: number){

	return Promise.all(
		[
			fetch_question(id), 
			fetch_question_category(id), 
			fetch_question_type(id),
			fetch_answers(id)

		]).then(function(proc: any){

			let question = proc[0];
			question.category = proc[1];
			question.type = proc[2];
			question.answer = proc[3];

			return question;

	});

}

export function questions(){

	return fetch_questions();

}

export function create_question(obj: any){

	let question = obj.question;
	let category = obj.category;
	let type = obj.type;

	return new Promise(function(resolve, reject){

		insert_question(question, category, type).then(function(id: any){

			console.log(id);

			let cnt = obj.answers.length;
			let a = [];

			for(let i = 0; i < cnt; i++){
				a.push(insert_mcq_answer(id, obj.answers[i].correct, obj.answers[i].text));
			}

			Promise.all(a).then(function(proc: any){

				resolve();

			});

		});
	});

}