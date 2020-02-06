import express, {Application, Request, Response} from 'express';

import * as TestModel from './../../model/test';

import {question} from './../../model/question';

export function routes(app: Application){

	app.get("/test", function(req: Request, res: Response){
		
		let category = req.query.category;

		if(/\d/.test(category)){
			category = Number(category);
		}else{
			category = 0;
		}

		TestModel.test(category).then(function(data: any){

			res.send({"questions": data});


		}).catch(function(err: any){

			res.send(err);

		});

	});

}