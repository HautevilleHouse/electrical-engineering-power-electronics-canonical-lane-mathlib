import ElectricalEngineeringPowerElectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure PowerStagePackage where
  semiconductorType : String
  inductorValue : Float
  capacitorValue : Float
  maxCurrent : Float
  maxVoltage : Float
  thermalLimit : Prop
  efficiency : Prop

structure PowerStageEvidence (P : PowerStagePackage) where
  thermalLimitClosed : P.thermalLimit
  efficiencyClosed : P.efficiency

def PowerStageClosed (P : PowerStagePackage) : Prop :=
  P.thermalLimit ∧ P.efficiency

theorem power_stage_closed_from_evidence (P : PowerStagePackage)
    (E : PowerStageEvidence P) : PowerStageClosed P := by
  exact And.intro E.thermalLimitClosed E.efficiencyClosed

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse