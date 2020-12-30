.DEFAULT_GOAL := check

start:
	@echo "🏃‍♀️ Starting project"
	npm install

init:
	@echo "Initialising the project"
	@npm install

test:
	@echo "Testing..."
	npm test

build:
	@echo "👩‍🏭 Building..."
	@npm run build
	@npm run package

check: --pre_check test build
	@echo "✅"

docs:
	@doctoc README.md
	@echo "📚 Documentation ready!"

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
