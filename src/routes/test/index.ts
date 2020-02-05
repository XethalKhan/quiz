import express, {Application, Request, Response} from 'express';

import * as TestModel from './../../model/test';

import {question} from './../../model/question';

export function routes(app: Application){

	app.get("/test", function(req: Request, res: Response){
		
		TestModel.test().then(function(data: any){

			res.send({"questions": data});


		}).catch(function(err: any){

			res.send(err);

		});

	});

}