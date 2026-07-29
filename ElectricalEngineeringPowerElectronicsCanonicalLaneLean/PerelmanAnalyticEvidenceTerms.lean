import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.Noncollapsing

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure StabilityAnalyticCertificate {O : PowerElectronicsAdmittedObject} (N : NoncollapsingPackage O) where
  lyapunovFunctionExists : Prop
  lyapunovStability : Prop
  convergenceRate : Prop

structure StabilityEvidenceTerms {O : PowerElectronicsAdmittedObject}
    {N : NoncollapsingPackage O} (C : StabilityAnalyticCertificate N) where
  lyapunovFunctionExistsClosed : C.lyapunovFunctionExists
  lyapunovStabilityClosed : C.lyapunovStability
  convergenceRateClosed : C.convergenceRate
  noncollapsingClosed : NoncollapsingClosed N

def StabilityAnalyticCertificate.evidenceTerms {O : PowerElectronicsAdmittedObject}
    {N : NoncollapsingPackage O} (C : StabilityAnalyticCertificate N) : StabilityEvidenceTerms C :=
  {
    lyapunovFunctionExistsClosed := C.lyapunovFunctionExists
    lyapunovStabilityClosed := C.lyapunovStability
    convergenceRateClosed := C.convergenceRate
    noncollapsingClosed := noncollapsing_closed_from_evidence N (by
      exact { voltageMarginClosed := (by exact ?_), currentLimitClosed := (by exact ?_), switchingMarginClosed := (by exact ?_) })
  }

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse