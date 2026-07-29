namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure ControlSystemStability where
  feedbackLoopGain : Float
  phaseMargin : Float
  gainMargin : Float
  bandwidth : Float
  crossoverFrequency : Float

structure ControlSystemStabilityEvidence (C : ControlSystemStability) where
  feedbackLoopGainPositive : C.feedbackLoopGain > 0
  phaseMarginSufficient : C.phaseMargin > 45
  gainMarginSufficient : C.gainMargin > 10
  bandwidthPositive : C.bandwidth > 0
  crossoverFrequencyPositive : C.crossoverFrequency > 0

def ControlSystemStabilityClosed (C : ControlSystemStability) : Prop :=
  C.feedbackLoopGain > 0 ∧ C.phaseMargin > 45 ∧ C.gainMargin > 10 ∧
  C.bandwidth > 0 ∧ C.crossoverFrequency > 0

theorem control_system_stability_closed_from_evidence (C : ControlSystemStability)
    (E : ControlSystemStabilityEvidence C) : ControlSystemStabilityClosed C := by
  exact And.intro E.feedbackLoopGainPositive (And.intro E.phaseMarginSufficient
    (And.intro E.gainMarginSufficient (And.intro E.bandwidthPositive E.crossoverFrequencyPositive)))

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse