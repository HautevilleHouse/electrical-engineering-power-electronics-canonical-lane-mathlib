import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure NoncollapsingPackage (O : PowerElectronicsAdmittedObject) where
  voltageMargin : Prop
  currentLimit : Prop
  switchingMargin : Prop

structure NoncollapsingEvidence {O : PowerElectronicsAdmittedObject} (N : NoncollapsingPackage O) where
  voltageMarginClosed : N.voltageMargin
  currentLimitClosed : N.currentLimit
  switchingMarginClosed : N.switchingMargin

def NoncollapsingClosed {O : PowerElectronicsAdmittedObject} (N : NoncollapsingPackage O) : Prop :=
  N.voltageMargin ∧ N.currentLimit ∧ N.switchingMargin

theorem noncollapsing_closed_from_evidence
    {O : PowerElectronicsAdmittedObject} (N : NoncollapsingPackage O)
    (E : NoncollapsingEvidence N) : NoncollapsingClosed N := by
  exact And.intro E.voltageMarginClosed (And.intro E.currentLimitClosed E.switchingMarginClosed)

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse