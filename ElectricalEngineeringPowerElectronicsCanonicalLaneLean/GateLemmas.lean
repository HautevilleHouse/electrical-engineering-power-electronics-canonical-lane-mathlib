import ElectricalEngineeringPowerElectronicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse