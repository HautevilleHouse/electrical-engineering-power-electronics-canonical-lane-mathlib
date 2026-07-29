import PowerElectronicsCanonicalLaneLean.SwitchingControl

namespace HautevilleHouse
namespace PowerElectronicsCanonicalLaneLean

structure StabilityEvidence where
  voltageRegulation : Prop
  currentLimiting : Prop
  thermalStability : Prop
  voltageRegulationClosed : voltageRegulation
  currentLimitingClosed : currentLimiting
  thermalStabilityClosed : thermalStability

def PowerSystemStabilityClosed (E : StabilityEvidence) : Prop :=
  E.voltageRegulation ∧ E.currentLimiting ∧ E.thermalStability

theorem power_system_stability_closed_from_evidence (E : StabilityEvidence) :
    PowerSystemStabilityClosed E :=
  And.intro E.voltageRegulationClosed (And.intro E.currentLimitingClosed E.thermalStabilityClosed)

end PowerElectronicsCanonicalLaneLean
end HautevilleHouse