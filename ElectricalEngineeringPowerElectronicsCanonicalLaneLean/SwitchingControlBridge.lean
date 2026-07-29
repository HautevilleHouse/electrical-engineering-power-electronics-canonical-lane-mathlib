import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.converterTopology.switchOperationValid

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    exact A.h

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse