import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure ControlMethod where
  methodName : String
  modulationType : String -- e.g., PWM, PFM, hysteresis
  dutyCycleRange : (Float × Float)
  switchingFrequency : Float

default methodName := "PWM"

default modulationType := "PWM"

default dutyCycleRange := (0.0, 1.0)

default switchingFrequency := 10000.0

structure ControlMethodEvidence (C : ControlMethod) where
  methodNameClosed : C.methodName ≠ ""
  modulationTypeClosed : C.modulationType = "PWM" ∨ C.modulationType = "PFM" ∨ C.modulationType = "Hysteresis"
  dutyCycleRangeClosed : C.dutyCycleRange.1 ≥ 0.0 ∧ C.dutyCycleRange.2 ≤ 1.0 ∧ C.dutyCycleRange.1 < C.dutyCycleRange.2
  switchingFrequencyClosed : C.switchingFrequency > 0.0

def ControlMethodClosed (C : ControlMethod) : Prop :=
  C.methodName ≠ "" ∧
  (C.modulationType = "PWM" ∨ C.modulationType = "PFM" ∨ C.modulationType = "Hysteresis") ∧
  C.dutyCycleRange.1 ≥ 0.0 ∧ C.dutyCycleRange.2 ≤ 1.0 ∧ C.dutyCycleRange.1 < C.dutyCycleRange.2 ∧
  C.switchingFrequency > 0.0

theorem control_method_closed_from_evidence
    (C : ControlMethod) (E : ControlMethodEvidence C) :
    ControlMethodClosed C := by
  refine And.intro E.methodNameClosed ?_
  refine And.intro E.modulationTypeClosed ?_
  refine And.intro E.dutyCycleRangeClosed.1 ?_
  refine And.intro E.dutyCycleRangeClosed.2.1 ?_
  exact And.intro E.dutyCycleRangeClosed.2.2 E.switchingFrequencyClosed

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse