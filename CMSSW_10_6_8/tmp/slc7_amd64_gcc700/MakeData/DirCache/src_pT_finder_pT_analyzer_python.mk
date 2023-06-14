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
