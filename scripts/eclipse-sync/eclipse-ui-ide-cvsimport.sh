#!/bin/bash
#Must use a 'fixed' cvsps to prevent segault importing this repository
export PATH=/Users/james/bin/cvsps-fix/:$PATH

git cvsimport -i -v -C eclipse-ui-ide -d :pserver:anonymous@dev.eclipse.org:/cvsroot/eclipse -r cvs org.eclipse.ui.ide
git cvsimport -i -v -C eclipse-ui-ide -d :pserver:anonymous@dev.eclipse.org:/cvsroot/eclipse -r cvs_e4 e4/org.eclipse.e4.resources/bundles/org.eclipse.ui.ide
