import ElectricalEngineeringPowerElectronicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure AdmissibleClass where
  object : PowerElectronicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PowerElectronicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse