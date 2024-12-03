import HttpError from "../middlewares/httperror.js";

export function validate(schema, src) {
    return function (req, _, next) {
        try {
            // Vérifie si src contient des données form-data
            if (src === "body" && req.body) {
                Object.keys(req.body).forEach((key) => {
                    try {
                        // Convertir les champs JSON envoyés en form-data en objets
                        req.body[key] = JSON.parse(req.body[key]);
                    } catch (error) {
                        // Si ce n'est pas du JSON, on laisse tel quel
                    }
                });
            }

            const { error } = schema.validate(req[src]);
            if (!error) {
                return next();
            }
            next(new HttpError(400, error.details[0].message));
        } catch (err) {
            next(new HttpError(500, "Validation Error"));
        }
    };
}
