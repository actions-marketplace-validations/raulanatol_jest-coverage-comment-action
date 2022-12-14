.DEFAULT_GOAL := check

start:
	@echo "๐โโ๏ธ Starting project"
	npm install

init:
	@echo "Initialising the project"
	@npm install

test:
	@echo "Testing..."
	npm test

build:
	@echo "๐ฉโ๐ญ Building..."
	@npm run build
	@npm run package

check: --pre_check test build
	@echo "โ"

clean:
	@echo "๐ Cleaning..."
	@npm run clean

clean_all: clean
	@echo "๐งจ Clean all"
	@rm -Rf node_modules package-lock.json

docs:
	@doctoc README.md
	@echo "๐ Documentation ready!"

release_patch: release

release_minor: check
	@.scripts/finish-release minor

release_major: check
	@.scripts/finish-release major

release: check
	@.scripts/finish-release patch

--pre_check:
	@npm run clean
	@npm install
	@npm run lint
	@npm run type-check
