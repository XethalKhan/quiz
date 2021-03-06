import express, {Application} from 'express';

import * as question from './question';
import * as category from './category';
import * as test from './test';


export function routes(app: Application){

	app.use("/", express.static("static"));

	question.routes(app);
	category.routes(app);
	test.routes(app);

}
