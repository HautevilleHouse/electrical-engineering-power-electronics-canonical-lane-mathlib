import PowerElectronicsCanonicalLaneLean.PowerConverterTopology

namespace HautevilleHouse
namespace PowerElectronicsCanonicalLaneLean

structure AdmissibleClass where
  object : PowerConverterObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PowerConverterWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end PowerElectronicsCanonicalLaneLean
end HautevilleHouse