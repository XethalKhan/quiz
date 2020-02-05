import express, {Application, Request, Response} from 'express';

import * as question from './question';
import * as category from './category';
import * as test from './test';


export function routes(app: Application){

	app.get("/", function(req: Request, res: Response){
		res.send("root dir");
	});

	question.routes(app);
	category.routes(app);
	test.routes(app);

}
