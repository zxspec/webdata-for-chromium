BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "meta" (
	"key"	LONGVARCHAR NOT NULL UNIQUE,
	"value"	LONGVARCHAR,
	PRIMARY KEY("key")
);
CREATE TABLE IF NOT EXISTS "token_service" (
	"service"	VARCHAR NOT NULL,
	"encrypted_token"	BLOB,
	PRIMARY KEY("service")
);
CREATE TABLE IF NOT EXISTS "keywords" (
	"id"	INTEGER,
	"short_name"	VARCHAR NOT NULL,
	"keyword"	VARCHAR NOT NULL,
	"favicon_url"	VARCHAR NOT NULL,
	"url"	VARCHAR NOT NULL,
	"safe_for_autoreplace"	INTEGER,
	"originating_url"	VARCHAR,
	"date_created"	INTEGER DEFAULT 0,
	"usage_count"	INTEGER DEFAULT 0,
	"input_encodings"	VARCHAR,
	"suggest_url"	VARCHAR,
	"prepopulate_id"	INTEGER DEFAULT 0,
	"created_by_policy"	INTEGER DEFAULT 0,
	"last_modified"	INTEGER DEFAULT 0,
	"sync_guid"	VARCHAR,
	"alternate_urls"	VARCHAR,
	"image_url"	VARCHAR,
	"search_url_post_params"	VARCHAR,
	"suggest_url_post_params"	VARCHAR,
	"image_url_post_params"	VARCHAR,
	"new_tab_url"	VARCHAR,
	"last_visited"	INTEGER DEFAULT 0,
	"created_from_play_api"	INTEGER DEFAULT 0,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "autofill" (
	"name"	VARCHAR,
	"value"	VARCHAR,
	"value_lower"	VARCHAR,
	"date_created"	INTEGER DEFAULT 0,
	"date_last_used"	INTEGER DEFAULT 0,
	"count"	INTEGER DEFAULT 1,
	PRIMARY KEY("name","value")
);
CREATE TABLE IF NOT EXISTS "credit_cards" (
	"guid"	VARCHAR,
	"name_on_card"	VARCHAR,
	"expiration_month"	INTEGER,
	"expiration_year"	INTEGER,
	"card_number_encrypted"	BLOB,
	"date_modified"	INTEGER NOT NULL DEFAULT 0,
	"origin"	VARCHAR DEFAULT '',
	"use_count"	INTEGER NOT NULL DEFAULT 0,
	"use_date"	INTEGER NOT NULL DEFAULT 0,
	"billing_address_id"	VARCHAR,
	"nickname"	VARCHAR,
	PRIMARY KEY("guid")
);
CREATE TABLE IF NOT EXISTS "autofill_profiles" (
	"guid"	VARCHAR,
	"company_name"	VARCHAR,
	"street_address"	VARCHAR,
	"dependent_locality"	VARCHAR,
	"city"	VARCHAR,
	"state"	VARCHAR,
	"zipcode"	VARCHAR,
	"sorting_code"	VARCHAR,
	"country_code"	VARCHAR,
	"date_modified"	INTEGER NOT NULL DEFAULT 0,
	"origin"	VARCHAR DEFAULT '',
	"language_code"	VARCHAR,
	"use_count"	INTEGER NOT NULL DEFAULT 0,
	"use_date"	INTEGER NOT NULL DEFAULT 0,
	"validity_bitfield"	UNSIGNED NOT NULL DEFAULT 0,
	"is_client_validity_states_updated"	BOOL NOT NULL DEFAULT FALSE,
	PRIMARY KEY("guid")
);
CREATE TABLE IF NOT EXISTS "autofill_profile_addresses" (
	"guid"	VARCHAR,
	"street_address"	VARCHAR,
	"street_name"	VARCHAR,
	"dependent_street_name"	VARCHAR,
	"house_number"	VARCHAR,
	"subpremise"	VARCHAR,
	"premise_name"	VARCHAR,
	"street_address_status"	INTEGER DEFAULT 0,
	"street_name_status"	INTEGER DEFAULT 0,
	"dependent_street_name_status"	INTEGER DEFAULT 0,
	"house_number_status"	INTEGER DEFAULT 0,
	"subpremise_status"	INTEGER DEFAULT 0,
	"premise_name_status"	INTEGER DEFAULT 0,
	"dependent_locality"	VARCHAR,
	"city"	VARCHAR,
	"state"	VARCHAR,
	"zip_code"	VARCHAR,
	"sorting_code"	VARCHAR,
	"country_code"	VARCHAR,
	"dependent_locality_status"	INTEGER DEFAULT 0,
	"city_status"	INTEGER DEFAULT 0,
	"state_status"	INTEGER DEFAULT 0,
	"zip_code_status"	INTEGER DEFAULT 0,
	"sorting_code_status"	INTEGER DEFAULT 0,
	"country_code_status"	INTEGER DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "autofill_profile_names" (
	"guid"	VARCHAR,
	"first_name"	VARCHAR,
	"middle_name"	VARCHAR,
	"last_name"	VARCHAR,
	"full_name"	VARCHAR,
	"honorific_prefix"	VARCHAR,
	"first_last_name"	VARCHAR,
	"conjunction_last_name"	VARCHAR,
	"second_last_name"	VARCHAR,
	"honorific_prefix_status"	INTEGER DEFAULT 0,
	"first_name_status"	INTEGER DEFAULT 0,
	"middle_name_status"	INTEGER DEFAULT 0,
	"last_name_status"	INTEGER DEFAULT 0,
	"first_last_name_status"	INTEGER DEFAULT 0,
	"conjunction_last_name_status"	INTEGER DEFAULT 0,
	"second_last_name_status"	INTEGER DEFAULT 0,
	"full_name_status"	INTEGER DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "autofill_profile_emails" (
	"guid"	VARCHAR,
	"email"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "autofill_profile_phones" (
	"guid"	VARCHAR,
	"number"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "autofill_profiles_trash" (
	"guid"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "masked_credit_cards" (
	"id"	VARCHAR,
	"status"	VARCHAR,
	"name_on_card"	VARCHAR,
	"network"	VARCHAR,
	"last_four"	VARCHAR,
	"exp_month"	INTEGER DEFAULT 0,
	"exp_year"	INTEGER DEFAULT 0,
	"bank_name"	VARCHAR,
	"nickname"	VARCHAR,
	"card_issuer"	INTEGER DEFAULT 0,
	"instrument_id"	INTEGER DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "unmasked_credit_cards" (
	"id"	VARCHAR,
	"card_number_encrypted"	VARCHAR,
	"unmask_date"	INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "server_card_metadata" (
	"id"	VARCHAR NOT NULL,
	"use_count"	INTEGER NOT NULL DEFAULT 0,
	"use_date"	INTEGER NOT NULL DEFAULT 0,
	"billing_address_id"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "server_addresses" (
	"id"	VARCHAR,
	"company_name"	VARCHAR,
	"street_address"	VARCHAR,
	"address_1"	VARCHAR,
	"address_2"	VARCHAR,
	"address_3"	VARCHAR,
	"address_4"	VARCHAR,
	"postal_code"	VARCHAR,
	"sorting_code"	VARCHAR,
	"country_code"	VARCHAR,
	"language_code"	VARCHAR,
	"recipient_name"	VARCHAR,
	"phone_number"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "server_address_metadata" (
	"id"	VARCHAR NOT NULL,
	"use_count"	INTEGER NOT NULL DEFAULT 0,
	"use_date"	INTEGER NOT NULL DEFAULT 0,
	"has_converted"	BOOL NOT NULL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS "autofill_sync_metadata" (
	"model_type"	INTEGER NOT NULL,
	"storage_key"	VARCHAR NOT NULL,
	"value"	BLOB,
	PRIMARY KEY("model_type","storage_key")
);
CREATE TABLE IF NOT EXISTS "autofill_model_type_state" (
	"model_type"	INTEGER NOT NULL,
	"value"	BLOB,
	PRIMARY KEY("model_type")
);
CREATE TABLE IF NOT EXISTS "payments_customer_data" (
	"customer_id"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "payments_upi_vpa" (
	"vpa"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "server_card_cloud_token_data" (
	"id"	VARCHAR,
	"suffix"	VARCHAR,
	"exp_month"	INTEGER DEFAULT 0,
	"exp_year"	INTEGER DEFAULT 0,
	"card_art_url"	VARCHAR,
	"instrument_token"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "offer_data" (
	"offer_id"	UNSIGNED LONG,
	"offer_reward_amount"	VARCHAR,
	"expiry"	UNSIGNED LONG,
	"offer_details_url"	VARCHAR,
	"merchant_domain"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "offer_eligible_instrument" (
	"offer_id"	UNSIGNED LONG,
	"instrument_id"	UNSIGNED LONG
);
CREATE TABLE IF NOT EXISTS "offer_merchant_domain" (
	"offer_id"	UNSIGNED LONG,
	"merchant_domain"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "web_app_manifest_section" (
	"expire_date"	INTEGER NOT NULL DEFAULT 0,
	"id"	VARCHAR,
	"min_version"	INTEGER NOT NULL DEFAULT 0,
	"fingerprints"	BLOB
);
CREATE TABLE IF NOT EXISTS "payment_method_manifest" (
	"expire_date"	INTEGER NOT NULL DEFAULT 0,
	"method_name"	VARCHAR,
	"web_app_id"	VARCHAR
);
CREATE TABLE IF NOT EXISTS "secure_payment_confirmation_instrument" (
	"credential_id"	BLOB NOT NULL,
	"relying_party_id"	VARCHAR NOT NULL,
	"label"	VARCHAR NOT NULL,
	"icon"	BLOB NOT NULL,
	PRIMARY KEY("credential_id")
);
INSERT INTO "meta" VALUES ('mmap_status','-1');
INSERT INTO "meta" VALUES ('version','90');
INSERT INTO "meta" VALUES ('last_compatible_version','83');
INSERT INTO "meta" VALUES ('Builtin Keyword Version','123');
INSERT INTO "keywords" VALUES (2,'Google','google.com','https://www.google.com/images/branding/product/ico/googleg_lodp.ico','{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:iOSSearchLanguage}{google:searchClient}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}',1,'',0,0,'UTF-8','{google:baseSuggestURL}search?{google:searchFieldtrialParameter}client={google:suggestClient}&gs_ri={google:suggestRid}&xssi=t&q={searchTerms}&{google:inputType}{google:omniboxFocusType}{google:cursorPosition}{google:currentPageUrl}{google:pageClassification}{google:searchVersion}{google:sessionToken}{google:prefetchQuery}sugkey={google:suggestAPIKeyParameter}',1,0,0,'485bf7d3-0215-45af-87dc-538868000001','["{google:baseURL}#q={searchTerms}","{google:baseURL}search#q={searchTerms}","{google:baseURL}webhp#q={searchTerms}","{google:baseURL}s#q={searchTerms}","{google:baseURL}s?q={searchTerms}"]','{google:baseURL}searchbyimage/upload','','','encoded_image={google:imageThumbnail},image_url={google:imageURL},sbisrc={google:imageSearchSource},original_width={google:imageOriginalWidth},original_height={google:imageOriginalHeight}','',0,0);
INSERT INTO "keywords" VALUES (3,'Bing','bing.com','https://www.bing.com/sa/simg/bing_p_rr_teal_min.ico','https://www.bing.com/search?q={searchTerms}&PC=U316&FORM=CHROMN',1,'',0,0,'UTF-8','https://www.bing.com/osjson.aspx?query={searchTerms}&language={language}&PC=U316',3,0,0,'485bf7d3-0215-45af-87dc-538868000003','[]','https://www.bing.com/images/detail/search?iss=sbiupload&FORM=CHROMI#enterInsights','','','imageBin={google:imageThumbnailBase64}','https://www.bing.com/chrome/newtab',0,0);
INSERT INTO "keywords" VALUES (4,'Yahoo!','yahoo.com','https://search.yahoo.com/favicon.ico','https://search.yahoo.com/search{google:pathWildcard}?ei={inputEncoding}&fr=crmas&p={searchTerms}',1,'',0,0,'UTF-8','https://search.yahoo.com/sugg/chrome?output=fxjson&appid=crmas&command={searchTerms}',2,0,0,'485bf7d3-0215-45af-87dc-538868000002','[]','','','','','',0,0);
INSERT INTO "keywords" VALUES (5,'DuckDuckGo','duckduckgo.com','https://duckduckgo.com/favicon.ico','https://duckduckgo.com/?q={searchTerms}',1,'',0,0,'UTF-8','https://duckduckgo.com/ac/?q={searchTerms}&type=list',92,0,0,'485bf7d3-0215-45af-87dc-538868000092','[]','','','','','https://duckduckgo.com/chrome_newtab',0,0);
INSERT INTO "keywords" VALUES (6,'Ecosia','ecosia.org','https://cdn.ecosia.org/assets/images/ico/favicon.ico','https://www.ecosia.org/search?q={searchTerms}&addon=opensearch',1,'',0,0,'UTF-8','https://ac.ecosia.org/autocomplete?q={searchTerms}&type=list',101,0,0,'485bf7d3-0215-45af-87dc-538868000101','[]','','','','','',0,0);
INSERT INTO "credit_cards" VALUES ('aba9fb1d-f7e5-43e9-95a8-024790a2f630','accepted',10,2030,'4111111111111111',1610494633,'Chrome settings',2,1610494649,'','');
INSERT INTO "credit_cards" VALUES ('c64eeb15-9b36-43ff-88df-0748da7b9617','accepted',03,2030,'370000000000002',1610494633,'Chrome settings',2,1610494649,'','');
INSERT INTO "credit_cards" VALUES ('81dd93dd-8250-4390-af56-b328d663559e','accepted',03,2030,'5555444433331111',1610494633,'Chrome settings',2,1610494649,'','');
INSERT INTO "autofill_profiles" VALUES ('e2171ee4-d98f-411b-b2f6-0b32184f1931','Adidas','Main Str 1','','Dublin','','D20 AA30','','IE',1610478687,'Chrome settings','',2,1610478723,0,0);
INSERT INTO "autofill_profiles" VALUES ('58024892-7e3d-46bf-9403-d098904b3389','Adidas','Hoogoorddreef 9-A
Adidas HQ','','Amsterdam','','1101 BA','','NL',1610494468,'Chrome settings','',9,1610494518,0,0);
INSERT INTO "autofill_profile_names" VALUES ('58024892-7e3d-46bf-9403-d098904b3389','Test','','Testoff','Test Testoff',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0);
INSERT INTO "autofill_profile_emails" VALUES ('58024892-7e3d-46bf-9403-d098904b3389','accept@adidas.com');
INSERT INTO "autofill_profile_phones" VALUES ('58024892-7e3d-46bf-9403-d098904b3389','0621234567');
INSERT INTO "server_card_metadata" VALUES ('aba9fb1d-f7e5-43e9-95a8-024790a2f630',2,13254968249427208,'');
CREATE INDEX IF NOT EXISTS "autofill_name" ON "autofill" (
	"name"
);
CREATE INDEX IF NOT EXISTS "autofill_name_value_lower" ON "autofill" (
	"name",
	"value_lower"
);
COMMIT;
