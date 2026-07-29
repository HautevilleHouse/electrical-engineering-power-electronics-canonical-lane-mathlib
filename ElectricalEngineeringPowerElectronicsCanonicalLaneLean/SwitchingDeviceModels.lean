import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure SwitchingDeviceModel where
  deviceType : String
  voltageRating : Float
  currentRating : Float
  switchingSpeed : Float -- in nanoseconds

default deviceType := "MOSFET"

default voltageRating := 100.0

default currentRating := 10.0

default switchingSpeed := 50.0

structure SwitchingDeviceModelEvidence (D : SwitchingDeviceModel) where
  deviceTypeClosed : D.deviceType = "MOSFET" ∨ D.deviceType = "IGBT" ∨ D.deviceType = "BJT"
  voltageRatingClosed : D.voltageRating > 0.0
  currentRatingClosed : D.currentRating > 0.0
  switchingSpeedClosed : D.switchingSpeed > 0.0

def SwitchingDeviceModelClosed (D : SwitchingDeviceModel) : Prop :=
  (D.deviceType = "MOSFET" ∨ D.deviceType = "IGBT" ∨ D.deviceType = "BJT") ∧
  D.voltageRating > 0.0 ∧ D.currentRating > 0.0 ∧ D.switchingSpeed > 0.0

theorem switching_device_model_closed_from_evidence
    (D : SwitchingDeviceModel) (E : SwitchingDeviceModelEvidence D) :
    SwitchingDeviceModelClosed D := by
  exact And.intro E.deviceTypeClosed
    (And.intro E.voltageRatingClosed
      (And.intro E.currentRatingClosed E.switchingSpeedClosed))

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse