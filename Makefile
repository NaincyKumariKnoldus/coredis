lint:
	black --check coredis tests
	#mypy coredis
	flake8 coredis tests

lint-fix:
	black coredis tests
	#mypy coredis
	isort -r --profile=black tests coredis
	autoflake8 -i -r tests coredis

DEBUG := False
NEXT_VERSION := 3.3.3

generate-compatibility-docs:
	rm -rf docs/source/compatibility.rst
	PYTHONPATH=${CURDIR} python scripts/command_coverage.py --debug=${DEBUG} --next-version=${NEXT_VERSION} coverage-doc

generate-token-enum:
	rm -rf docs/source/compatibility.rst
	PYTHONPATH=${CURDIR} python scripts/command_coverage.py --debug=${DEBUG} --next-version=${NEXT_VERSION} token-enum
