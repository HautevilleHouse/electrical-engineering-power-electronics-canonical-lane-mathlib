namespace HautevilleHouse
namespace ElectricalEngineeringPowerElectronicsCanonicalLaneLean

structure SwitchingLossModel where
  switchingFrequency : Float
  turnOnLoss : Float
  turnOffLoss : Float
  conductionLoss : Float
  thermalResistance : Float

structure SwitchingLossModelEvidence (M : SwitchingLossModel) where
  frequencyPositive : M.switchingFrequency > 0
  turnOnLossPositive : M.turnOnLoss > 0
  turnOffLossPositive : M.turnOffLoss > 0
  conductionLossPositive : M.conductionLoss > 0
  thermalResistancePositive : M.thermalResistance > 0
  totalLossFinite : M.turnOnLoss + M.turnOffLoss + M.conductionLoss < Float.inf

def SwitchingLossModelClosed (M : SwitchingLossModel) : Prop :=
  M.switchingFrequency > 0 ∧ M.turnOnLoss > 0 ∧ M.turnOffLoss > 0 ∧
  M.conductionLoss > 0 ∧ M.thermalResistance > 0 ∧
  M.turnOnLoss + M.turnOffLoss + M.conductionLoss < Float.inf

theorem switching_loss_model_closed_from_evidence (M : SwitchingLossModel)
    (E : SwitchingLossModelEvidence M) : SwitchingLossModelClosed M := by
  exact And.intro E.frequencyPositive (And.intro E.turnOnLossPositive
    (And.intro E.turnOffLossPositive (And.intro E.conductionLossPositive
      (And.intro E.thermalResistancePositive E.totalLossFinite))))

end ElectricalEngineeringPowerElectronicsCanonicalLaneLean
end HautevilleHouse