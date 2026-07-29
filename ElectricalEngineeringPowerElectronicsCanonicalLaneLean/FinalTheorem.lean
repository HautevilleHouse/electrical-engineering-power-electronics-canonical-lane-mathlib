import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringPowerElectronicsCanonicalLaneLean.SwitchingControlBridge

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

def ConstrainedPowerElectronicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_power_electronics_endgame (A : AdmissibleClass) : ConstrainedPowerElectronicsClosure A :=
  by
    exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse