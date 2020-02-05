import { fetch_categories, fetch_category, insert_category } from './../data-access/category';

export function categories(){

	return fetch_categories();

}

export function category(id: number){

	return fetch_category(id);

}

export function create_category(parent: number, name: string, description: string){

	if(parent == null){
		parent = 0;
	}

	return insert_category(parent, name, description);

}