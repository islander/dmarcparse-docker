# DMARC report parser

Docker container of DMARC parser, based on [this](github.com/techsneeze/dmarcts-report-parser) script.

## Installation

```
$ docker build . -t dmarcparse
```

## Configuration

Copy sample config to etc:

```
$ sudo mkdir /etc/dmarcts
$ sudo cp dmarcts-report-parser.conf.sample /etc/dmarcts/dmarcts-report-parser.conf
```

Configure MySQL and IMAP credentials:

```
# vi /etc/dmarcts/dmarcts-report-parser.conf
```

## Usage

Run wrapper:

```
$ ./dmarcparse -i -d
```

You may put it in your PATH:

```
$ sudo cp dmarcparse /usr/local/bin/
```

## FAQ

**Q:** I get `the input device is not a TTY` error, when running parser from `cron`.\
**A:** If you using `dmarcparse` from `cron`, remove `--tty` argument in docker call.
