.PHONY: install_dependencies
install_dependencies:
	Rscript -e 'install.packages("remotes")'
	Rscript -e 'remotes::install_deps(dependencies = TRUE)'

.PHONY: test
test:
	Rscript -e 'devtools::test()'

.PHONY: check
check:
	Rscript -e 'devtools::check()'

.PHONY: install
install:
	Rscript -e 'devtools::install()'

.PHONY: lint
lint: install
	Rscript -e 'devtools::lint(cache = FALSE)'

.PHONY: document
document:
	Rscript -e 'devtools::document()'
	Rscript -e 'devtools::build_site(quiet = FALSE)'

.PHONY: all
all: check install lint document
