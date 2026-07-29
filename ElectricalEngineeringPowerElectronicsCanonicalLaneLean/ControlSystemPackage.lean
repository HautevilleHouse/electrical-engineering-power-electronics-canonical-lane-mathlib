import ElectricalEngineeringPowerElectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure ControlSystemPackage where
  controllerType : String
  bandwidth : Float
  phaseMargin : Float
  gainMargin : Float
  closedLoopStability : Prop
  referenceTracking : Prop

structure ControlSystemEvidence (C : ControlSystemPackage) where
  closedLoopStabilityClosed : C.closedLoopStability
  referenceTrackingClosed : C.referenceTracking

def ControlSystemClosed (C : ControlSystemPackage) : Prop :=
  C.closedLoopStability ∧ C.referenceTracking

theorem control_system_closed_from_evidence (C : ControlSystemPackage)
    (E : ControlSystemEvidence C) : ControlSystemClosed C := by
  exact And.intro E.closedLoopStabilityClosed E.referenceTrackingClosed

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse