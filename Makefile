# Automatically Generated Makefile by EDE.
# For use with: make
#
# DO NOT MODIFY THIS FILE OR YOUR CHANGES MAY BE LOST.
# EDE is the Emacs Development Environment.
# http://cedet.sourceforge.net/ede.shtml
#

top=
ede_FILES=Project.ede Makefile

EMACS=emacs
LOADPATH= ../../opt/emacs/share/emacs/site-lisp/cedet/common/
LOADDEFS=rudel-loaddefs.el
LOADDIRS=. jupiter obby
rudel_LISP=rudel.el rudel-util.el rudel-mode.el rudel-interactive.el rudel-overlay.el rudel-speedbar.el rudel-operators.el rudel-operations.el rudel-compat.el rudel-tls.el rudel-errors.el rudel-state-machine.el rudel-backend.el rudel-protocol.el
EMACS=emacs
EMACSFLAGS=-batch --no-site-file
VERSION=0.1
DISTDIR=$(top)rudel-$(VERSION)



all: autoloads rudel obby jupiter

.PHONY: autoloads
autoloads:
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(require 'cedet-autogen)" >> $@-compile-script
	"$(EMACS)" -batch --no-site-file -l $@-compile-script -f cedet-batch-update-autoloads $(LOADDEFS) $(LOADDIRS)

.PHONY: rudel
rudel: $(rudel_LISP)
	@echo "(add-to-list 'load-path nil)" > $@-compile-script
	for loadpath in . ${LOADPATH}; do \
	   echo "(add-to-list 'load-path \"$$loadpath\")" >> $@-compile-script; \
	done;
	@echo "(setq debug-on-error t)" >> $@-compile-script
	"$(EMACS)" $(EMACSFLAGS) -l $@-compile-script -f batch-byte-compile $^

.PHONY:obby
obby:
	$(MAKE) -C obby

.PHONY:jupiter
jupiter:
	$(MAKE) -C jupiter

tags:
	$(MAKE) -C obby/ $(MFLAGS) $@
	$(MAKE) -C jupiter/ $(MFLAGS) $@


clean:
	rm -f *.elc

.PHONY: dist

dist: autoloads
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	cp rudel-loaddefs.el $(rudel_LISP) $(ede_FILES) $(DISTDIR)
	$(MAKE) -C obby $(MFLAGS) DISTDIR=$(DISTDIR)/obby dist
	$(MAKE) -C jupiter $(MFLAGS) DISTDIR=$(DISTDIR)/jupiter dist
	tar -cvzf $(DISTDIR).tar.gz $(DISTDIR)
	rm -rf $(DISTDIR)

Makefile: Project.ede
	@echo Makefile is out of date!  It needs to be regenerated by EDE.
	@echo If you have not modified Project.ede, you can use 'touch' to update the Makefile time stamp.
	@false



# End of Makefile
