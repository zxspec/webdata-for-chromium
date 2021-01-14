# Web Data DB for Checkout testing in Chromium/Chrome

## Dependencies

Download and install [sqlite3](https://www.sqlite.org/download.html).

```shell
$ sudo apt install sqlite3
```

## Create DB

```shell
$ sqlite3 Web\ Data < TestWebData.sql
```

## Copy DB to a profile folder

```shell
$ mkdir -p profiles/ad-hoc-profile
$ cp sqlite3 Web\ Data < TestWebData.sql
```

## Start chromium browser with ad-hoc-profile

```shell
$ chromium --user-data-dir=./profiles/ --profile-directory=ad-hoc-profile
```

### sanity check

open [chrome://version/](chrome://version/) url, check "profile path".

```
. . .
Profile Path:	. . ./profiles/ad-hoc-profile
```

open [chrome://settings/addresses](chrome://settings/addresses) url, check that pre-defined test addresses are available.

```
Test Testoff, Hoogoorddreef 9-A
```

open [chrome://settings/payments](chrome://settings/payments) url, check that pre-defined test credit cards are available.

```
Type                        Expiration date
Visa ‪•⁠ ⁠•⁠ ⁠•⁠ ⁠•⁠ ⁠1111‬           03/2030
```

## Useful links

[Test card numbers](https://docs.adyen.com/development-resources/test-cards/test-card-numbers)

[DB Browser for SQLite](https://sqlitebrowser.org/)
