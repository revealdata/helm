# Review 11 Series Ingress

## Paths
| Path | TLS | Security | Cache|
|---|---|---|---|
/|Required|Public|no-cache|
/(static assets)|Required|Public|8 hours|
/Reveal|Required|Public|no-cache|
/Reveal/(static assets)|Required|Public|8 hours|
/rest|Required|Public|no-cache|
/review_assignment|Optional|Internal|no-cache|
/review_bulktag|Optional|-|no-cache|
/review_documentloader|Optional|-|no-cache|
/review_export|Optional|-|no-cache|
/review_indexbatch|Optional|-|no-cache|
/review_indexserver|Optional|-|no-cache|
/review_print|Optional|-|no-cache|
/review_productionserver|Optional|-|no-cache|
/review_search|Optional|-|no-cache|
~ ^/search/(.*)|Optional|-|no-cache|
