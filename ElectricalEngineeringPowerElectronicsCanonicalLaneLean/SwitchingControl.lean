import PowerElectronicsCanonicalLaneLean.PowerConverterTopology

namespace HautevilleHouse
namespace PowerElectronicsCanonicalLaneLean

structure ModulationScheme where
  schemeName : String
  carrierFrequency : ℕ
  modulationIndex : ℝ
  switchingLossEstimate : ℝ
  harmonicMitigation : Prop
  harmonicMitigationClosed : harmonicMitigation

def ModulationControlClosed (M : ModulationScheme) : Prop :=
  M.harmonicMitigation

theorem modulation_control_closed_from_evidence (M : ModulationScheme) :
    ModulationControlClosed M :=
  M.harmonicMitigationClosed

structure SwitchingControlPackage (O : PowerConverterObject) where
  dutyCycle : ℝ → ℝ  -- function of time
  switchingFrequency : ℕ
  deadTime : ℝ
  gateSignals : List Bool
  controlLawStable : Prop
  controlLawStableClosed : controlLawStable

def SwitchingControlClosed (O : PowerConverterObject) (C : SwitchingControlPackage O) : Prop :=
  C.controlLawStable

theorem switching_control_closed_from_evidence (O : PowerConverterObject) (C : SwitchingControlPackage O) :
    SwitchingControlClosed O C :=
  C.controlLawStableClosed

end PowerElectronicsCanonicalLaneLean
end HautevilleHouse