import { fetch_question, fetch_questions, fetch_answers } from './../data-access/question';
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