ALL_SUBSYSTEMS+=pT_finder
subdirs_src_pT_finder = src_pT_finder_pT_analyzer
ALL_PACKAGES += pT_finder/pT_analyzer
subdirs_src_pT_finder_pT_analyzer := src_pT_finder_pT_analyzer_plugins src_pT_finder_pT_analyzer_python src_pT_finder_pT_analyzer_test
ifeq ($(strip $(PypT_finderpT_analyzer)),)
PypT_finderpT_analyzer := self/src/pT_finder/pT_analyzer/python
src_pT_finder_pT_analyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/pT_finder/pT_analyzer/python)
PypT_finderpT_analyzer_files := $(patsubst src/pT_finder/pT_analyzer/python/%,%,$(wildcard $(foreach dir,src/pT_finder/pT_analyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PypT_finderpT_analyzer_LOC_USE := self  
PypT_finderpT_analyzer_PACKAGE := self/src/pT_finder/pT_analyzer/python
ALL_PRODS += PypT_finderpT_analyzer
PypT_finderpT_analyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PypT_finderpT_analyzer,src/pT_finder/pT_analyzer/python,src_pT_finder_pT_analyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PypT_finderpT_analyzer,src/pT_finder/pT_analyzer/python))
endif
ALL_COMMONRULES += src_pT_finder_pT_analyzer_python
src_pT_finder_pT_analyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_pT_finder_pT_analyzer_python,src/pT_finder/pT_analyzer/python,PYTHON))
ifeq ($(strip $(testpT_finderpT_analyzerTP)),)
testpT_finderpT_analyzerTP := self/src/pT_finder/pT_analyzer/test
testpT_finderpT_analyzerTP_files := $(patsubst src/pT_finder/pT_analyzer/test/%,%,$(foreach file,test_catch2_*.cc,$(eval xfile:=$(wildcard src/pT_finder/pT_analyzer/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/pT_finder/pT_analyzer/test/$(file). Please fix src/pT_finder/pT_analyzer/test/BuildFile.))))
testpT_finderpT_analyzerTP_TEST_RUNNER_CMD :=  testpT_finderpT_analyzerTP 
testpT_finderpT_analyzerTP_BuildFile    := $(WORKINGDIR)/cache/bf/src/pT_finder/pT_analyzer/test/BuildFile
testpT_finderpT_analyzerTP_LOC_USE := self  FWCore/TestProcessor catch2
testpT_finderpT_analyzerTP_PACKAGE := self/src/pT_finder/pT_analyzer/test
ALL_PRODS += testpT_finderpT_analyzerTP
testpT_finderpT_analyzerTP_INIT_FUNC        += $$(eval $$(call Binary,testpT_finderpT_analyzerTP,src/pT_finder/pT_analyzer/test,src_pT_finder_pT_analyzer_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
testpT_finderpT_analyzerTP_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,testpT_finderpT_analyzerTP,src/pT_finder/pT_analyzer/test))
endif
ALL_COMMONRULES += src_pT_finder_pT_analyzer_test
src_pT_finder_pT_analyzer_test_parent := pT_finder/pT_analyzer
src_pT_finder_pT_analyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_pT_finder_pT_analyzer_test,src/pT_finder/pT_analyzer/test,TEST))
