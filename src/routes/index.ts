import express, {Application, Request, Response} from 'express';

import * as question from './question';
import * as category from './category';
import * as test from './test';


export function routes(app: Application){

	question.routes(app);
	category.routes(app);
	test.routes(app);

}
