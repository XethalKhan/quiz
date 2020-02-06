import express, {Application} from 'express';
//import { PORT } from './config/constants';

import { routes } from './routes';

const app: Application = express();

routes(app);

app.listen(3000, () => {
    console.log(`Server is listening on port 3000`);
});