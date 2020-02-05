import express, {Application, Request, Response} from 'express';

import * as QuestionModel from './../../model/question';

export function routes(app: Application){

	app.get("/question", function(req: Request, res: Response){
		
		QuestionModel.questions().then(function(data){

			res.send(data);

		}).catch(function(err){

			console.log("error: ", err);
			res.send(err);

		});

	});


	app.get("/question/:id", function(req: Request, res: Response){
		
		QuestionModel.question(Number(req.params.id)).then(function(data){

			res.send(data);

		}).catch(function(err){

			console.log("error: ", err);
			res.send(err);

		});

	});



}