import FWCore.ParameterSet.Config as CMS

process = cms.Process("pT_finder")

process.load("FWCore.MessageService.MessageLogger_cfi")

process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(-1))

process.source = cms.Source("PoolSource",
        #replaces 'myfile.root' with source file"
        fileNames = cms.untracked.vstring(
            'myfile.root'
            )
        )

process.pt_finder = cms.EDAnalyzer('pT_analyzer',
        tracks = cms.untracked.InputTag('generalTracks')
        )

process.p = cms.Path(process.pt_finder)
