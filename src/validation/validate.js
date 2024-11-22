import  HttpError  from "../middlewares/httperror.js";

export function validate (schema, src) {
    return function(req, _, next) {
        const { error } = schema.validate(req[src]);
        if(!error) {
            return next();
        }
        next(new HttpError(400, error.details[0].message));
    }
}