// -*- C++ -*-
//
// Package:    pT_finder/pT_analyzer
// Class:      pT_analyzer
//
/**\class pT_analyzer pT_analyzer.cc pT_finder/pT_analyzer/plugins/pT_analyzer.cc

 Description: [one line class summary]

 Implementation:
     [Notes on implementation]
*/
//
// Original Author:  Joshua Bistany Riebman
//         Created:  Wed, 14 Jun 2023 21:03:21 GMT
//
//


// system include files
#include <memory>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/ServiceRegistry/interface/Service.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"
#include "TH1.h"
#include "FWCore/Framework/interface/one/EDAnalyzer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
 #include "FWCore/Utilities/interface/InputTag.h"
 #include "DataFormats/TrackReco/interface/Track.h"
 #include "DataFormats/TrackReco/interface/TrackFwd.h"
//
// class declaration
//

// If the analyzer does not use TFileService, please remove
// the template argument to the base class so the class inherits
// from  edm::one::EDAnalyzer<>
// This will improve performance in multithreaded jobs.


using reco::TrackCollection;

class pT_analyzer : public edm::one::EDAnalyzer<edm::one::SharedResources>  {
   public:
      explicit pT_analyzer(const edm::ParameterSet&);
      ~pT_analyzer();

      static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);


   private:
      virtual void beginJob() override;
      virtual void analyze(const edm::Event&, const edm::EventSetup&) override;
      virtual void endJob() override;

      // ----------member data ---------------------------
      edm::EDGetTokenT<TrackCollection> tracksToken_;  //used to select what tracks to read from configuration file
      double trackPtMin_;
      double trackEtaMin_;
      double trackEtaMax_;
      TH1F *demohisto_ntracks;
};

//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
pT_analyzer::pT_analyzer(const edm::ParameterSet& iConfig)
 :
  tracksToken_(consumes<TrackCollection>(iConfig.getUntrackedParameter<edm::InputTag>("tracks"))),
  trackPtMin_(iConfig.getParameter<double>("trackPtMin")),
  trackEtaMin_(iConfig.getParameter<double>("trackEtaMin")),
  trackEtaMax_(iConfig.getParameter<double>("trackEtaMax"))
 {

edm::Service<TFileService> fs;
demohisto_ntracks = fs->make<TH1F>("nTracks" , "nTracks" , 100 , 0 , 5000 );

#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE
	setupDataToken_ = esConsumes<SetupData, SetupRecord>();
#endif
   //now do what ever initialization is needed

}


pT_analyzer::~pT_analyzer()
{

   // do anything here that needs to be done at desctruction time
   // (e.g. close files, deallocate resources etc.)

}


//
// member functions
//

// ------------ method called for each event  ------------
void
pT_analyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   using namespace edm;
	using namespace std;

	int nTrack = 0;
	for (const auto& track : iEvent.get(tracksToken_)) {
		// dp something with the track parameters, e.g. plot the change
		// int charge = track.charge();
		if(track.pt() < trackPtMin_) continue;
		if(track.eta() < trackEtaMin_ || track.eta() > trackEtaMax_) continue;
		nTrack++;
	}
cout<<"nTrack = "<<nTrack<<endl;
demohisto_ntracks->Fill(nTrack);

#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE

	auto setup = iSetup.getData(setupToken_);

	auto pSetup = iSetup.getHandle(setupToken_);
#endif
}


// ------------ method called once each job just before starting event loop  ------------
void
pT_analyzer::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void
pT_analyzer::endJob()
{
}
// ------------ method fills 'descriptions' with the allowed parameters for the module  ------------
void
pT_analyzer::fillDescriptions(edm::ConfigurationDescriptions& descriptions) {
  //The following says we do not know what parameters are allowed so do no validation
  // Please change this to state exactly what you do use, even if it is no parameters
  edm::ParameterSetDescription desc;
  desc.setUnknown();
  descriptions.addDefault(desc);

  //Specify that only 'tracks' is allowed
  //To use, remove the default given above and uncomment below
  //ParameterSetDescription desc;
  //desc.addUntracked<edm::InputTag>("tracks","ctfWithMaterialTracks");
  //descriptions.addDefault(desc);
}

//define this as a plug-in
DEFINE_FWK_MODULE(pT_analyzer);
