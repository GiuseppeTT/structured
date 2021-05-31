.PHONY: install_dependencies
install_dependencies:
	Rscript -e 'install.packages("remotes")'
	Rscript -e 'remotes::install_deps(dependencies = TRUE)'

.PHONY: test
test:
	Rscript -e 'devtools::test()'

.PHONY: document
document:
	Rscript -e 'devtools::document()'

.PHONY: check
check:
	Rscript -e 'devtools::check()'

.PHONY: install
install:
	Rscript -e 'devtools::install()'

.PHONY: lint
lint:
	Rscript -e 'lintr::lint_package()'

.PHONY: all
all: test document check install lint
