ifeq ($(strip $(pT_finderpT_analyzerAuto)),)
pT_finderpT_analyzerAuto := self/src/pT_finder/pT_analyzer/plugins
PLUGINS:=yes
pT_finderpT_analyzerAuto_files := $(patsubst src/pT_finder/pT_analyzer/plugins/%,%,$(wildcard $(foreach dir,src/pT_finder/pT_analyzer/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
pT_finderpT_analyzerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/pT_finder/pT_analyzer/plugins/BuildFile
pT_finderpT_analyzerAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/TrackReco
pT_finderpT_analyzerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,pT_finderpT_analyzerAuto,pT_finderpT_analyzerAuto,$(SCRAMSTORENAME_LIB),src/pT_finder/pT_analyzer/plugins))
pT_finderpT_analyzerAuto_PACKAGE := self/src/pT_finder/pT_analyzer/plugins
ALL_PRODS += pT_finderpT_analyzerAuto
pT_finder/pT_analyzer_forbigobj+=pT_finderpT_analyzerAuto
pT_finderpT_analyzerAuto_INIT_FUNC        += $$(eval $$(call Library,pT_finderpT_analyzerAuto,src/pT_finder/pT_analyzer/plugins,src_pT_finder_pT_analyzer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
pT_finderpT_analyzerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,pT_finderpT_analyzerAuto,src/pT_finder/pT_analyzer/plugins))
endif
ALL_COMMONRULES += src_pT_finder_pT_analyzer_plugins
src_pT_finder_pT_analyzer_plugins_parent := pT_finder/pT_analyzer
src_pT_finder_pT_analyzer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_pT_finder_pT_analyzer_plugins,src/pT_finder/pT_analyzer/plugins,PLUGINS))
