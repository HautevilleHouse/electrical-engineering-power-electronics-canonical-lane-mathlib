import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure PowerConverterTopology where
  inputSource : String
  outputLoad : String
  switchingDevices : List String
  energyStorage : List String
  controlMethod : String
  steadyStateAchievable : Prop
  switchOperationValid : Prop

def converterBridgeClosed (C : PowerConverterTopology) : Prop :=
  C.steadyStateAchievable ∧ C.switchOperationValid

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse