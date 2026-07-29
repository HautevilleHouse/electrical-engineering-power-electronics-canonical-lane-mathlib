import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.PowerConverterTopology

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure AdmissibleClass where
  converterTopology : PowerConverterTopology
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  converterBridgeClosed A.converterTopology ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse