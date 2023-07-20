import FWCore.ParameterSet.Config as cms

process = cms.Process("ptfinder")

process.load("FWCore.MessageService.MessageLogger_cfi")

process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(-1))

process.source = cms.Source("PoolSource",
        #replaces 'myfile.root' with source file"
        fileNames = cms.untracked.vstring(
            'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias0/AOD/04Apr2019-v1/260000/21963241-5CCA-B847-90ED-7873DB589A9C.root'
            )
        )

process.TFileService = cms.Service("TFileService",
					fileName = cms.string('histodemo.root')
				)


process.ptfinder = cms.EDAnalyzer('pT_analyzer',
        tracks = cms.untracked.InputTag('generalTracks'),
	trackPtMin = cms.double(10),
	trackEtaMin = cms.double(-2.4),
	trackEtaMax = cms.double(2.4)
        )

process.p = cms.Path(process.ptfinder)
