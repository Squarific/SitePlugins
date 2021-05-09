const router = require('express').Router({ mergeParams: true });
const { validationResult } = require('express-validator');

const SELECT_QUERY = "SELECT BIN_TO_UUID(uuid) as uuid, BIN_TO_UUID(useruuid) as useruuid, name, description, creation, updatedatetime from  `plugins` WHERE useruuid = UUID_TO_BIN(?)";
const GENERIC_DB_ERROR = {
    errors: [{
        msg: "Internal database error"
    }]
};

module.exports = (database) => {
    router.get('/', [
    ], async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        // TODO filter on jwt
        let useruuid = "20a7e88c-f224-4780-aa85-783bbe65a72b";

        database.query(SELECT_QUERY, [useruuid], (err, result) => {
            if (err) {
                console.log("Retrieve plugin database error", err);
                return res.status(504).json(GENERIC_DB_ERROR);
            }

            return res.status(200).json({
                plugins: result
            });
        });
    });

    return router;
};
