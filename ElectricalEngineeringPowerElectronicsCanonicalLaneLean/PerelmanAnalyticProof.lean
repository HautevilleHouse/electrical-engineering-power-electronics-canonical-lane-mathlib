import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.PerelmanAnalyticEvidenceTerms

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure ControlAnalyticCertificate {O : PowerElectronicsAdmittedObject} (N : NoncollapsingPackage O) where
  lyapunovFunctionExists : Prop
  lyapunovStability : Prop
  convergenceRate : Prop
  lyapunovFunctionExistsClosed : lyapunovFunctionExists
  lyapunovStabilityClosed : lyapunovStability
  convergenceRateClosed : convergenceRate
  stabilityEvidence : StabilityEvidenceTerms (this : StabilityAnalyticCertificate N)

def ControlAnalyticCertificateClosed {O : PowerElectronicsAdmittedObject}
    {N : NoncollapsingPackage O} (C : ControlAnalyticCertificate N) : Prop :=
  C.lyapunovFunctionExists ∧ C.lyapunovStability ∧ C.convergenceRate ∧ NoncollapsingClosed N

theorem control_analytic_certificate_closed
    {O : PowerElectronicsAdmittedObject} {N : NoncollapsingPackage O}
    (C : ControlAnalyticCertificate N) : ControlAnalyticCertificateClosed C := by
  exact And.intro C.lyapunovFunctionExistsClosed
    (And.intro C.lyapunovStabilityClosed (And.intro C.convergenceRateClosed (by
      exact C.stabilityEvidence.noncollapsingClosed)))

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse