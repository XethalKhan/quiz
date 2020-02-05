import express, {Application, Request, Response} from 'express';

import * as CategoryModel from './../../model/category';

export function routes(app: Application){

	app.get("/category", function(req: Request, res: Response){

		CategoryModel.categories().then(function(data){

			res.send(data);

		}).catch(function(err){

			console.log("error: ", err);
			res.send(err);

		});

	});

	app.get("/category/:id", function(req: Request, res: Response){
		
		CategoryModel.category(Number(req.params.id)).then(function(data: any){

			res.send(data);

		}).catch(function(err){

			console.log("error: ", err);
			res.send(err);

		});

	});

}