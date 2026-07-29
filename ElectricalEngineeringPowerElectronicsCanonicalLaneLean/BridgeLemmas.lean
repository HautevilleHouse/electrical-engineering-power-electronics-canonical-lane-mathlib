import ElectricalEngineeringPowerElectronicsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PowerElectronicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse